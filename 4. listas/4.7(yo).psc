ACCION cuarentaysiete() Es
    AMBIENTE
        datos = Registro
            letra : AN(1)
            cant : N(4)
        Fin Registro

        nodo = Registro
            dato : datos
            prox : puntero a nodo
        Fin Registro

        prim, p, q, ant : puntero a nodo
        MayorF, MenorF : entero
        MayorL, MenorL : AN(1)
        sec : Secuencia de caracteres
        v : caracter
        
    PROCESO 
        ARRANCAR(sec) ; AVZ(sec, v)
        prim := null
        MayorF := LV
        MenorF := HV

        Mientras NFDS(sec) hacer
            Si prim = null entonces
                Nuevo(p)
                *p.dato.letra := v
                *p.dato.cant := *p.dato.cant + 1
                *p.prox := prim
                prim := p 
            Sino
                q := prim

                Si v > *q.dato.letra entonces
                    Mientras (q <> null) y (v <> *q.dato.letra) y (v > *q.dato.letra) hacer
                        ant := q 
                        q := *q.prox
                    Fin Mientras
                    Si v = *q.dato.letra entonces
                        *q.dato.cant := *q.dato.cant + 1
                    Sino
                        Si q = null entonces
                            Nuevo(p)
                            *p.dato.letra := v
                            *p.prox.cant := *p.prox.cant + 1
                            *p.prox := q
                            *ant.prox := p
                        Sino
                            Nuevo(p)
                            *p.dato.letra := v
                            *p.prox.cant := *p.prox.cant + 1
                            *p.prox := q
                            *ant.prox := p
                        Fin Si
                    Fin Si
                Sino
                    Si v < *q.dato.letra entonces
                        Nuevo(p)
                        *p.dato.letra := v
                        *p.dato.cant := *p.dato.cant + 1
                        *p.prox := prim
                        prim := p
                    Sino
                        *q.dato.cant := *q.dato.cant + 1
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



