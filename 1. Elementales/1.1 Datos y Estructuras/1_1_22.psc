ACCION primo ES
    AMBIENTE
        n:Entero
        cont:Entero
    PROCESO
        cont:=0
        Escribir('Ingrese un numero')
        Leer(n)
        Para i:=1 hasta N hacer
            Si (n MOD i=0) entonces
            cont:= cont + 1
            Fin_Si
        Fin_Para
        Si (cont > 2) entonces
            Escribir('No es primo')
        SiNo 
            Escribir('Si es primo')
        Fin_Si
Fin_ACCION   

