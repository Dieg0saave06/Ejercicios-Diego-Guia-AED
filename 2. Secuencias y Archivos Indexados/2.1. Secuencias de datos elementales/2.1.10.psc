"Ejercicio 2.1.10¶
Se dispone de una secuencia de caracteres. Se desea permita contar la cantidad de palabras que comienzan con una letra dada."

ACCION 2.1.10() es
    AMBIENTE
        S: Secuencia de caracteres
        V, a: Caracter
        C: Entero
    PROCESO
        Escribir("Ingrese una letra: ")
        Leer(a)
        ARRANCAR(S)
        AVZ(S, V)
        C:= 0
        Mientras NFDS(S) hacer
            Si V = a entonces
                C := C + 1
            Fin Si
            Mientras V <> " " y NFDS(S) hacer
                AVZ(S, V)
            Fin Mientras
            Si V = " " entonces
                AVZ(S, V)
            Fin Si
        Fin Mientras
        Escribir("La cantidad de palabras que empiezan con ", a," es ", C," veces.")
        Cerrar(S)
Fin ACCION
