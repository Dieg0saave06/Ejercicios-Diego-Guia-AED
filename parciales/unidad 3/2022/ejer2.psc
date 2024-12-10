ACCION ejer2(prim : puntero a simple) ES
    AMBIENTE
        simple = Registro
            dni_p : N(8)
            apeynom : AN(50)
            edad : N(3)
            nro_cama : N(4)
            nro_habi : N(3)
            temperaturas : Arreglo [1..4] de enteros
            prox : puntero a simple
        FR

    
        Funcion valido(Arr[] : Arreglo de enteros, i : entero) : logico ES
            Si i = 0 entonces
                valido := Falso
            Sino
                Si Arr[i] > 36,5 entonces       
                    valido := No valido(Arr[], i-1)
                Sino
                    valido := valido(Arr[], i-1)
                Fin Si
            Fin Si
        Fin Funcion

        
    PROCESO

        p := prim
        Escribir("Los pacientes que no registraron temperaturas mayores a 36,5° fueron: ")
        Mientras p <> null hacer
            Si valido(*p.temperaturas[], 4) = Falso entonces
                q := p
                p := *p.prox
            Sino
                Si p = prim entonces
                    prim := *prim.prox
                    Borrar(p)
                    p := prim
                Sino
                    *q.prox := *p.prox
                    Borrar(p)
                    p := *q.prox
                Fin Si
            Fin Si
        Fin Mientras
Fin ACCION

