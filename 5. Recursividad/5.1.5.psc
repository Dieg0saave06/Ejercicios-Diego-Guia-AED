Funcion dividir(nume, deno : entero) : entero ES
    Si deno = 0 Entonces
        Escribir("Error de calculo")
    Fin Si

    Si nume < deno Entonces
        dividir := 0
    Sino
        dividir := 1 + dividir(nume - deno, deno)
    Fin Si
Fin Funcion