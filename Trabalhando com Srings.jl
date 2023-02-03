VERSION

# Trabalhando com Strings ou Chars in Julia

var = "Strings"

typeof(var)

Char(120)

# Comparações entre Strings pelo ASCII/Unicode

"A" < "a"

text = "This is a \
long line of script"

# Localização em Strings

var = "Hello World!"

var[1] # Os arrays em Julia começam em 1

var[end] # Indica o final

var[1: 5] # Sequência de valores incluindo o primeiro e o ultimo valor

var = string("Hello", " ", "World", "!")

x = "Oi"
y = "Tchau"

"$x, $y"

println("$x, $y")

show("$x, $y")

# Comparações entre Textos

"abracadabra" == "xylophone"

"Hello, world." != "Goodbye, world."

"1 + 2 = 3" == "1 + 2 = $(1 + 2)"

# Funções de Strings

findfirst("l", "Hello World!") # Localiza o Index do Primeiro Caracter
findlast("l", "Hello World!") # Localiza o Index do Ultimo Caracter

findnext('o', "xylophone", 1) # Localiza Index do Proximo Caracter
findprev('o', "xylophone", 5) # Localiza Index do Caracter Anterior

occursin("o", "Xylophon") # Verifica a Existencia Restrita do Caracter

repeat("--", 20) # Reescreve o valor
join(["apples", "bananas", "pineapples"], ";") # Junta Valores

match(r"^\s*(?:#|$)", "# a comment") # Varifica existencia ampla

# Outras Funções

using Dates # Importando Biblioteca

data = Date(1962,7,10) # Definindo Data por Ano - Mês - Dia

Regex("Day " * string(day(data)))

# Valor Real

println(raw"\\ \\\"")