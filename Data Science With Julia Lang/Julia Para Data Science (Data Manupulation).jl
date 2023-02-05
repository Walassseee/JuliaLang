using Pkg
pkg"add DataFrames"
pkg"add CSV"
pkg"add Tables" 
pkg"add Query"

using CSV
using DataFrames
using Statistics
using Tables
using CategoricalArrays
using Random
using Query
pkg"status DataFrames"
# pkg"test DataFrames"

# Criando DataFrames

dados = DataFrame(
    col1 = 1:3,
    col2 = 5:7,
    fixed = 1
)

dados = DataFrame("customer age" => [15, 20, 25],
                    "first name" => ["Rohit", "Rahul", "Akshat"])

# DataFrames de Dicionarios

dict = Dict("customer age" => [15, 20, 25],
"first name" => ["Rohit", "Rahul", "Akshat"])
DataFrame(dict)

DataFrame((a = [1, 2], b = [3, 4]))

# DataFrames de Matrizes

x = [10 20 40 50;
     15 58 69 41;
     23 21 26 69]

y = ["ColA","ColB","ColC","ColD"]

DataFrame(x, y)

# DataFrames de Arquivos CSV

dados = CSV.read("C:\\Users\\brcpwmftomaz\\OneDrive - Oregon Tool\\Documents\\GitHub\\EstudosDataScience\\JuliaLang\\Dados.csv", DataFrame) # Lê arquvio CSV

UF = copy(dados.UF) # Copia a Coluna UF

dados[!, "UF"] # Seleciona todas as linhas da coluna UF

names(dados) # Mostra os nomes das Colunas

eltype.(eachcol(dados)) # Mostra os Typos das Colunas

empty(dados) # Limpa uma cópia do DataFrame
dados

empty!(dados) # Limpa o DataFrame real
dados = CSV.read("C:\\Users\\brcpwmftomaz\\OneDrive - Oregon Tool\\Documents\\GitHub\\EstudosDataScience\\JuliaLang\\Dados.csv", DataFrame)

size(dados) # Tamanho do DataFrame
nrow(dados) # Qtde de linhas
ncol(dados) # Quantidade de Colunas

# Análise Descritiva Quantitativa

describe(dados)

show(dados, allcols = true)

mean(dados.Idade)
median(dados.Idade)
std(dados.Idade)
var(dados.Idade)

cor(dados.Idade, dados.Renda)
cov(dados.Idade, dados.Renda)

# Funções em Colunas

mapcols(UF -> UF .^ 2, dados)

# Primeiros e Ultimos valores

first(dados, 5)
last(dados, 5)

dados[1:5, [:UF, :Renda]]

@view dados[2, 2]

x = 1:76840

dados.UF = x
first(dados, 5)

dados.UF === x # Mais Performatico

# Inserir colunas novas

insertcols(dados, :Country => "Brazil")

dados[:, Not(:UF)]
dados[:, Between(:Idade, :Renda)]

combine(dados, :Idade => mean => :MeanIdade)
select(dados, :Idade => mean => :MeanIdade)

# Modeificação Por linhas

select(dados, :Renda, :Renda => ByRow(sqrt))

# Colunas iniciadas Por

select(dados, r"R", r"U")

copia = copy(dados)

transform(copia, :Sexo => :UF, :UF => :Sexo)

# Comandos Importantes

vazio = DataFrame(col = Int64[]) # Dados Vazios
push!(vazio, [10])

Tables.rowtable(dados) # Converte para Linhas Novamente

DataFrame(A = 1:2:1000, B = repeat(1:10, inner = 50), C = 1:500)

# Variáveis Categóricas

x = DataFrame(a = 1:2, b = [1.0, missing], c = categorical('a':'b'), d = [1//2, missing])

# Filtros de DataFrame

dados[dados.Renda .> 1200, :]

dados[(dados.Renda .> 1500) .& (20 .< dados.Idade .< 40), :]

Random.seed!(1);

DataFrame(rand(10, 3), [:a, :b, :c])

# Ordenando Dados

sort!(dados)

# Replace

replace!(x.b, missing => 1.0)
x

allowmissing!(x)

# Joins

people = DataFrame(ID=[20, 40], Name=["John Doe", "Jane Doe"])
jobs = DataFrame(ID=[20, 40], Job=["Lawyer", "Doctor"])

innerjoin(people, jobs, on = :ID)
leftjoin(people, jobs, on = :ID)
rightjoin(people, jobs, on = :ID)
crossjoin(people, jobs, makeunique = true)

# Group By

groupby(dados, :UF)

# Transpondo DataFrame

y = DataFrame(a = ["x", "y"], b = [1, "two"], c = [3, 4], d = [true, false])
permutedims(y, 1, "different_name")

# Ordenando valores

sort!(dados, rev = true)
sort!(dados, [order(:UF, by = length), order(:Renda, rev = true)])

dropmissing(x, :)

# Usando o Query

dados = DataFrame(name = ["John", "Sally", "Roger"], age = [54.0, 34.0, 79.0], children = [0, 2, 4])

view = @from i in dados begin
    @where i.age > 40
    @select {number_of_children =i.children, i.name}
    @collect DataFrame
end