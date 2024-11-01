"Ejercicio 2.1.13¶
A partir del ejercicio anterior, determinar el porcentaje que representan las palabras que comienzan con "ALG" sobre todas las palabras de la secuencia."

ACCION 2.1.13() ES
    AMBIENTE
        S: Secuencia de caracteres
        V: Caracter
        C, CALG, CP: Entero 
        porcentaje: Real    
    PROCESO
        ARRANCAR(S)
        AVZ(S, V)
        C := 0 
        CP := 0
        porcentaje := 0
        Mientras NFDS(S) hacer
            Si V = "A" entonces
                AVZ(S, V)
                Si V = "L" entonces
                    AVZ(S, V)
                    Si V = "G" entonces
                        C := C + 1
                    Sino
                        CP := CP + 1
                    Fin Si
                Sino
                    CP := CP + 1
                Fin Si
            Sino
                CP := CP + 1
            Fin Si
            Mientras V <> " " hacer
                AVZ(S, V)
            Fin Mientras
            Si V = " " entonces           
                AVZ(S, V)
            Fin Si
        Fin Mientras
        CP := CP + C
        porcentaje := (C / CP) * 100 
        Escribir("el porcentaje de las palabras que comienzan con 'ALG' con respecto a todas las palabras de la secuencia es:", porcentaje)
        Cerrar(S)
Fin ACCION
