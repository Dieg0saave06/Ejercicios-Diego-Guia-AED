"Dada una secuencia de enteros que almacena la cantidad de habitantes de las ciudades capitales de las 23 provincias de la República Argentina, 
discriminados 4 categorías: menores de 18 años (varones y mujeres) y mayores de 18 años (varones y mujeres). 
Se pide determinar la población total y los siguientes porcentajes: masculinos, femeninos, mayores de 18 y menores de 18."

ACCION 2.1.6 Es
    AMBIENTE
        S: Secuencia de enteros
        V, Total, men18v, men18m, may18m, may18v: entero

    PROCESO
        Total, men18v, men18m, may18m, may18v := 0
        ARRANCAR(S)
        AVZ(S, V)
        Mientras NFDS(S) hacer
