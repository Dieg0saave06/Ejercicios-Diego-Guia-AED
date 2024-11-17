
Funcion multiplicacion(a, b : entero) : entero ES 
    Si b = 1 entonces 
        multiplicacion := a 
    Sino 
        multiplicacion := a * multiplicacion(a, b-1)
    Fin Si 
Fin Funcion 


multiplicacion(2,4) ==> 2 * multiplicacion(2, 3)

multiplicacion(2,4) ==> 2 * 2 * multiplicacion(2, 2)

multiplicacion(2,4) ==> 2 * 2 * 2 * 2

multiplicacion(2,4) ==> 16