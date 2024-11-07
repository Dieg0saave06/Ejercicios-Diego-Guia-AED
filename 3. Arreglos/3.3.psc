ACCION 3.3(arg : array [1...n] de entero) ES
    AMBIENTE
        x, acum, D : entero
    
    PROCESO
        Escribir("Ingresa un valor: ")
        Leer(x)
        acum := 0

        Para D := 1 hasta n hacer
            acum := acum + (arg[D] * x**(i))
        Fin Para

        Escribir("La sumatoria es ", acum)
Fin ACCION