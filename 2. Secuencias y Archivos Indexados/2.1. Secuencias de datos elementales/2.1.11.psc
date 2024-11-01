"Ejercicio 2.1.11¶
Dada una secuencia de caracteres, determinar la cantidad de palabras de 4 caracteres (letras)"

ACCION 2.1.11() es
    AMBIENTE
        S: Secuencia de caracteres
        V: Caracter
        C1, C2: Entero
    PROCESO
        ARRANCAR(S)
        AVZ(S, V)
        C1 := 0
        C2 := 0
        Mientras NFDS(S) hacer
            Mientras V <> " " y NFDS(S) hacer
                C1 := C1 + 1
                AVZ(S, V)
            Fin Mientras
            Si C1 = 4 entonces
                C2 := C2 + 1
            Fin Si
            Si V = " " entonces
                AVZ(S, V)
            Fin Si
            C1 := 0
        Fin Mientras
        Escribir("La cantidad de palabras de 4 caracteres son:", C2)
        Cerrar(S)
Fin ACCION


