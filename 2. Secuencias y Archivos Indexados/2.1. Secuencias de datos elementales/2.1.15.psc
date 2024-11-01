"Ejercicio 2.1.15¶
Se desea saber la cantidad promedio de palabras que contienen las oraciones de una secuencia de caracteres. 
Supóngase que los puntos son siempre contiguos al último caracter de la palabra. La secuencia finaliza con una marca."

ACCION 2.1.15() ES
    AMBIENTE
        S : Secuencia de caracteres
        V : caracter
        promedio : real
        oraciones : entero
        palabras : entero

    PROCESO
        ARRANCAR(S)
        AVZ(S, V)
        palabras := 0
        oraciones := 0
        pa. p
        Mientras NFDS(S) hacer
            Mientras V <> "." y NFDS(S) hacer
                AVZ(S, V)
                Mientras V <> " " y V <> "." y NFDS(S) hacer
                    AVZ(S, V)
                Fin Mientras
                palabras := palabras + 1
            Fin Mientras
            Si V = "." entonces
                AVZ(S, V)
            Fin Si
            palabras := palabras + 1
            oraciones := oraciones + 1
        Fin Mientras
        promedio := palabras / oraciones
        Escribir("El prom es: ", promedio)
        Cerrar(S)
Fin ACCION

    //pepe pico pica. papas popo.
    AVZ(S, V)
    Mientras NFDS(S) hacer
        Mientras v <> "." y NFDS(S) hacer
            AVZ(S, V)
            Si V = " " entonces 
                palabras := palabras + 1    
            Fin Si
        Fin Mientras    
        Si V = "." entonces
            palabras := palabras + 1
            oraciones := oraciones + 1
            Para d := 1 hasta 2 hacer
                AVZ(s, v)
            Fin Para
        Fin Si
    Fin Mientras