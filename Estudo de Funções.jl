VERSION

# Estudo de Elaborações de Funções

function f(x) # Criando função generica
    ℯ^x
end

f(2)

f(x, y) = ℯ^x

f(4)

# Funções de Caracteres UniCode

∑(x,y) = x + y

∑(2,3)

# Retorno da Função

function g(x,y)
    return x * y # Retorna função
end

g(2,3)

function g(x,y)
    x * y    
    return nothing # Retona Nada
end

g(2,3)

# Operadores Especiais

x = [1,4,3] # Criando Vector

hcat(x) # Retorna formato da matriz
vcat(x) # Retona formato do vactor

getindex(x, 2) # Pegando Index do Valor
setindex!(x, 4, 1) # Definindo Index do Valor

# Funções Nativas

x = [1,2,3,5,7,11,13]

y = map(x -> x + 1, x)

println(y)

# Funções não nomeadas

(x, y, z) -> x^2 + y - z

# Tuplas

(1, 2, 3)

x = (1, 2, 3)

typeof(x)

# Tuplas nomeadas

x = (a = 10, b = 5)
x[1]

# Tupla de Range

(a, b, c) = 1:3

a

# Desestruturação de Argumentos

minmax(x, y) = (y < x) ? (y, x) : (x, y)
gap((min, max)) = max - min

# Funções de Varargs

bar(a,b,x...) = (a,b,x)

bar(1,2)
bar(1,2,3)
bar(1, 2, 3, 4)

# Argumentos Opcionais

typeof(pi)

function f(x::Int64, y::Irrational = pi)
    return y ^ x
end

x = f(2)