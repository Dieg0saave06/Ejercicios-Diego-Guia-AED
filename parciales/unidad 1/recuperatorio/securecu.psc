ACCION ejercicio_1() ES
    AMBIENTE
        sec_m, salida : secuencia de caracteres
        VM : caracter
        letra_dada : caracter
        tot_MO, D, MO_num, cont_categ, cont_10 : entero

        Funcion convert_num(car : caracter) : entero
            Segun car hacer
                = "1" : convert_num() := 1
                = "2" : convert_num() := 2
                = "3" : convert_num() := 3
                = "4" : convert_num() := 4
                = "5" : convert_num() := 5
                = "6" : convert_num() := 6
                = "7" : convert_num() := 7
                = "8" : convert_num() := 8
                = "9" : convert_num() := 9
                = "0" : convert_num() := 0
            Fin Segun
        Fin Funcion

        Funcion convert_car(num : entero) : caracter
            Segun num hacer
                = 1 : convert_num() := "1"
                = 2 : convert_num() := "2"
                = 3 : convert_num() := "3"
                = 4 : convert_num() := "4"
                = 5 : convert_num() := "5"
                = 6 : convert_num() := "6"
                = 7 : convert_num() := "7"
                = 8 : convert_num() := "8"
                = 9 : convert_num() := "9"
                = 0 : convert_num() := "0"
            Fin Segun
        Fin Funcion

    PROCESO
        ARRANCAR(sec_m) ; AVZ(sec_m, VM) ; Crear(salida)

        tot_MO := 0 ; MO_num := 0 ; cont_categ := 0 ; cont_10 := 0

        Escribir("Ingrese una letra: ")
        Leer(letra_dada)

        Mientras NFDS(sec_m) hacer
            Escribir("El deporte: ")
            Si VM = letra_dada entonces
                Mientras VM <> "%" hacer
                    Escribir(VM)
                    Escribir(salida, VM)
                    AVZ(sec_m, VM)
                Fin Mientras
                Escribir(salida, "%")
                Escribir("Para la categoria: ")
                AVZ(sec_m, VM)
                Mientras VM <> "#" hacer
                    Mientras VM <> "-" hacer
                        Escribir(VM)
                        AVZ(sec_m, VM)
                    Fin Mientras
                    AVZ(sec_m, VM)
                    Mientras VM <> "?" hacer
                        Para D := 1 hasta 3 hacer
                            AVZ(sec_m, VM)
                        Fin Para
                        Para D := 1 hasta 2 hacer   
                            MO_num := MO_num + (convert_num(VM) * 10**(2 - D))
                            AVZ(sec_m, VM)
                        Fin Para
                        tot_MO := tot_MO + MO_num
                        Si MO_num >= 10 entonces
                            cont_10 := cont_10 + 1
                        Fin Si
                        Para D := 1 hasta 4 hacer
                            AVZ(sec_m, VM)
                        Fin Para
                        MO_num := 0
                    Fin Mientras
                    cont_categ := cont_categ + 1
                    Escribir("La categoria tenia ", cont_10, " paises con al menos 10 medallas de oro.")
                    cont_10 := 0
                Fin Mientras
                Escribir("El deporte tiene ", cont_categ, " categorias. ")
            Sino
                Mientras VM <> "%" hacer
                    Escribir(VM)
                    AVZ(sec_m, VM)
                Fin Mientras
                Escribir("Para la categoria: ")
                AVZ(sec_m, VM)
                Mientras VM <> "#" hacer
                    Mientras VM <> "-" hacer
                        Escribir(VM)
                        AVZ(sec_m, VM)
                    Fin Mientras
                    AVZ(sec_m, VM)
                    Mientras VM <> "?" hacer
                        Para D := 1 hasta 3 hacer
                            AVZ(sec_m, VM)
                        Fin Para
                        Para D := 1 hasta 2 hacer   
                            MO_num := MO_num + (convert_num(VM) * 10**(2 - D))
                            AVZ(sec_m, VM)
                        Fin Para
                        tot_MO := tot_MO + MO_num
                        Si MO_num >= 10 entonces
                            cont_10 := cont_10 + 1
                        Fin Si
                        Para D := 1 hasta 4 hacer
                            AVZ(sec_m, VM)
                        Fin Para
                        MO_num := 0
                    Fin Mientras
                    cont_categ := cont_categ + 1
                    Escribir("La categoria tenia ", cont_10, " paises con al menos 10 medallas de oro.")
                    cont_10 := 0
                Fin Mientras
                Escribir("El deporte tiene ", cont_categ, " categorias. ")
            Fin Si
            Para D := 1 hasta 2 hacer
            Escribir(salida, convert_car(tot_MO div 10**(2 - D)))
            tot_MO := tot_MO mod 10
            Fin Para
            Escribir(salida, "#")
            cont_categ := 0
            tot_MO := 0
        Fin Mientras
        Cerrar(sec_m)
        Cerrar(salida)
Fin ACCION












                        Escribir("La carrera: ")
                        Mientras VM <> "#" hacer
                            Si VM = letra_dada entonces
                                Mientras VM <> "%" hacer
                                    Escribir(VM)
                                    Escribir(salida, VM)
                                    AVZ(sec_m, VM)
                                Fin Mientras
                                Escribir(sec_m, "%")
                                Escribir("Para la categoria: ")
                                AVZ(sec_m, VM)
                                Mientras VM <> "?" hacer
                                    Mientras VM <> "-" hacer
                                        AVZ(sec_m, VM)
                                    Fin Mientras
                                    Para D := 1 hasta 4 hacer
                                        AVZ(sec_m, VM)
                                    Fin Para
                                    Para D := 1 hasta 2 hacer   
                                        MO_num := MO_num + (convert_num(VM) * 10**(2 - D))
                                        AVZ(sec_m, VM)
                                    Fin Para
                                    tot_MO := tot_MO + MO_num
                                    Si MO_num >= 10 entonces
                                        cont_10 := cont_10 + 1
                                    Fin Si
                                    Para D := 1 hasta 
            

