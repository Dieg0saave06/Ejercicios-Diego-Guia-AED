Funcion pares(n : entero) : booleano ES
    Si n = 0 entonces
        pares := Verdadero
    Fin Si

    Si (n MOD 10) MOD 2 <> 0 ENTONCES
        pares := Falso
    Sino
        pares := Pares(n DIV 10)
    Fin Si
Fin Funcion
