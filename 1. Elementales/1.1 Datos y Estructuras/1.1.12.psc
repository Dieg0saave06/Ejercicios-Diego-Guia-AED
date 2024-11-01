"Ejercicio 1.1.12¶
Escriba un algoritmo que acepte un número entero mayor a 100 y menor a 1000, y muestre como está compuesto (unidades, decenas y centenas) 
y si es múltiplo de 3 (Recordar: todo número cuya suma de sus dígitos sea múltiplo de 3, lo es también)."


ACCION 1.1.12() ES
    AMBIENTE
        num, pepe, ramon, juan, diego : entero

    PROCESO
        Escribir("Ingresa un número mayor a 100 y menor a 1000: ")
        Leer(num)
        ramon := 0
        pepe := 0
        juan := 0
        diego := num

        Si num > 100 y num < 1000 entonces
            pepe := num mod 10
            Escribir("Las unidades son: ", pepe)
            ramon := num - pepe
            pepe := ramon mod 100
            Escribir("Las decenas son: ", pepe)
            ramon := ramon - pepe
            Escribir("Las centenas son: ", ramon)
            Para D:= 1 hasta 3 hacer
                juan := juan + diego / 10**(3-D)
                diego := diego mod 10**(3-D)
            Fin Para
            Si (juan mod 3) = 0 entonces
                Escribir(diego, " si es múltiplo de 3.")
            Fin
        Sino
            Escribir("Ingresaste el número que se te cantó.")
        Fin Si
Fin ACCION
