ACCION cuarentaydos(prim : puntero a nodo) Es 
    AMBIENTE 
        nodo = Registro 
            dato : entero 
            prox : puntero a Nodo 
        FR 
        
        ant, p, q, prim2, ant2: puntero a Nodo 
        
        
    PROCESO 
        prim2 := null 
        p := prim 
        ant := prim
        Mientras (p <> null) hacer 
            Si ((*p.dato MOD 10) = 0) entonces 
                Nuevo(q)
                *q.dato := *p.dato 
                *q.prox := null //factor comun
                Si (prim2 = null) entonces 
                    ant2 := q
                    prim2 := q  
                Sino 
                    *ant2.prox := q  
                    ant2 := q 
                Fin Si 
                Si (prim = p) entonces 
                    prim := *p.prox
                    Borrar(p) 
                    p := prim
                Sino 
                    *ant.prox := *p.prox 
                    Borrar(p)
                    p := *ant.prox
            Sino 
                ant := p
                p := *p.prox
            Fin Si
       Fin Mientras 
Fin ACCION