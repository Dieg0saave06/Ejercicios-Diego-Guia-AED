ACCION ejer2(prim : puntero a doble) ES
    AMBIENTE
        Fecha = Registro
            AA : N(4)
            MM : 1..12
            DD : 1..31
        FR

        doble = Registro
            id_compra : N(4)
            fecha_c : Fecha
            met_pago : {"efectivo", "TC", "mercado pago", "modo"}
            nro_tarjeta : Arreglo [1..20] de enteros
            monto : N(5)
            ant, prox : puntero a doble
        FR

        p, q : puntero a doble

        Funcion val(Arr[] : Arreglo de enteros, i : entero) : entero ES
            Si i = 1 entonces   
                val := Arr[i] * 2
                Si val > 9 entonces
                    val := (val mod 10) + (val div 10)
                Fin Si
            Sino
                Si (i mod 2) = 0 entonces   
                    val := Arr[i] + val(Arr[], i-1)
                Sino
                    val := Arr[i] * 2
                    Si val > 9 entonces
                        val := (val mod 10) + (val div 10) 
                    Fin Si
                    val := val + val(Arr[], i-1)
                Fin Si
            Fin Si
        Fin Funcion
                    
    
        Funcion validar(Arr[] : Arreglo) : logico ES
            Si (val(Arr[], 20) mod 5) = 0 entonces
                validar := Verdadero
            Sino
                validar := Falso
            Fin Si
        Fin Funcion

    PROCESO

        p := prim

        Mientras p <> null entonces
            Si *p.met_pago = "TC" entonces
                Si validar(*p.Arr[]) = Falso entonces
                    q := p
                    *(*q.ant).prox := *q.prox
                    *(*q.prox).ant := *q.ant
                    borrar(q)
                Fin Si
            Fin Si
            p := *p.prox
        Fin Mientras

Fin ACCION
