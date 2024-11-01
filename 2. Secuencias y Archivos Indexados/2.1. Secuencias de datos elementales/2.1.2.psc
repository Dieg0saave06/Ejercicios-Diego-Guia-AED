"Ejercicio 2.1.2¶
Dada una secuencia de letras del alfabeto que finaliza con la letra "Z", contar cuantas consonantes hay en la secuencia."

ACCION 2.1.2() ES
    AMBIENTE
        S : Secuencia de Caracteres
        V : Caracter
        vocales : ["a", "e", "i", "o", "u"]
        c : entero

    PROCESO
    ARRANCAR(S)
    AVZ(S, V)
    c := 0
    Mientras V <> "Z" hacer
        Si  V <> vocales entonces   
            c := c + 1
        Fin Si
        AVZ(S, V)
    Fin Mientras
    Escribir("Hay ", c, " consonantes en la secuencia.")
    Cerrar(S)
Fin ACCION
