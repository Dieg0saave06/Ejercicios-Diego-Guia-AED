"Ejercicio 2.1.9¶
Se dispone de una secuencia de caracteres. Se desea determinar la cantidad de palabras que comienzan con la letra 'I'."


ACCION 2.1.9() es
    AMBIENTE
        S: Secuencia de caracteres
        V: Caracter
        C: Entero
    PROCESO
        ARRANCAR(S)
        AVZ(S, V)
        C:= 0
        Mientras NFDS(S) hacer
            Si V = "I" entonces
                C := C + 1
            Fin Si
            Mientras V <> " " y NFDS(S) hacer
                AVZ(S, V)
            Fin Mientras
            Si V = " " entonces
                AVZ(S, V)
            Fin Si
        Fin Mientras
        Escribir("La cantidad de palabras que empiezan con 'I' es: ", C," veces.")
        Cerrar(S)
Fin ACCION
