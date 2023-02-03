# Primeiro código em Julia no VSCode

println("Hello World")

# Variáveis em Julia

x = "Hello World"

var = 10
δ = 0.00001

# Julia Reconhece Simbulos Nativamente e Trabalha com a Escala Ciêntifica.

pi

sqrt(2)

# Tipos de Variáveis Numéricas

Int8
Int64
Float64
Bool

UInt # Para valores complexos

# Função Typeof()

typeof(25)
typeof(2.5)
typeof(false)

typeof(0x0111)

# Infinito no Julia

1 / Inf
1 / 0

# Coeficientes Literais

x = 3

2x^2 - 3x + 1 # Não foi necessário informar uma operação

# Operadores Aritiméticos

x = 3
y = 2

+x # Valor Positivo
-x # Valor Negativo

x + y # Soma
x - y # Diferença
x * y # Produto
x / y # Quociente
x ^ y # Expoente
x ÷ y # Quociente Inteiro
x % y # Quociente Restante

# Operadores Booleanos

# !x (Condição "negativa a X")
# x && y (Condição "E")
# x || y (Condição "OU")

# Atualização de Valor

y += 1
x -= 1

# Comparações

x == y
x != y

x > y
x >= y

x < y
x <= y

# Especiais

NaN
false
true

# Funções de comparação

isequal(x, y)
isfinite(Inf)
isinf(x)
isnan(NaN)

# Sintaxe continua

x = 3; 2x^2

# Conversões

Int8(127.0)

# Funções Numéricas

round(2.75)

x = 3
y = 2

div(x,y) # Divisão
rem(x,y) # Restante

gcd(x,y) # MMC
lcm(x,y) # MMC

abs(-3) # Módulo |x|
abs2(-3) # Valor Quadrado

sqrt(4) # Raiz Quadrada
cbrt(27) # Raiz Cubica
hypot(x, y) # Hipotenusa de x, y
exp(x) # Exponecial de X

log(x) # Log e de X
log2(x) # Log 2 de x
log10(x) # Log 10 de X

# Funções Trigonométricas

cos(x) # Cosseno
sin(x) # Seno
tan(x) # Tangente

cot(y) # Cotangente
sec(y) # Secante
csc(y) # Cossecante

# Números complexos

im

sqrt(1im)

# Números Raionais

var = 5 // 2

numerator(var)
denominator(var)

2//3 == 6//9
2//3 == 9//27