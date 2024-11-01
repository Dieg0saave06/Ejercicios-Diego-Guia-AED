ACCION cuarentaysiete() Es
    AMBIENTE
        
        nodo = Registro
            letra : AN(1)
            cant : N(4)
            prox : puntero a nodo
        Fin Registro

        prim, p, q, ant : puntero a nodo
        
        sec : Secuencia de caracteres
        v : caracter

    PROCESO 
        ARRANCAR(sec) ; AVZ(sec, v)
        prim := null
        ant := null

        Nuevo(p)
        *p.letra := V 
        *p.prox := null 
        prim := p 
        *p.cant := 1 
        AVZ(sec, v)
        Mientras NFDS(sec) hacer
            Si v <> " " entonces
                q := prim 
        
                Mientras (q <> null) y (v > *q.dato.letra) hacer
                    ant := q 
                    q := *q.prox
                Fin Mientras
                Si v = *q.dato.letra entonces
                    *q.dato.cant := *q.dato.cant + 1
                Sino                    
                    Nuevo(p)
                    *p.dato.letra := v
                    *p.prox.cant := 1
                    Si q = prim entonces
                        *p.prox := prim
                        prim := p
                    Sino                    
                        *ant.prox := p
                        *p.prox := q
                    Fin Si
                Fin Si
            Fin Si
            AVZ(sec, v)
        Fin Mientras
        q := prim
        Mientras q <> null hacer
            Escribir("La letra ", *p.dato.letra, " se repitió ", *p.dato.cant, " cantidad de veces.")
            Si *q.dato.cant < MenorF entonces
                MenorF := *q.dato.cant
                MenorL := *q.dato.letra
            Fin Si
            
            Si *q.dato.cant > MayorF entonces
                MayorF := *q.dato.cant
                MayorL := *q.dato.letra
            Fin Si
            q := *q.prox
        Fin Mientras
        Escribir("La letra con menor frecuencia fue la letra", MenorL)
        Escribir("La letra con mayor frecuencia fue la letra", MayorL)
        Cerrar(sec)
Fin ACCION