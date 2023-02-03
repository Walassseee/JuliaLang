@time VERSION

# Controle de Fluxo em Julia

var = begin # Expressão Composta
    x = 1
    y = 2
    x + y
end

var = (x = 1; y = 2; x + y)

var = begin x = 1; y = 2; x + y end

# Avaliação Condicional

x = 5

if x < 10
    println("Yes")
elseif x > 10
    println("No")
else
    nothing
end

# Avaliação de Condicional

x = 10; y = 15

if x > 5 && y < 20 # Condicional "E"
    println("Yes")
else
    nothing
end

if x > 20 || y < 20 # Condicional "OU"
    println("Yes")
else
    nothing
end

# Controles de Loops

const constante = 1; # Criando uma constante

var = 10;

while var < 21 # Loop Enquanto Verdadeiro
    println(var)
    global var += 1
end

for i in 1:5 # Loop para Range definido
    println(i)
end

# Break

var = 10;

while var < 21 # Loop Enquanto Verdadeiro com Break no 15
    println(var)
    if var >= 15
        break
    end
    global var += 1
end

for i = 1:1000 # Loop para Range definido e Break no 5
    println(i)
    if i >= 5
        break
    end
end

# Continue ou Pule

for i = 1:10
    if i % 3 != 0
        continue
    end
    println(i)
end

# Manipulando Excessões ou ERROS (TRY / CATCH)

function Quadrado(x)
    try
        sqrt(x)
    catch
        println("You should have entered a numeric value")
    end
end

Quadrado("ten")
Quadrado(10)

# Seguindo Caso Haja ERROS (Finally)

try
    # Operation
finally
    # Finally
end

