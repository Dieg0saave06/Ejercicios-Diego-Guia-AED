procedimiento inv(n : entero) ES 
    Si n < 10 entonces 
        Escribir(n)
    Sino 
        Escribir(n MOD 10)
        inv(n DIV 10)
    Fin Si 
Fin procedimiento 