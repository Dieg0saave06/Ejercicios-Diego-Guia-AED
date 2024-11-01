"Ejercicio 2.1.17¶
Se desea calcular el costo de un telegrama, que se determina en función del número de palabras (que vale V1 cada una), 
salvo que el promedio de letras por palabra supere las cinco letras, caso en que cada palabra vale V2."

ACCION 2.1.17() ES
    AMBIENTE
        sec : Secuencia de Caracteres
        V : caracter
        V1 = 10
        V2 = 20 
        palabras, letras : entero
        promedio : real


    PROCESO
        ARRANCAR(sec)
        AVZ(sec, V)
        palabras := 0
        letras := 0
        Mientras NFDS(sec) hacer
            Mientras V <> " " y NFDS(sec) hacer
                letras := letras + 1
                AVZ(sec, V)
            Fin Mientras
            palabras := palabras + 1
            Si V = " " entonces
                AVZ(sec, V)
            Fin Si
        Fin Mientras
        promedio := letras / palabras
        Si promedio > 5 entonces
            Escribir("El costo total del telegrama es: ", palabras * V2)
        Sino
            Escribir("El costo total del telegrama es: ", palabras * V1)
        Fin Si
        Cerrar(sec)
Fin ACCION