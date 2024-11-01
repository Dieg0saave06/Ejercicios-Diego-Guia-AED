"Ejercicio 2.1.18¶
Escribir un algoritmo que produzca una secuencia de salida que contenga una oración formada por 
las palabras en posición par de cada oración de una secuencia texto de entrada, que además comienzan con la letra 'M'."

ACCION 2.1.18() ES
    AMBIENTE
        Sec_ent, Sec_sal : Secuencia de Caracteres
        V : caracter

    PROCESO
        ARRANCAR(Sec_ent) ; Crear(Sec_sal)
        AVZ(Sec_ent, V)
        Mientras NFDS(Sec_ent) hacer
            Mientras V <> "." y NFDS(Sec_ent) hacer
                Mientras V <> " " y V <> "." y NFDS(Sec_ent) hacer
                AVZ(Sec_ent, v)
                Fin Mientras
                Si V = " " entonces
                    AVZ(Sec_ent, V)
                    Si V = "M" entonces
                        Mientras V <> " " y V <> "." y NFDS(S) hacer
                            Escribir(Sec_sal, v)
                            AVZ(Sec_ent, V)
                        Fin Mientras
                        Si V = " " entonces
                            Escribir(Sec_sal, V)
                        Fin Si
                    Sino 
                        Mientras V <> " " y V <> "." y NFDS(S) hacer
                            AVZ(Sec_ent, V)
                        Fin Mientras
                    Fin Si
                Fin Si
                Si V = " " entonces
                    AVZ(Sec_ent, V) 
                Fin Si
            Fin Mientras
            Si V = "." entonces
                AVZ(Sec_ent, V)
                AVZ(Sec_ent, V)
            Fin Si
        Fin Mientras
        Cerrar(Sec_ent)
        Cerrar(Sec_sal)
Fin ACCION
