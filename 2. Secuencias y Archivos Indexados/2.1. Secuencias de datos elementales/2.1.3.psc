"Ejercicio 2.1.3¶
Se dispone de una secuencia de caracteres y se desea obtener una secuencia de salida que resulte 
de copiar la secuencia de entrada, descartando el caracter "$"."

ACCION 2.1.3() es
    AMBIENTE
        S, SS: Secuencia de caracteres
        V: Caracter
    Proceso
        ARRANCAR(S)
        CREAR(SS)
        AVZ(S, V)
        Mientras NFDS(S) hacer
            Si V <> "$" entonces
                Escribir(SS, V)
            Fin Si
            AVZ(S, V)
        Fin Mientras
        Cerrar(S)
        Cerrar(SS)
Fin ACCION
