ACCION ejer1(prim : puntero a nodo, arr : Arreglo [1..12, 1..31] de entero) ES
    AMBIENTE
        Fecha = Registro
            MM : 1..12
            DD : 1..31
        FR

        nodo = Registro 
            dni : N(8)
            num_fila : N(4)
            fecha_fila : Fecha
            fecha_ent : Fecha
            prox : puntero a nodo
        FR

        f : puntero a nodo
        
        doble = Registro
            fecha_reci : Fecha
            cant_a : N(6)
            codigo : AN(30)
            dni : N(8)
            ant, prox : puntero a doble
        FR

        prim2, p, q, h : puntero a doble
        fila : N(4)
        fe, fm : Fecha
        mayor : N(6)

    PROCESO

        prim2 := Null
        
        Para D := 1 hasta 3 Hacer
            Nuevo(p)
            Si prim2 = Null entonces
                *p.fecha_reci.MM := 11
                *p.fecha_reci.DD := 9
                *p.cant_a := 0
                prim2 := p
                q := p
                *q.ant := null
                *q.prox := null
            Sino
                Si D = 2 entonces
                    *p.fecha_reci.MM := 11
                    *p.fecha_reci.DD := 10
                    *p.cant_a := 0
                    *q.prox := p
                    q := p 
                    *q.ant := prim2
                    *q.prox := null
                Sino
                    *p.fecha_reci.MM := 11
                    *p.fecha_reci.DD := 11
                    *p.cant_a := 0
                    *q.prox := p
                    *p.ant := q
                    q := p 
                    *q.prox := null
                Fin Si
            Fin Si
        Fin Para
                
        Mientras prim <> null Hacer
            q := prim2
            h := *q.prox
            Mientras (*q.fecha_reci <> *prim.fecha_ent) hacer
                q := *q.prox
                h := *q.prox
            Fin Mientras
            
            *q.fecha_reci := *q.fecha_reci + 1

            fila := *prim.num_fila
            fe.MM := *prim.fecha_fila.MM  //variables para simplificar el codigo y no escribir *prim.fecha_fila.MM bla bla
            fe.DD := *prim.fecha_ent.DD

            Nuevo(p)
            *p.codigo := swiftieEncriptada(fila, arr[fe.MM, fe.DD])
            *p.dni := *prim.dni
            Si h = null entonces
                *q.prox := p
                *p.ant := q
                *p.prox := null
            Sino
                *p.prox := h
                *h.ant := p
                *p.ant := q
                *q.prox := p
            Fin Si

            f := prim
            prim := *prim.prox
            Borrar(f)
        Fin Mientras

        p := prim2
        mayor := LV

        Mientras (p <> null) hacer
            Si *p.cant_a > mayor entonces
                mayor := *p.cant_a
                fm := *p.fecha_reci
            Fin Si
            p := *p.prox
        Fin Mientras

        Escribir("La fecha con mayor cantidad de swifties fue el ", fm.DD, "/", fm.MM, ".")
Fin ACCION