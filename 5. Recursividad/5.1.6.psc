Funcion Parimpar(n : entero) : booleano ES
    Si n = 0 entonces
        Parimpar := Verdadero
        Escribir("El numero es Par.")
    Sino
        Si n = 1 entonces
            Parimpar := Falso
            Escribir("El numero es Impar.")
        Sino
            Parimpar := Parimpar(n-2)
        Fin Si
    Fin Si
Fin Funcion