"Ejercicio 2.1.12¶
Se dispone de una secuencia de caracteres. Se desea listar las palabras que comiencen con "ALG"."



ACCION 2.1.12(S) es
    AMBIENTE
        S: Secuencia de Caracteres
        V: aracter
    PROCESO
        ARRANCAR(S)
        AVZ(S, V)
        Mientras NFDS(S) hacer
            Si V = "A" entonces
                AVZ(S, V)
                Si V = "L" entonces
                    AVZ(S, V)
                    Si V = "G" entonces
                        AVZ(S, V)
                        Escribir("A")
                        Escribir("L")
                        Escribir("G")
                        Mientras V <> " " y NFDS(S) hacer
                            Escribir(V)
                            AVZ(S, V)
                        Fin Mientras
                        Si V = " " entonces
                            Escribir(" ")
                            AVZ(S, V)
                        Fin Si
                    Sino 
                        Mientras V <> " " y NFDS(S) hacer
                            AVZ(S, V)
                        Fin Mientras
                    Fin Si
                Sino 
                    Mientras V <> " " y NFDS(S) hacer
                        AVZ(S, V)
                    Fin Mientras
                Fin Si
            Sino 
                Mientras V <> " " y NFDS(S) hacer
                    AVZ(S, V)
                Fin Mientras
            Fin Si
            Si = " " entonces       
                AVZ(S, V)
            Fin Si
        Fin Mientras
        Cerrar(S)
Fin ACCION
