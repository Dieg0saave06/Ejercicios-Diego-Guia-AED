ACCION RIOT(prim : puntero a Servidores) ES
    AMBIENTE
        cliente = Registro
            NomCli : AN(45)
            Locali : {"LAN", "EUW", "LAS"}
            Nivel : 1..500
        FR
        
        arch_cli : Archivo de cliente
        reg_cli : cliente

        Servidores = Registro
            Servidor : N(10)
            Locali : {"LAN", "EUW", "LAS"}
            Estado : {"Libre", "En mantenimiento"}
            CantUsuarios : 0..10
            Latencia : 1..1500
            prox : Puntero a Servidores
        FR

        s, k : puntero a Servidores

        Nodo = Registro
            NomCli : AN(45)
            Servidor : N(10)
            Locali : {"LAN", "EUW", "LAS"}
            Nivel : 1..500
            ant : puntero a Nodo
            prox : puntero a Nodo
        FR
        prim1, p, q, atras1: puntero a Nodo

        NodoB = Registro
            Servidor : N(10)
            Latencia : 1..1500
            ant : puntero a Nodo
            prox : puntero a Nodo
        FR
        prim2, atras2, h, w: puntero a NodoB

    PROCESO
        Abrir E/(cliente) ; Leer(arch_cli, reg_cli)
        prim1 := null ; prim2 := null
        s := prim

        Mientras NFDA(cliente) hacer    
            Hacer (*s.Estado = "Libre") y (*s.CantUsuarios < 10) entonces
                Nuevo(p)
                *p.NomCli := reg_cli.NomCli
                *p.Servidor := *s.Servidor
                *p.Locali := reg_cli.Locali
                *p.Nivel := reg_cli.Nivel
                *s.CantUsuarios := *s.CantUsuarios + 1

                Si prim1 = null entonces
                    prim1 := p
                    atras1 := p
                    q := p
                    *q.prox := null
                    *q.ant := null
                Sino
                    q := p
                    *q.prox := null
                    *q.ant := atras1
                    *atras1.prox := q
                    atras1 := p
                    Fin Si
            Fin hacer
            s := *s.prox
            Leer(arch_cli, reg_cli)
        Fin Mientras

        Mientras s <> prim hacer
            Si (*s.Estado = "Libre") y (*s.CantUsuarios < 10) entonces
                Nuevo(w)
                *w.Servidor := *s.Servidor
                *w.Latencia := *s.Latencia
                Si prim2 = null entonces 
                    prim2 := p
                    atras2 := p
                    h := p
                    *h.ant := null
                    *h.prox := null
                Sino    
                    k := prim2
                    Mientras (k <> null) y (*k.Latencia > *h.Latencia) entonces
                        atras2 := k
                        k := *k.prox
                    Fin Mientras
                    Si k = prim entonces
                        k := w
                        *prim.ant := k
                        *k.prox := prim
                        *k.ant := null
                        prim := k
                    Sino
                        k := w
                        *atras2.prox := k
                        Si k <> null entonces
                            *k.ant := atras2
                            *k.prox := null
                        Fin Si
                    Fin Si
                Fin Si
            Fin Si
            s := *s.prox
        Fin Mientras
        Cerrar(cliente)
Fin ACCION