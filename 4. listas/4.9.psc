ACCION 4.9(primC : puntero a encriptar) ES
    AMBIENTE
        encriptar = Registro
            multiplicador : N(5)
            prox : puntero a encriptar
        Fin Registro

        pc : puntero a encriptar

        NodoS = Registro
            dato : N(5)
            prox : puntero a NodoS
        Fr

        ps, qs, primS : puntero a NodoS

        Arr : Arreglo [1...255] de caracteres

        nn, D, cant, num, numsal, x: entero

    PROCESO
        cant := 0
        Escribir("Ingrese un texto de 255 caracteres como máximo: ")
        nn := 255
        Para D := 1 hasta 255 hacer
            Escribir("Ingrese una letra ", "(", nn, " caracteres restantes): ")
            Leer(Arr[D])
            nn := nn - 1
            cant := cant + 1
        Fin Para

        primS := null
        pc := primC 

        Para D := 1 hasta cant hacer
            num := ASCII(arr[D])
             
            numsal := num * (*pc.multiplicador)

            x := 0
            Mientras numsal <> 0 hacer
                x := x + (numsal mod 10)
                numsal := numsal div 10
            Fin Mientras

            Nuevo(qs)
            *qs.dato := x
            *qs.prox := null
            Si primS = null entonces
                primS := qs
                ps := qs
            Sino
                *ps.prox := qs
                ps := qs
            Fin Si
            pc := *pc.prox
        Fin Para
        ps := primS
        Mientras ps <> null hacer
            Escribir(*ps.dato)
                ps := *ps.prox
            Fin Mientras
Fin ACCION

