using Pkg
pkg"add Plots"
pkg"add LaTeXStrings"
pkg"add StatsPlots"
pkg"add DataFrames"
pkg"add Distributions"
pkg"add Random"

# Bibliotecas Complementares
using LaTeXStrings
using DataFrames
using Random, Distributions

# Bibliotecas Gráficas
using Plots
using StatsPlots

# Gráficos Simples de Linha

x = range(0, 10, length = 100);
cosseno = map(cos, x);
plot(x, [cosseno])

seno = map(sin, x);
plot(x, [cosseno, seno])

# Salvando Gráficos

diferenca = @. sin(x)^2 - 1/2;
plot!(x, diferenca)
savefig("myplot.png") 

# Atributos dos Gráficos

plot(
    x, [cosseno, seno] ,
    title = "Título", # Titulo
    label = ["Sin(x)" "Cos(x)"], # Legenda Separada por Espaços
)

# Plots Mais Completos

x = range(0, 10, length = 100);
y1 = sin.(x);
y2 = cos.(x);
y3 = @. sin(x)^2 - 1/2;

plot(x, [y1 y2],
label = ["sin(x)" "cos(x)"],
lw = [2 1]) # Tamanho das Linhas

plot!(x, y3, label = "sin(x)^2 - 1/2", lw = 3, ls = :dot) # Ultimo PLot
plot!(legend = :outerbottom, legendcolumns = 3)
xlims!(0, 2pi)
title!("Trigonometric functions")
xlabel!("x")
ylabel!("y")

# Gráficos em Escala Logaritimica

x = 10 .^ range(0, 4, length = 100);
y = @. 1 / (1 + x);

plot(x, y, label = "1/(1+x)")
plot!(xscale = :log10, yscale = :log10, minorgrid = true)
xlims!(1e+0, 1e+4)
ylims!(1e-5, 1e+0)
title!("Log-log plot")
xlabel!("x")
ylabel!("y")

# Gráficos de Dispersão

x = range(0, 10, length = 100);
y = sin.(x);
y_noisy = @. sin(x) + 0.1 * randn();

plot(x, y, label = "sin(x)")
plot!(x, y_noisy, seriestype = :scatter, label = "data")

# Propriedades do Gráfico de Dispesão

# lc = line color; lw = line width
# mc = marker color; ms = marker size; ma = marker alpha

plot(x, y, label = "sin(x)", lc = :black, lw = 2)
scatter!(x, y_noisy, label = "data", mc = :red, ms = 2, ma = 0.5)
plot!(legend = :bottomleft)
title!("Sine with noise")
xlabel!("x")
ylabel!("y")

# Multiplos Gráficos

x = range(0, 10, length = 100);
y1 = @. exp(-0.1x) * cos(4x);
y2 = @. exp(-0.3x) * cos(4x);
y3 = @. exp(-0.5x) * cos(4x);
plot(x, [y1 y2 y3], layout = (3, 1), legend = false)

x = range(0, 10, length = 100);
y1 = @. exp(-0.1x) * cos(4x);
y2 = @. exp(-0.3x) * cos(4x);
y3 = @. exp(-0.1x);
y4 = @. exp(-0.3x);
y = [y1 y2 y3 y4];

p1 = plot(x, y)
p2 = plot(x, y, title = "Title 2", lw = 3)
p3 = scatter(x, y, ms = 2, ma = 0.5, xlabel = "xlabel 3")
p4 = scatter(x, y, title = "Title 4", ms = 2, ma = 0.2)
plot(p1, p2, p3, p4, layout = (2,2), legend = false)

# Gráficos com Simbulos LaTeXStrings

x = 10 .^ range(0, 4, length = 100);
y = @. 1/(1+x);

plot(x, y, label = L"\frac{1}{1+x}")
plot!(xscale = :log10, yscale = :log10, minorgrid = true)
xlims!(1e+0, 1e+4)
ylims!(1e-5, 1e+0)
title!(L"Log-log plot of $\frac{1}{1+x}$")
xlabel!(L"x")
ylabel!(L"y")

# Graficos de DataFrames

dados = DataFrame(coluna_a = 1:10, coluna_b = 10 * rand(10), coluna_c = 10 * rand(10))
@df dados plot(:coluna_a, [:coluna_b, :coluna_c])

@df dados scatter(:coluna_a, :coluna_b, title = "My DataFrame Scatter Plot!")

# Gráficos de Histograma

plot(Normal(3, 5), lw = 3)

# Gráfico de Violino

y = rand(100, 4)
violin(["Series 1" "Series 2" "Series 3" "Series 4"], y, legend = false)

# Gráfico BoxPlot

boxplot!(["Series 1" "Series 2" "Series 3" "Series 4"], y, legend = false)