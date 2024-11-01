"Ejercicio 2.1.14¶
Se dispone de una secuencia de caracteres y se desea saber la cantidad de caracteres (incluidos los espacios) que existen entre una coma y la siguiente. 
Se debe considerar que puede haber más de un par de comas, y que las subsecuencias inicial y final deben descartarse por no cumplir la condición enunciada. 
Supóngase que las comas son siempre contiguas al último caracter de la palabra."

ACCION 2.1.14() ES 
    AMBIENTE 
        S : Secuencia de caracteres 
        V : caracter 
        cont : entero


    PROCESO 
        ARRANCAR(S)
        AVZ(S, V)
        cont := 0 ; cont2 := 0
        Mientras NFDS(S) hacer 
            Si V <> "," entonces 
                Mientras V <> "," hacer 
                    AVZ(S, V)
                Fin Mientras 
            Fin Si 
  
            Si V = "," entonces 
                AVZ(S, V)
                    Si V = " " entonces 
                       Mientras V <> "," hacer 
                           cont := cont + 1
                           AVZ(S, V)
                       Fin Mientras 
                       Si V = "," entonces 
                           Escribir("cantidad caracteres: ", cont)
                           cont2 := cont2 + cont
                       Fin Si
                    Fin Si
            Fin Si
            cont := 0
        Fin Mientras
        Escribir("Total de caracteres entre comas: ", cont2)
        cerrar(S)
Fin ACCION
