ACCION ejer2(prim : puntero a nodo) ES
    AMBIENTE
        nodo = Registro
            valor : N(4)
            prox : puntero a nodo
        FR
        
        prim2, p, q, h, r: puntero a nodo

        Funcion valido(x : entero) : logico ES
            Si x = 0 entonces
                valido := Falso
            Sino
                Si (x mod 100) = 10 entonces
                    valido := no valido(x div 100)
                Sino
                    valido := valido(x div 100)
                Fin Si
            Fin Si
        Fin Funcion


        procedimiento cargar() ES
            Nuevo(p)
            *p.valor := *h.valor
            Si prim2 = null entonces
                *p.prox := null
                prim2 := p
                q := p
            Sino
                *q.prox := p
                *q.prox := null
            Fin Si
        Fin procedimiento

    PROCESO
        prim2 := null
        h := prim


        Mientras (*h.prox <> prim) hacer
            Si valido(*h.valor) = Verdadero entonces
                h := *h.prox
            Sino    
                cargar()
                r := h
                Mientras *r.prox <> h hacer
                    r := *r.prox
                Fin Mientras
                *r.prox := *(*r.prox).prox
                Si h = prim entonces    
                    prim := *h.prox
                Fin Si
                Borrar(h)
                h := *r.prox
            Fin Si
        Fin Mientras

        Si *prim.prox = prim entonces
            