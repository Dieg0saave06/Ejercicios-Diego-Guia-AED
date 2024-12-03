ACCION ejer3(prim : puntero a nodo) ES
    AMBIENTE
        numeros = Registro
            num_cel : N(13)
            dni_cliente : N(8)
        FR

        arch_num : Archivo de numeros
        reg_num : numeros


        nodo = Registro
            Ident_regalo : AN(255)
            Cant_disp : N(4)
            prox : puntero a nodo
        FR

        h : puntero a nodo

        salida = Registro
            dni_cliente : N(8)
            Ident_regalo : AN(255)
            prox : puntero a salida
        FR
        
        prim1, p, q, ant: puntero a salida

    PROCESO

        prim1 := null
        h := prim

        Abrir E/(arch_num) ; Leer(arch_num, reg_num)

        Mientras NFDA(arch_num) hacer
            Si prim = Null entonces
                Nuevo(p)
                *p.dni_cliente := reg_num.dni_cliente
                *p.Ident_regalo := *h.Ident_regalo
                prim1 := p
                *prim1.prox := null
                h := *h.prox
            Sino    
                q := prim1
                Mientras (q <> null) y (reg_num.dni_cliente <> *q.dni_cliente) hacer
                    ant := q
                    q := *q.prox
                Fin Mientras
                Si q = null entonces
                    Nuevo(p)
                    *p.dni_cliente := reg_num.dni_cliente
                    *p.Ident_regalo := *h.Ident_regalo
                    *ant.prox := p
                    q := p
                    *q.prox := null
                    h := *h.prox
                Fin Si
            Fin Si
            Leer(arch_num, reg_num)
        Fin Mientras
        Cerrar(arch_num)
Fin ACCION