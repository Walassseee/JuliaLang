#--------------------------------------------------------------------------------------------------------Configurações
using Pkg
pkg"add DataFrames"
pkg"status DataFrames"
#-----------------------------------------------------------------------------------------------------Dados Utilizados

using DataFrames

x = [2,2,2,3,3,3,4,4,4]
y = [0.1,0.1,0.2,0.2,0.3,0.3,0.3,0.4,0.4]

module Econometrics

    #-----------------------------------------------------------------------------------------------------------------
    # Média Aritimética
    #-----------------------------------------------------------------------------------------------------------------

    function ArithmeticMean( Values::AbstractArray )
        return sum( Values ) / length( Values )
    end

    #-----------------------------------------------------------------------------------------------------------------
    # Média Ponderada
    #-----------------------------------------------------------------------------------------------------------------

    function WeightedMean( Values::AbstractArray , Weight::AbstractArray )
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

    #-----------------------------------------------------------------------------------------------------------------
    # Média Geométrica (Índice de Fischer)
    #-----------------------------------------------------------------------------------------------------------------

    function GeometricMean( Values::AbstractArray )
        return sum( Values ) ^ (1 // length( Values ))
    end

    #-----------------------------------------------------------------------------------------------------------------
    # Mediana
    #-----------------------------------------------------------------------------------------------------------------

    function Median( Values::AbstractArray )
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

    #-----------------------------------------------------------------------------------------------------------------
    # Moda Estatistica
    #-----------------------------------------------------------------------------------------------------------------

    function Mode( Values::AbstractArray )
        FrequencyTable = DataFrame("Values" => unique( Values ))
        FrequencyTable = insertcols(FrequencyTable, :Frequency => [count( i -> (i == Value), x) for Value in FrequencyTable.Values])
        return FrequencyTable.Values[FrequencyTable.Frequency .== maximum(FrequencyTable.Frequency)]
    end

    #-----------------------------------------------------------------------------------------------------------------
    # Variância
    #-----------------------------------------------------------------------------------------------------------------

    function Variance( Values::AbstractArray )
        DistanceOfMean = []

        for Value in Values
            pushfirst!( DistanceOfMean ,(Value - ArithmeticMean( Values )) ^ 2)
        end
        return sum(DistanceOfMean) / (length( Values ) - 1)
    end

    #-----------------------------------------------------------------------------------------------------------------
    # Desvio Médio Absoluto
    #-----------------------------------------------------------------------------------------------------------------

    function AbsoluteAverageDeviation( Values::AbstractArray )
        DistanceOfMean = []

        for Value in Values
            pushfirst!( DistanceOfMean , abs(Value - ArithmeticMean( Values )))
        end
        return sum(DistanceOfMean) / length( Values )
    end

    #-----------------------------------------------------------------------------------------------------------------
    # Desvio Padrão
    #-----------------------------------------------------------------------------------------------------------------

    function StanderdDeviation( Values::AbstractArray )
        return sqrt( Variance( Values ) )
    end

#---------------------------------------------------------------------------------------------------------------------    
end