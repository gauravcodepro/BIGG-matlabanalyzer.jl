#!usr/bin/env julia
# Author Gaurav
# Universitat Potsdam
# Date 2024-6-19
# A julia function to get the keysvalue search across the matlabfile
# iterate over the keys and store them into a String[] array and the values as UInt8 bit.
# Pkg.add("MAT")

using MAT
function readmatlab(matlabfile,description, keysvalue)
    if matlabfile && description && !keysvalue
        readfile = read(matopen(matlabfile))
        matdescription = description
        for i in keys(readfile[matdescription])
            println(i)
        end
    end
    if matlabfile && description && keysvalue
        readfile = read(matopen(matlabfile))
        matkeys = keys(readfile[matdescription])
        matdescription = description
        matkeysiter = String[]
        for i in matkeys
            push!(matkeysiter,i)
        end
        matkeysString = ["mets", "grRules", "subSystems", "metFormulas", "metNames", "rxnNames", "rxns", "genes" ]
        matkeysInt = ["c", "b","rev", "rxnGeneMat", "S", "lb", "metcharge", "ub"]
        if keyvalue in matkeysString
            matkeyString = String[]
            for i in values(readfile[matdescription][keysvalue])
                push!(matkeyString, i)
            end
        end
        if keyvalue in matkeysInt
            matkeyString = AbstractArray{T,N}
            for i in values(readfile[matdescription][keysvalue])
                push!(matkeyString, i)
            end
        end
    end
end
