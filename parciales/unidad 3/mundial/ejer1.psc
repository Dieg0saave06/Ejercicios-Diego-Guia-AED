ACCION ejer1(prim : puntero a simple) ES
    AMBIENTE
        simple = Registro
            paises : AN(30)
            grupo : N(1)
            puntos : N(2)
            t_a : N(2)
            t_r : N(2)
            Arr : Arreglo [1..20] de enteros
            prox : puntero a simple
        FR

        p, q : puntero a simple

        Funcion Edad(Arr[] : Arreglo de enteros, i : entero) : entero ES
            Si i = 1 entonces
                Edad := Arr[i] / 26
            Sino
                Edad := (Arr[i] / 26) + Edad(Arr[], i - 1)
            Fin Si
        Fin Funcion 

        D : entero
        pa : AN(30)
    PROCESO

        p := prim

        Para D := 1 hasta 32 hacer
            Escribir("Ingrese el pais: ")
            Leer(pa)
            Mientras *p.paises <> pa hacer
                p := *p.prox
            Fin Mientras
            Escribir("Ingrese el grupo: ")
            Leer(*p.grupo)           
            p := prim
        Fin Para

        
        
