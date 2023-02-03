# Escopo de Variáveis (Globais e Locais)

module Bar # Cria um modulo para importação
    x = pi
    f() = x
end;

import .Bar

x = 1

# Variáveis Locais

begin
    local x = 0
    @show x
end

@show x;

# Variáveis Globais

@isdefined(x)

var = 0

for i = 1:10
    global var += i
end

@show var

# Funções Extras

let x = 1
    let x = 2
    end
    x
end

let
    local x = 1
    @show x
    let
        local x = 2
        @show x
    end
    @show x
end

# Constantes

const e  = 2.71828182845904523536;