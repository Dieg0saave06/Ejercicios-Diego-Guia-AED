ACCION 2.1.28() ES
    AMBIENTE
        sec_artistas, sec_obras, sec_sal : Secuencia de caracteres
        v_art, v_ob: caracter

        mayor, vendidos, total_vend, obras_rena, otras_obras : entero

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
                otros : Escribir("Error") ; convert_num() = 0
        
    PROCESO
        ARRANCAR(sec_artistas) ; ARRANCAR(sec_obras)
        CREAR(sec_sal)
        AVZ(sec_artistas, v_art)
        AVZ(sec_obras, v_ob)

        mayor := 0
        vendidos := 0
        total_vend := 0
        obras_rena := 0
        otras_obras := 0

        Mientras NFDS(sec_artistas) hacer
            Si v_art = "R" entonces
                AVZ(sec_artistas, v_art)
                AVZ(sec_artistas, v_art)
                Mientras v_art <> "+" hacer
                    Escribir(sec_sal, v_art)
                    AVZ(sec_sal, v_art)
                Fin Mientras
                Escribir(sec_sal, "+")
                Escribir(sec_sal, "R")
                Escribir(sec_sal, "+")
                Para D := 1 hasta 2 hacer
                    Mientras v_art <> "+" hacer
                        AVZ(sec_artistas, v_art)
                    Fin Mientras
                    AVZ(sec_artistas, v_art)
                Fin Para
                cant_ob := convert_num(v_art)
                obras_rena := obras_rena + convert_num(v_art)
                Mientras v_art <> "?" hacer
                    AVZ(sec_artistas, v_art)
                Fin Mientras
                Si v_art = "?" entonces
                    AVZ(sec_artistas, v_art)
                Fin Si
                Para D := 1 hasta cant_ob hacer         
                    Mientras v_ob <> "," hacer
                        Escribir(sec_sal, v_ob)
                        AVZ(sec_obras, v_ob)
                    Fin Mientras
                    Escribir(sec_sal, "+")
                    AVZ(sec_obras, v_ob)
                    Mientras v_ob <> "," hacer
                        Escribir(sec_sal, v_ob)
                        AVZ(sec_obras, v_ob)
                    Fin Mientras
                    Escribir(sec_sal, "+")
                    AVZ(sec_obras, v_ob)
                    Mientras v_ob <> "," hacer
                        AVZ(sec_obras, v_ob)
                    Fin Mientras
                    AVZ(sec_obras, v_ob)
                    Si v_ob = "V" entonces
                        vendidos := vendidos + 1
                    Fin Si
                    Si 
                    Mientras v_ob <> "/" hacer
                        AVZ(sec_obras, v_ob)
                    Fin Mientras
                    Si v_ob = "/" entonces
                        AVZ(sec_obras, v_ob)
                    Fin Si
                Fin Para
                total_vend := vendidos
                Si total_vend > mayor entonces
                    mayor := total_vend
                Fin Si
                vendidos := 0
                total_vend := 0
            Sino 
                Para D := 1 hasta 4 hacer
                    AVZ(sec_artistas, v_art)
                Fin Para
                cant_ob := convert_num(v_art)
                otras_obras := otras_obras + convert_num(v_art)
                Para D := 1 hasta cant_ob hacer
                    Para D := 1 hasta 3 hacer
                        Mientras v_ob <> "," hacer
                            AVZ(sec_obras, v_ob)
                        Fin Mientras
                        Si V = "," entonces
                            AVZ(sec_obras, v_ob)
                        Fin Si
                    Fin Para
                    Si v_ob = "V" entonces
                        vendidos := vendidos + 1
                    Fin Si
                    Mientras v_ob <> "/" hacer
                    AVZ(sec_obras, v_ob)
                    Fin Mientras
                    Si v_ob = "/" entonces
                        AVZ(sec_obras, v_ob)
                    Fin Si
                Fin Para
                total_vend := vendidos
                Si total_vend > mayor entonces
                    mayor := total_vend
                Fin Si
                vendidos := 0
                total_vend := 0
            Fin Si
        Fin Mientras
        Escribir("La mayor cantidad de obras vendidas por un artista es ", mayor)
        Escribir("el porcentaje de obras de artistas 'renacentistas' sobre el total de obras es ", obras_rena  / (obras_rena + otras_obras) * 100)
        Cerrar(sec_artistas)
        Cerrar(sec_obras)
        Cerrar(sec_sal)
Fin ACCION