"Ejercicio 2.1.32¶
Se posee una secuencia con los mensajes internos enviados entre los empleados de una empresa, la secuencia está formada 
de la siguiente manera: 3 caracteres para el destino, 3 caracteres para el origen, 3 caracteres que indican 
la cantidad de caracteres que tiene el mensaje, y el mensaje. No existe ningún carácter que separe un mensaje de otro. 
se pide:

1- Escribir una secuencia de salida con todos los mensajes (incluyendo origen y destino) que van 
hacia el área de Mantenimiento (que destino comience con 1).
2- Contar la cantidad de mensajes que se dirigen hacia el área de sistemas (que destino comience con 23)."


ACCION 2.1.32() ES
    AMBIENTE
        s, s_sal : secuencia de caracteres
        v : caracter
        cant, cont_sistemas : entero
        res1, res2, res3, res4, res5, res6 : caracter

        Funcion convert(num: caracter) : entero
            Segun num hacer
                = "1" : convert() := 1
                = "2" : convert() := 2
                = "3" : convert() := 3
                = "4" : convert() := 4
                = "5" : convert() := 5
                = "6" : convert() := 6
                = "7" : convert() := 7
                = "8" : convert() := 8
                = "9" : convert() := 9
                = "0" : convert() := 0
                otros : convert() = 0 ; Escribir("ERROR, SE LE ASIGNÓ CERO") 
            Fin Segun
        Fin Funcion
                
    PROCESO
    ARRANCAR(s) ; CREAR(s_sal)
    AVZ(s, v)
    cant := 0

    Mientras NFDS(s) hacer
        Si v = 1 entonces
            res1 := v
            AVZ(s, v)
            res2 := v
            AVZ(s, v)
            res3 := v
            AVZ(s, v)
            res4 := v
            AVZ(s, v)
            res5 := v
            AVZ(s, v)
            res6 := v
            Escribir(s_sal, res4)
            Escribir(s_sal, res5)
            Escribir(s_sal, res6)
            Escribir(s_sal, res1)
            Escribir(s_sal, res2)
            Escribir(s_sal, res3)
            Para D := 1 hasta 3 hacer
                avz(s, v)
                cant := cant + convert(v) * 10**(3-D)
            Fin Para
            Para D := 1 hasta cant hacer
                AVZ(s, v)
                Escribir(s_sal, v)
            Fin Para
            AVZ(s_sal, v)
        Sino
            Si v := 2 entonces
                AVZ(s, v)
                Si v := 3 entonces
                    cont_sistemas := cont_sistemas + 1
                    Para D := 1 hasta 4
                        AVZ(s, v)
                    Fin Para
                    Para D := 1 hasta 3 hacer
                        AVZ(s, v)
                        cant := cant + convert(v) * 10**(3-D)
                    Fin Para
                    Para D := 1 hasta cant hacer
                        AVZ(s, v)
                    Fin Para
                    AVZ(s, v)
                Sino
                    Para D := 1 hasta 4
                        AVZ(s, v)
                    Fin Para
                    Para D := 1 hasta 3 hacer
                        AVZ(s, v)
                        cant := cant + convert(v) * 10**(3-D)
                    Fin Para
                    Para D := 1 hasta cant hacer
                        AVZ(s, v)
                    Fin Para
                    AVZ(s, v)
                Fin Si
            Sino
                AVZ(s, v)
                Para D := 1 hasta 5
                    AVZ(s, v)
                Fin Para
                Para D := 1 hasta 3 hacer
                    AVZ(s, v)
                    cant := cant + convert(v) * 10**(3-D)
                Fin Para
                Para D := 1 hasta cant hacer
                    AVZ(s, v)
                Fin Para
                AVZ(s, v)
            Fin Si
        Fin Si
    Fin Mientras
    Escribir("Hay ", cont_sistemas, " mensajes del área de sistemas.")
    Cerrar(s)
    Cerrar(s_sal)
Fin ACCION