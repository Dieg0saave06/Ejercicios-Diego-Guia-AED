ACCION ejercicio1(arr : Arreglo[1...151] de caracteres) ES
    AMBIENTE
        Fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        claves = Registro
            cod_region : N(4)
            cod_usuario : N(10)
        FR

        capturas = Registro
            clave : claves
            cod_pokemon : 1...151
            punto_expe : N(5) 
            fecha_captura : Fecha
            estado_pok : {"E", "I", "D"}
            estado_us : {"A", "S", "B"}
        FR

        arch_cap : Archivo de capturas ordenado por clave, cod_pokemon
        reg_cap : capturas

        usuarios = Registro
            clave : claves
            correo : AN(50)
            expe : N(7)
        FR

        arch_usu, salida : Archivos de usuarios ordenado por clave
        reg_usu, reg_sal : usuarios

        descanso = Arreglo [1...151] de enteros  

        procedimiento leer_capturas() ES
            Leer(arch_cap, reg_cap)
            Si FDA(arch_cap) entonces
                reg_cap.clave := HV
            Fin Si
        Fin procedimiento
 

        procedimiento leer_usuarios() ES
            Leer(arch_usu, reg_usu)
            Si FDA(arch_usu) entonces
                reg_usu.clave := HV
            Fin Si
        Fin procedimiento

        pokezzz, c, i : entero
        resg_clave : clave

    PROCESO
        Abrir E/(arch_cap) ; leer_capturas()
        Abrir E/(arch_usu) ; leer_usuarios()
        Abrir /S(salida)
        pokezzz := LV

        Para i := 1 hasta 151 hacer
            descanso[i] := 0
        Fin Para

        Mientras (reg_usu.clave <> HV) o (reg_cap.clave <> HV) hacer   
            Si reg_usu.clave = reg_cap.clave entonces   
                Si reg_cap.estado_us = "S" entonces
                    Mientras reg_usu.clave = reg_cap.clave entonces
                        leer_capturas()
                    Fin Mientras
                Sino
                    reg_sal := reg_usu
                    Mientras reg_usu.clave = reg_cap.clave entonces                       
                        Si reg_cap.estado_pok = "E" entonces
                            reg_sal.expe := reg_sal.expe + (reg_cap.punto_expe * 2)
                        Sino
                            Si reg_cap.estado_pok = "D" entonces
                                descanso[reg_cap.cod_pokemon] := descanso[reg_cap.cod_pokemon] + 1
                            Fin Si
                            reg_sal.expe := reg_sal.expe + reg_cap.punto_expe
                        Fin Si
                        leer_capturas()
                    Fin Mientras
                    Grabar(salida, reg_sal)
                Fin Si
                leer_usuarios()
            Sino
                Si reg_usu.clave > reg_cap.clave entonces
                    Si reg_cap.estado_us = "A" entonces
                        reg_sal.clave := reg_cap.clave
                        resg_clave := reg_cap.clave
                        Mientras resg_clave = reg_cap.clave entonces
                            Si reg_cap.estado_pok = "E" entonces
                                reg_sal.expe := reg_sal.expe + (reg_cap.punto_expe * 2)
                            Sino
                                Si reg_cap.estado_pok = "D" entonces
                                    descanso[reg_cap.cod_pokemon] := descanso[reg_cap.cod_pokemon] + 1
                                Fin Si
                                reg_sal.expe := reg_sal.expe + reg_cap.punto_expe
                            Fin Si
                            leer_capturas()
                        Fin Mientras
                        Grabar(salida, reg_sal)
                    Sino
                        resg_clave := reg_cap.clave
                        Mientras resg_clave = reg_cap.clave entonces
                            leer_capturas()
                        Fin Mientras
                    Fin Si
                Sino
                    Grabar(salida, reg_sal)
                    leer_usuarios()
                Fin Si
            Fin Si
        Fin Mientras

        c := 1
        
        Para i := 1 hasta 151 hacer
            Si descanso[c] < descanso[i] entonces      
                c := i
            Fin Si
        Fin Para

        Escribir("El pokemon en estado 'descansando' que lo tienen mayor cantidad de usuarios es ", arr[c], ", con una cantidad de ", descanso[c], ".")
        Cerrar(arch_cap)
        Cerrar(arch_usu)
        Cerrar(salida)
Fin ACCION