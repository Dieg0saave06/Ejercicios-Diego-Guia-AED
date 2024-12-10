ACCION ejer1(prim : puntero a opiniones, prim2 : puntero a circ) ES
    AMBIENTE
        fecha = Registro
            AA : N(4)
            MM : 1..12
            DD : 1..31
        FR

        opiniones = Registro
            id_usuario : N(5)
            fecha_op : fecha
            calific : 1..5
            serv_calif : 1..20
            prox : puntero a opiniones
        FR

        r : puntero a opiniones

        usuarios = Registro
            usuario : AN(20)
            apeynom : AN(50)
            dni : N(8)
            direccion : AN(100)
            correo : AN(50)
            categ : {"Sin categoria", "Silver", "Gold"}
        FR

        arch_u : Archivo de usuarios indexado por usuario
        reg_u : usuarios


        circ = Registro
            cod_desc : N(5)
            porc_desc : N(2)
            prox : puntero a circ
        FR

        doble = Registro
            id_usuario : N(5)
            apeynom : AN(50)
            correo : AN(50)
            cant_op : N(4)
            prom_op : N(3)
            descuento : N(2)
            ant, prox : puntero a doble
        FR

        prim3, p, q, h : puntero doble

        desc : N(2)
        cant, ops, D : entero

        procedimiento mostrar() ES
            Escribir("Usuario N°", D, ": ")
            Escribir("Id_usuario: ", *p.id_usuario)
            Escribir("Nombre: ", *p.apeynom)
            Escribir("Correo: ", *p.correo)
            Escribir("----------------------------")
        Fin procedimiento
        
    PROCESO
        prim3 := Null
        r := prim

        Mientras (r <> null) hacer
            cant := 0
            ops := 0
            reg_u.usuario := *r.id_usuario 
            Leer(arch_u, reg_u)
            Si EXISTE entonces  
                Si bonificacion(arch_u.categoria, *r.fecha_op) = Verdadero entonces                    
                    Mientras reg_u.usuario = *r.id_usuario hacer
                        cant := cant + 1
                        ops := ops + *r.calific
                        r := *r.prox
                    Fin Mientras

                    Nuevo(p)
                    *p.id_usuario := reg_u.usuario
                    *p.apeynom := reg_u.apeynom
                    *p.correo := reg_u.correo
                    *p.cant_op := cant
                    *p.prom_op := (ops / cant)
                    *p.descuento := *prim2.porc_desc
                    prim2 := *prim2.prox
                    Si prim3 = null entonces
                        prim3 := p
                        *p.ant := null
                        *p.prox := null
                    Sino
                        q := prim3
                        Mientras (q <> null) y (*p.cant_op < *q.cant_op) hacer      
                            h := q
                            q := *q.prox
                        Fin Mientras
                        Si q = prim3 entonces
                            *prim3.ant := p
                            *p.prox := prim3
                            prim3 := p
                        Sino
                            *h.prox := p
                            *p.ant := h
                            *p.prox := q
                            Si q <> null entonces
                                *q.ant := p
                            Fin Si
                        Fin Si
                    Fin Si
                Fin Si
            Sino 
                Escribir("ERROR.")   
            Fin Si
            r := *r.prox
        Fin Mientras

        p := prim3

        Escribir("10 usuarios con mayor promedio: ")
        Para D := 1 hasta 10 hacer
            mostrar()
            p := *p.prox
        Fin Para

        p := prim3
        Mientras *p.prox <> null hacer
            p := *p.prox
        Fin Mientras

        Escribir("10 usuarios con menor promedio: ")
        Para D := 1 hasta 10 hacer
            mostrar()
            p := *p.ant
        Fin Para

        Cerrar(arch_u)
Fin ACCION

