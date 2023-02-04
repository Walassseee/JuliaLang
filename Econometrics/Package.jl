#----------------------------------------------------------------------------------------------------Configurações
using Pkg
pkg"add DataFrames"
#-------------------------------------------------------------------------------------------------Dados Utilizados

using DataFrames

x = [2,2,2,3,3,3,4,4,4]
y = [0.1,0.1,0.2,0.2,0.3,0.3,0.3,0.4,0.4]

#-----------------------------------------------------------------------------------------------------------------
# Média Aritimética
#-----------------------------------------------------------------------------------------------------------------

function ArithmeticMean( Values )
    return sum( Values ) / length( Values )
end

ArithmeticMean(x)

#-----------------------------------------------------------------------------------------------------------------
# Média Ponderada
#-----------------------------------------------------------------------------------------------------------------

function WeightedMean( Values , Weight )
    WeightedValuesList = []
    
    if length( Values ) === length( Weight )
        for ( index, value ) in enumerate( Values )
            WeightedValues = (value * Weight[index])
            pushfirst!( WeightedValuesList , WeightedValues)
        end
    else
        println("Error")
    end
    return sum( WeightedValuesList ) / sum( Weight )
end

WeightedMean(x, y)

#-----------------------------------------------------------------------------------------------------------------
# Média Geométrica (Índice de Fischer)
#-----------------------------------------------------------------------------------------------------------------

function GeometricMean( Values )
    return sum( Values ) ^ (1 // length( Values ))
end

GeometricMean(x)

#-----------------------------------------------------------------------------------------------------------------
# Mediana
#-----------------------------------------------------------------------------------------------------------------

function Median( Values )
   if length( Values ) % 2 != 0 # Impar
    sort( Values )
    MedianPoint = (length( Values ) + 1) / 2
    Value = Values[Int(MedianPoint)]
   else # Par
    sort( Values )
    MedianPoint = length( Values ) / 2
    Value = ArithmeticMean(Values[[Int(MedianPoint), Int(MedianPoint) + 1]])
   end
   return Value
end

Median(x)

#-----------------------------------------------------------------------------------------------------------------
# Moda Estatistica
#-----------------------------------------------------------------------------------------------------------------

function Mode( Values )
    FrequencyTable = DataFrame("Values" => unique( x ))
    FrequencyTable = insertcols(FrequencyTable, :Frequency => [count( i -> (i == Value), x) for Value in FrequencyTable.Values])
    return FrequencyTable.Values[FrequencyTable.Frequency .== maximum(FrequencyTable.Frequency)]
end

Mode(x)

#-----------------------------------------------------------------------------------------------------------------
# Variância
#-----------------------------------------------------------------------------------------------------------------






