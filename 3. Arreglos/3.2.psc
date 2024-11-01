ACCION 3.1(arg : array [1...100] de enteros) ES
    AMBIENTE    
        x, mi, max, cont, pares, variable, D : entero
        

    PROCESO
        cont := 0
        pares := 0
    
        mi := 1         //EN OTROS CASO SERÁ HV 
        max := 1        //EN OTROS CASO SERÁ LV
        
        Para D := 1 hasta 100 hacer
            Si arg[D] < arg[mi] entonces
                mi := D
            Fin Si
            Si arg[D] > arg[max] entonces
                max := D
            Fin Si
            Si ((arg[D] mod 2) = 0) entonces
                pares := pares + arg[D]
                cont := cont + 1
            Fin Si
        Fin Para
Fin ACCION