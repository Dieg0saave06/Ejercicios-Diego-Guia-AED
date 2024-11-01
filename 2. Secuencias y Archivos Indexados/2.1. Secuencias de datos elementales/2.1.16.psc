"Ejercicio 2.1.16¶
Se dispone de una secuencia de números de DNI asignados a un circuito electoral, generar otra secuencia de 
números que contenga los DNI múltiplos de 3."

ACCION 2.1.16() ES  
    AMBIENTE
        S, s_sal: Secuencia de enteros
        V, res : entero


    
    PROCESO
        ARRANCAR(S) ; AVZ(S, V)
        res := 0
        
        Mientras NFDS(S) hacer    
            Para D := 1 hasta 7 hacer
                res := res + (V * 10**(7-D)) 
                AVZ(S, V)
            Fin Para
            Si (res mod 3) = 0 entonces
                Escribir(s_sal, res)
            Fin Si
            res := 0
            AVZ(S, V)
        Fin Mientras
        Cerrar(S)
Fin ACCION
