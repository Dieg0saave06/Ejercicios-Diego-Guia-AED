
Funcion multiplicacion(a, b : entero) : entero ES 
    Si b = 1 entonces 
        multiplicacion := a 
    Sino 
        multiplicacion := a * multiplicacion(a, b-1)
    Fin Si 
Fin Funcion