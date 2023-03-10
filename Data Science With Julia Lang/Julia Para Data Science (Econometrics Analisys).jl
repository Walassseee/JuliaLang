using Pkg;
using Markdown
using LaTeXStrings

"""
Markdown de início. Projeto econométrico final UFPR.
"""

using CSV
using DataFrames
using Statistics

"""
Bibliotecas para análise descritiva dos dados.
"""

# Importando dados CSV
dados = CSV.read("C:\\Users\\walas\\OneDrive\\Documentos\\GitHub\\JuliaLang\\Dados.csv", DataFrame);

# Colunas da base de dados
names(dados)

# Tamanho da base de dados
size(dados)

# Tipos de variáveis de cada coluna
eltype.(eachcol(dados))

# Descrisão inícial dos dados
describe(dados)

"""
Analisando inicialmente os dados temos colunas que não estão com os tipos corretos e seus dados não estão bem estruturados.
A titúlo de exemplo as colunas "UF","Sexo" e "Cor" devem ser colunas categóricas.
"""

"""
Processo de ETL dos dados.
"""

dados.Sexo = string.(dados.Sexo);
dados.UF = string.(dados.UF);
dados.Cor = string.(dados.Cor);

describe(dados)

replace!(dados.Sexo, "0" => "Masculino", "1" => "Feminino");

replace!(dados.UF, 
        "11" => "RO", 
        "12" => "AC",
        "13" => "AM",
        "14" => "RR",
        "15" => "PA",
        "16" => "AP",
        "17" => "TO",
        "21" => "MA",
        "22" => "PI",
        "23" => "CE",
        "24" => "RN",
        "25" => "PB",
        "26" => "PE",
        "27" => "AL",
        "28" => "SE",
        "29" => "BA",
        "31" => "MG",
        "32" => "ES",
        "33" => "RJ",
        "35" => "SP",
        "41" => "PR",
        "42" => "SC",
        "43" => "RS",
        "50" => "MS",
        "51" => "MT",
        "52" => "GO",
        "53" => "DF");

replace!(dados.Cor, 
"0" => "Indígena",
"2" => "Branca",
"4" => "Preta",
"6" => "Amarela",
"8" => "Parda",
"9" => "Sem declaração");

describe(dados)

"""
Análise de distribuição de frequência das variáveis.
"""

pkg"add FreqTables"
using FreqTables

freqtable(dados, :Sexo)
prop(freqtable(dados, :Sexo)) * 100

freqtable(dados, :UF)
prop(freqtable(dados, :UF)) * 100

freqtable(dados, :Cor)
prop(freqtable(dados, :Cor)) * 100

"""
Análise gráfica dos dados.
"""

using Plots
using StatsPlots

# Variáveis qualitativas
pie(names(freqtable(dados, :Sexo)), freqtable(dados, :Sexo), title = "Distribuição dos sexos", l = 0.5)
bar(names(freqtable(dados, :UF)), prop(freqtable(dados, :UF)) * 100, title = "Distribuição dos estados", xrotation = 0, xtickfont = font(5), legend = false, l = 0.5)
pie(names(freqtable(dados, :Cor)), freqtable(dados, :Cor), title = "Distribuição das cores", l = 0.5)

# Variáveis quantitativas
histogram(dados.Idade, bins = 20, title = "Distribuição das idades", l = 0.5, legend = false)
histogram(dados.Renda, bins = 20, title = "Distribuição das rendas", l = 0.5, legend = false)
histogram(dados.Altura, bins = 20, title = "Distribuição das alturas", l = 0.5, legend = false)

"""
Análise descritiva de dados conjutos.
"""

cov(Matrix(dados[:, [:Idade, :Renda, :Altura]]))
cor(Matrix(dados[:, [:Idade, :Renda, :Altura]]))

"""
Inferência estatística com modelo MQO.
"""

pkg"add StatsModels"
pkg"add GLM"
pkg"add Pingouin"
using StatsModels
using GLM
using Pingouin

# Teste de normalidade da distribuição
plot(qqnorm(dados.Idade, qqline = :R))

# Teste Anderson de normalidade
Pingouin.anderson(dados.Idade, "norm")

# Teste de Shapiro-Wilk
Pingouin.normality(dados.Idade)

inferencia = @formula(Renda ~ Idade);
@time MQO = lm(inferencia, dados)

# Resultado R2
r2(MQO)

# Previsão & Resíduos
predict(MQO)
residuals(MQO)

"""
Testes de eficiência do modelo MQO. (Heterocedasticidade)
"""

pkg"add HypothesisTests"
using HypothesisTests

# Aleatoriedade e variância constante dos resíduos
scatter(predict(MQO), residuals(MQO))
scatter(predict(MQO), residuals(MQO).^2)

# Normalidade dos resíduos
histogram(residuals(MQO), bins = 20, title = "Normalidade dos resíduos", l = 0.5, legend = false)

# Teste formal de Heterocedasticidade White e Pagan

insertcols!(dados, :Constante => 1) # Adicionando uma constante a matriz

HypothesisTests.BreuschPaganTest(Matrix(dados[:, [:Idade, :Renda, :Constante]]), residuals(MQO))

HypothesisTests.WhiteTest(Matrix(dados[:, [:Idade, :Renda, :Constante]]), residuals(MQO), type = :White)

HypothesisTests.WhiteTest(Matrix(dados[:, [:Idade, :Renda, :Constante]]), residuals(MQO), type = :linear_and_squares)

"""
Corrigindo heterocedasticidade com matriz de covariância (Erros padrões robustos)
"""

pkg"add CovarianceMatrices"
pkg"add BenchmarkTools"
using CovarianceMatrices
using BenchmarkTools

inferenciaH = @formula(Idade ~ Renda);
@btime MQOH = glm(inferenciaH, dados, Normal(), IdentityLink())
vcov(CRHC1(:Idade, dados), MQOH)
stderror(CRHC1(:Idade, dados), MQOH)