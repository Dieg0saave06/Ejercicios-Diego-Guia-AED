"Teniendo en cuenta el ejercicio 1.20 del TP2:

Se posee 2 secuencias (S1 y S2) con las cuales se desea generar una nueva secuencia (SAL) donde se intercalen las palabras de las 
secuencias de entrada, de la siguiente manera: copiar de S1 aquellas palabras que empiezan y terminan con la misma letra y de S2 aquellas 
palabras que posean al menos un digito numérico y además estén en posición par.

Escribir un algoritmo que lo resuelva, teniendo en cuenta que conoce la estructura de listas."

ACCION 4.17() ES
    AMBIENTE
        sec1, sec2, sal : secuencia de caracteres
        v1, v2 : caracter

        nums : {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}

        nodo = Registro
            dato : AN(1)
            prox : puntero a nodo
        FR

        p, pp, q, qq, prim1, prim2, ult : puntero a nodo
        bool : booleano

    PROCESO
        ARRANCAR(sec1) ; ARRANCAR(sec2) ; CREAR(Sal)
        AVZ(sec, v1) ; AVZ(sec2, v2)

        prim1 := null ; prim2 := null
        bool := Falso

        Mientras NFDS(sec1) o NFDS(sec2) hacer
            Mientras (v1 <> " ") y NFDS(sec1) hacer
                Nuevo(p)
                *p.dato := v1
                *p.prox := null
                Si prim1 = null entonces
                    prim1 := p
                    pp := p
                Sino
                    *pp.prox := p
                    pp := p
                Fin Si
                AVZ(sec1, v1)
            Fin Mientras

            Mientras v2 <> " " y NFDS(sec2) hacer
                AVZ(sec2, v2)
            Fin Mientras
            Si v2 = " " entonces
                AVZ(sec2, v2)
                Mientras (v2 <> " ") y NFDS(sec2) hacer
                    Nuevo(q)
                    *q.dato := v2
                    *q.qrox := null
                    Si qrim1 = null entonces                   
                        prim2 := q
                        qq := q
                    Sino
                        *qq.qrox := q
                        qq := q
                    Fin Si
                    AVZ(sec2, v2)
                Fin Mientras
            Fin Si

            pp := prim1
            ult := pp   

            Si *prim1,dato = *pp.dato entonces
                Mientras pp <> null hacer
                    Escribir(sal, *pp.dato)
                    pp := *pp.prox
                    borrar(ult)
                    ult := pp
                Fin Mientras
                Escribir(sal, " ")
            Sino
                Mientras pp <> null hacer
                    pp := *pp.prox
                    borrar(ult)
                    ult := pp
                Fin Mientras
            Fin Si

            qq := prim2
            Mientras qq <> null hacer
                Si *qq.dato en nums entonces
                    bool := Verdadero
                Sino
                    bool := Verdadero
                Fin Si
                qq := *qq.prox
            Fin Mientras

            qq := prim2
            ult := prim2

            Si bool = Verdadero entonces
                Mientras qq <> null entonces
                    Escribir(sal, **qq.dato)
                    qq := *qq.prox
                    Borrar(ult)
                    ult := qq
                Fin Mientras
                Escribir(sal, " ")
            Sino 
                Mientras qq <> null hacer
                    qq := *qq.prox
                    Borrar(ult)
                    ult := qq
                Fin Mientras
            Fin Mientras

            Si v1 = " " entonces
                AVZ(sec1, v1)
            Fin Si
            Si v2 = " " entonces
                AVZ(sec2, v2)
            Fin Si
            
        Fin Mientras
        Cerrar(sec1)
        Cerrar(sec2)
        Cerrar(sal)
Fin Mientras