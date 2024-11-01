"ejercicio 2.1.25¶
Dada una secuencia texto de entrada que contiene palabras alfanuméricas, escribir un algoritmo que genere dos secuencias de salida. Una de ellas contendrá solo las palabras 
de la secuencia original que comienzan con vocal, en las cuales se reemplazarán todas las vocales por ‘#’, por ejemplo: entrada 'avión1', salida '#v##n1' y la otra será una 
secuencia numérica en la que se almacenarán las cantidades de vocales que se encontraron en cada una de las palabras que cumplieron la condición. Por final de proceso se deberá 
informar el promedio de palabras por oración."

ACCION 2.1.25() ES
    AMBIENTE
        Sec, sec_sal : Secuencia de caracteres
        sec_num : Secuencia de enteros
        V : caracter

        vocales : {"a" , "e", "i", "o", "u"}
        oraciones, palabras, res_palabras, cont_vocales: entero


    PROCESO
        ARRANCAR(sec) ; CREAR(sec_sal) ; CREAR(sec_num)
        AVZ(Sec, V)
        oraciones := 0
        palabras := 0
        res_palabras := 0
        vocales := 0

        
        Mientras NFDS(sec) hacer
            Mientras V <> "." y NFDS(sec) entonces
                Si V en vocales entonces
                    Mientras V <> " " y V <> "." y NFDS(sec) hacer
                        Si V en vocales entonces
                            Escribir(sec_sal, "#")
                            AVZ(sec, V)
                            cont_vocales := cont_vocales + 1
                        SINO
                            Escribir(sec_sal, V)
                            AVZ(sec, V)
                        Fin Si
                    Fin Mientras
                    Escribir(sec_num, cont_vocales)
                Sino
                    Mientras V <> " " y V <> "." y NFDS(sec) hacer
                        AVZ(Sec, V)
                    Fin Mientras
                Fin Si       
                Si V = " " entonces
                    palabras := palabras + 1 
                    AVZ(Sec, V)
                    vocales := 0
                Fin Si
            Fin Mientras
            Si V = "." entonces
                AVZ(sec, V)
                AVZ(sec, V)
                palabras := palabras + 1 
                oraciones := oraciones + 1
                vocales := 0
            Fin Si
        Fin Mientras
        Escribir("El promedio de palabras por oración es: ", palabras/oraciones)
        Cerrar(sec)
        Cerrar(sec_sal)
        Cerrar(sec_num)
Fin ACCION