"Ejercicio 2.1.22¶
La empresa Ideas Argentinas S.A. posee datos de sus empleados en dos secuencias de caracteres; la primera secuencia (Sec1) 
formada por los nombres (uno por persona) de los empleados separados por blancos y la segunda secuencia (Sec2) posee los números de documento 
de cada uno de los empleados (palabras de 8 dígitos numéricos). Ambas secuencias poseen la misma cantidad de datos, es decir al primer nombre de
la  primera secuencia le corresponde el primer número de documento de la segunda secuencia y así sucesivamente. La secuencia de números 
de documentos 
no posee espacios en blanco ni ningún otro tipo de caracter que separe un número de documento de otro.
A la empresa le interesa tener en una nueva secuencia (Sec3) los datos de todas aquellas personas que cumplan la condición de que el 
nombre se encuentre en una posición impar. La nueva secuencia debe generarse de la siguiente manera: el número de documento seguido 
(sin espacios) 
por una coma y luego (sin espacios) por el nombre y seguido al nombre un #."

47227366
47227366
ACCION 2.1.22() ES
    AMBIENTE
        sec1, sec2, sec_sal: Secuencia de caracteres
        v1, v2 : caracter
        cont1, cont2 : entero

    PROCESO
        ARRANCAR(sec1) ; ARRANCAR(sec2) ; CREAR(sec_sal)
        AVZ(sec1, v1) ; AVZ(sec2, v2)
        cont2 := 1
        cont1 := 1
        Mientras NFDS(sec1) y NFDS(Sec2) hacer
            Si (cont2 mod 2) <> 0
                Para x := 1 hasta 7 hacer
                    Escribir(sec_sal, v2)
                    AVZ(sec2, v2)
                Fin Para
                Escribir(sec_sal, v2)
                Escribir(sec_sal, ",")
                AVZ(sec2, v2) 
            Sino
                Para x := 1 hasta 8 hacer
                    AVZ(sec2, v2)
                Fin Para
            Fin Si
            cont2 := cont2 + 1
            Si (cont1 mod 2) <> 0
                Mientras v1 <> " " y NFDS(sec1) hacer
                    Escribir(sec_sal, v1)
                    AVZ(sec2, v2)
                Fin Mientras
                Si v1 = " " entonces
                    Escribir(sec_sal, "#")
                    AVZ(sec1, v1)
                Fin Si
            Sino
                Mientras v1 <> " " y NFDS(sec1) hacer
                    AVZ(sec1, v1)
                Fin Mientras
                Si v1 := " " hacer
                    AVZ(sec1, v1)
                Fin Si
            Fin Si
            cont1 := cont1 + 1
        Fin Mientras
        Cerrar(sec1)
        Cerrar(sec2)
        Cerrar(sec_sal)
Fin ACCION


