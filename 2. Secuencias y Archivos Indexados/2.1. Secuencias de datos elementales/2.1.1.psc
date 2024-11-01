"Ejercicio 2.1.1¶
Dada una secuencia de letras del alfabeto que finaliza con una marca '*', contar cuantas letras "A" hay en la secuencia."


ACCION maximaleta() es
    AMBIENTE    
        S: Secuencia de caracteres
        V: caracter
        C: Entero
    PROCESO
        ARRANCAR(S)
        AVZ(S, V)
        C:= 0
        Mientras V <> "*" hacer
            Si V = A entonces   
                C := C + 1
            Fin Si
            AVZ(S, V)
        Fin Mientras
        Escribir("Hay ", C," letras 'A' en la secuencia")
        Cerrar(S)    
Fin ACCION