ACCION adoptados() ES
    AMBIENTE
        sec1, sec2 : Secuencia de caracteres
        v1, v2, r1, r2, r3, r4: caracter
        sec_ent : Secuencia de enteros
        cont_perros, cont_gatos : entero

    Funcion convert(car : caracter) : entero
        Segun car hacer
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
            otros : Escribir("Error, se le asignó 0") ; convert := 0
        Fin Segun
    Fin Funcion

    PROCESO
        arrancar(sec1) ; arrancar(sec2) ; crear(sec_sal) ; crear(sec_ent)
        AVZ(sec1, v1) ; AVZ(sec2, v2) 
        cont_perros := 0
        cont_gatos := 0
        bandera := Verdadero
        
        Mientras v1 <> "*" hacer 
            Si v2 <> "*" y bandera entonces
                r2 := v2
                AVZ(sec2, v2)
                r4 := v2
            Fin Si
            r1 := v1
            AVZ(sec1, v1)
            r3 := v1
                Si r1 = r2 y r3 = r4 entonces
                    AVZ(sec1, v1)
                    Si v1 = C entonces
                        AVZ(sec1 , v1)
                        Escribir(sec_sal, v1)
                        Mientras v1 <> "#" hacer
                            AVZ(sec1, v1)
                            Escribir(sec_sal, v1)
                        Fin Mientras
                        Mientras v2 <> "%" hacer
                            AVZ(sec2, v2)
                        Fin Mientras
                        Para D := 1 hasta 10 hacer
                            AVZ(sec2, v2)
                            Escribir(sec_sal, v2)
                        Fin Para
                        Escribir(sec_sal, "$")
                        Para D := 1 hasta 4 hacer
                            AVZ(sec1, v1)
                        Fin Para
                        AVZ(sec2, v2)
                        Si v2 = "*" entonces
                            r2 := "*"
                            r4 := "*"
                        Fin Si
                    Sino
                        Mientras v1 <> "#" hacer
                            AVZ(sec1, v1)
                        Fin Mientras
                        Para D := 1 hasta 4 hacer
                            AVZ(sec1, v1)
                        Fin Para
                        Mientras v2 <> "%" hacer
                            AVZ(sec2, v2)
                        Fin Mientras
                        Para D := 1 hasta 11 hacer
                        AVZ(sec2, v2)
                        Fin Para
                        Si v2 = "*" entonces
                            r2 := "*"
                            r4 := "*"
                        Fin Si
                    Fin Si
                    bandera := Verdadero
                Sino
                    Escribir(sec_ent, convert(r1))
                    Escribir(sec_ent, convert(r3))
                    AVZ(sec1, v1)
                    Si v1 := C entonces
                        cont_perros := cont_perros + 1
                    Sino 
                        cont_gatos := cont_gatos + 1
                    Mientras v1 <> "#" hacer
                        AVZ(sec1, v1)
                    Fin Mientras
                    Para D := 1 hasta 4 hacer
                        AVZ(sec1, v1)
                    Fin Para
                    bandera := Falso
                Fin Si
        Fin Mientras
        Escribir("El porcentaje de perros no adoptados es: ", cont_perros / (cont_perros + cont_gatos) * 100)
        Escribir("El porcentaje de gatos no adoptados es: ", cont_gatos / (cont_perros + cont_gatos) * 100)
        Cerrar(sec1)
        Cerrar(sec2)
        Cerrar(sec_sal)
        Cerrar(sec_ent)
Fin ACCION