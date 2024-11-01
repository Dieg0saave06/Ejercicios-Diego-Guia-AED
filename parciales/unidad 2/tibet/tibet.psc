ACCION tibet() ES
    AMBIENTE    
        fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        totales = Registro
            barco : {1, 2, 3}
            fechaT : fecha
            obra 1...5
            espectadores : N(3)
            total : N(5.2)
        FR

        arch_t : Archivo de totales
        reg_t : totales

        
        datos = Registro
            cant_espec : N(5)
            recaudado : N(10,2)
        FR
        
        arr : Arreglo [1...3, 1...13, 1...5] de datos
        i, j, k : entero

    PROCESO
        Abrir E/(arch_t) ; Leer(arch_t, reg_t)

        Para k := 1 hasta 3 hacer
            Para j := 1 hasta 13 hacer
                Para i := 1 hasta 5 hacer
                    arr[i ; j ; k].cant_espec := 0      
                    arr[i ; j ; k].recaudado := 0      
                Fin Para
            Fin Para
        Fin Para

        Mientras NFDA(arch_t) hacer
            i := reg_t.barco
            j := reg_t.fecha.mm
            k := reg_t.obra
            espec := reg_t.espectadores
            reca := reg_t.total
            arr[i ; j ; k].cant_espec := arr[i ; j ; k].cant_espec + espec
            arr[i ; j ; k].recaudado := arr[i ; j ; k].recaudado + reca
            arr[i ; 13 ; k].recaudado := arr[i ; 13 ; k].recaudado + reca
            Leer(arch_t, reg_t)
        Fin Mientras

        max := LV
        Para i := 1 hasta 3 hacer
            mj := 1
            mk := 1
            Para j := 1 hasta 12 hacer
                Para k := 1 hasta 5 hacer
                    Si max < arr[i ; j ; k].cant_espec entonces
                        max := arr[i ; j ; k].cant_espec
                    Fin Si
                    Si arr[i ; mj ; k].recaudado > arr[i ; j ; k].recaudado entonces
                        mj := j
                    Fin Si
                    Si arr[mi ; 13 ; mk] > arr[i ; 13 ; k] entonces
                        mk := k
                    Fin Si
                Fin Para
            Fin Para
            Escribir("El barco ", i , " recaudo menos en el mes ", mj, ".")
            // Escribir("La obra ", mk , " el barco que recaudo menos fue ", i, ".")

        Fin Para

        Escribir("La obra ", mk, " tuvo mayor cantidad de espectadores. Esto ocurrió en el mes ", mj, " en el barco ", mi, ".")
        



