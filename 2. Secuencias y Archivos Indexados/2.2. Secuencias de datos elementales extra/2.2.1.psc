"Ejercicio 2.2.1¶
Dada una secuencia de caracteres de entrada, desarrollar un algoritmo que produzca una secuencia de salida de caracteres; 
la que contendrá solo los caracteres “numéricos” correspondientes a dígitos impares encontrados en la secuencia de entrada.

Ejemplo: Si en la entrada viniera A125EB% en la salida debería ir 1 5.

Al final del proceso informar:

    1- Cuantos dígitos impares encontró
    2- Cuantos dígitos pares
    3- Total de caracteres “numéricos” (dígitos) y porcentaje de pares e impares"

ACCION 2.2.1() ES
    AMBIENTE
        Sec_ent, Sec_sal: Secuencia de caracteres
        V: caracter
        Cont_par, Cont_impar, C_total: entero
        Porcentaje_par, Porcentaje_impar: real


    PROCRESO
        Arrancar(Sec_ent)
        CREAR(Sec_sal)
        AVZ(S, V)
        Cont_impar := 0
        Cont_par := 0
        C_total := 0
        Porcentaje_impar := 0
        Porcentaje_par := 0
        Mientras NFDS(S) hacer
            Si V = "1" o "3" o "5" o "7" o "9" hacer
                Escribir(Sec_sal, V)
                Cont_impar := Cont_impar + 1
            Fin Si
            Si V = "2" o "4" o "6" o "8" entonces
                Cont_par := Cont_par + 1
            Fin Si
            Si V = "0" entonces
                C_total := C_total + 1
            Fin Si
            AVZ(S, V)
        Fin Mientras
        C_total := Cont_impar + Cont_par
        Porcentaje_impar := (Cont_impar / C_total) * 100
        Porcentaje_par := (Cont_par / C_total) * 100
        Escribir("El total de número impares encontrados es:", Cont_impar)
        Escribir("El total de número pares encontrados es:", Cont_par)
        Escribir("El total de caracteres numericos encontrados es:", C_total)
        Escribir("El porcentaje de numeros impares es:", Porcentaje_par)
        Escribir("El porcentaje de numeros pares es:", Porcentaje_impar)
        CERRAR(Sec_ent)
        CERRAR(sec_sal)
Fin ACCION