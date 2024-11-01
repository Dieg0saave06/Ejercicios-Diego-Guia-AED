"Ejercicio 2.1.20¶
Se dispone de dos secuencias texto formadas por oraciones bimembres (sujeto y predicado, separados por comas ‘,’). 
Se desea una secuencia texto de salida formada por oraciones bimembres, de la siguiente forma:

El sujeto, de la secuencia 1, y el predicado, de la secuencia 2.

Al finalizar informar cuantas oraciones tiene cada secuencia."

ACCION 2.1.20() ES
    AMBIENTE
        sec1, sec2, sec_sal : Secuencia de Caracteres
        V1, V2 : Caracter
        oraciones1, oraciones2 : entero

    PROCESO
    ARRANCAR(sec1) ; ARRANCAR(sec2) ; CREAR(sec_sal)
    AVZ(V1) ; AVZ(V2)

    Mientras NFDS(sec1) y NFDS(sec2) hacer
        Mientras V1 <> "." y NFDS(sec1) 
            Mientras V1 <> "," y NFDS(sec1) hacer
                Escribir(sec_sal, V1)
                AVZ(sec1)
            Fin Mientras
            Si V1 = "," entonces
                Escribir(sec_sal, V1)
                Mientras V1 <> "." y NFDS(sec1) hacer
                    AVZ(sec1, V1)
                Fin Mientras  
            Fin Si
            Mientras V2 <> "," y NFDS(sec2) hacer
                AVZ(sec2, V2)
            Fin Mientras
            Si V2 = "," entonces 
                Mientras V2 <> "." y NFDS(sec2) 
                    AVZ(sec2)
                    Escribir(sec_sal, V2)
                Fin Mientras
            Fin Si
        Fin Mientras
        Si V1 = "." y V2 = "." entonces
            AVZ(sec1, V1)
            AVZ(sec2, V2)            
            oraciones1 := oraciones1 + 1
            oraciones2 := oraciones2 + 1
        Fin Si
    Fin Mientras
    Cerrar(sec_sal)
    Cerrar(sec1)
    Cerrar(sec2)
Fin ACCION