"La secuencia de socios del problema anterior tiene el inconveniente de que los números están ordenados pero no son correlativos. 
Se desea generar una secuencia que contenga los números de socios que no figuran en la secuencia de socios."


ACCION 2,1,5 es
    AMBIENTE
        S, Sal: Secuencia de enteros
        V, cont: Entero
    PROCESO
        cont := 1
        ARRANCAR(S)
        AVZ(S, V)
        CREAR(Sal)
        Mientras NFDS(S) hacer
            Si cont <> V entonces
                Escribir(Sal, V)
            Fin Si
            AVZ(S, V)
            cont := cont + 1
        Fin Mientras
        Cerrar(S)
        Cerrar(Sal)
Fin ACCION