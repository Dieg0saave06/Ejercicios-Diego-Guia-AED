"Ejercicio 2.1.4¶
Se dispone de una secuencia de números de socios, y se desea saber la cantidad de socios que están registrados."


ACCION 2.1.4() ES
    AMBIENTE
        sec: secuencia de enteros
        v, cont: entero
    PROCESO
        ARR(sec,v)
        AVZ(v)
        cont := 0
        Mientras NFDS(sec) hacer
            cont := cont +1
            AVZ(sec,v)
        Fin Mientras
        Escribir("La cantidad de socios es:" , cont)
        cerrar(sec)
Fin ACCION