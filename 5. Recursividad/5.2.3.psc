procedimiento lista(p: puntero a Nodo) ES
    Si *p.prox <> null entonces 
        lista(*p.prox)
    Fin Si
    Escribir(*p.dato)
Fin procedimiento
    