ACCION qatarcorte() ES
    AMBIENTE
        hotel = Registro
            codigo_cadena : AN(15)
            nivel_hotel : 1...5
            codigo_hotel : N(4)
            nombre_hotel : AN(50)
            es_ciudad_sede : Booleano
            cantidad_habitaciones : N(4)
        FR

        arch_hotel : Archivo de hotel ordenado por codigo_cadena y nivel_hotel
        reg_hotel : hotel


        salida = Registro
            codigo_cadena : AN(15)
            cantidad_habitaciones : n(4)
        FR

        arch_salida : Archivo de salida
        reg_salida : salida
        res_cadena : AN(15)
        res_nivel : 1...5
        cant_cadena, cant_general, cant_nivel : entero

        procedimiento corte_nivel() ES
            Escribir("La cantidad de habitaciones en el nivel ", res_nivel, ", de la cadena hotelera ", res_cadena, " es ", cant_nivel)
            cant_cadena := cant_cadena + cant_nivel
            cant_cadena_2 := cant_cadena_2 + cant_nivel_2
            cant_nivel := 0
            cant_nivel_2 := 0
            res_nivel := reg_hotel.nivel_hotel
        Fin procedimiento

        procedimiento corte_cadena() ES
            corte_nivel()
            Escribir("La cantidad de habitaciones de la cadena hotelera ", res_cadena, " es ", cant_cadena)
            cant_general := cant_general + cant_cadena
            reg_salida.codigo_cadena := res_cadena
            reg_salida.cantidad_habitaciones := cant_cadena + cant_cadena_2
            Grabar(salida, reg_salida)
            cant_cadena := 0
            cant_cadena_2 := 0
            res_cadena := reg_hotel.codigo_cadena
        Fin procedimiento

    PROCESO
        Abrir E/(arch_hotel) ; Abrir S/(salida)
        Leer(arch_hotel, reg_hotel)
        cant_nivel := 0 ; cant_cadena := 0 ; cant_general := 0
        cant_nivel_2 := 0 ; cant_cadena_2 := 0
        res_cadena := reg_hotel.codigo_cadena
        res_nivel := reg_hotel.nivel_hotel

        Mientras NFDA(arch_hotel) hacer
            Si res_cadena <> reg_hotel.codigo_cadena entonces
                corte_cadena()
            Sino
                Si res_nivel <> reg_hotel.nivel_hotel entonces
                    corte_nivel()
                Fin Si
            Fin Si

            Si reg_hotel.es_ciudad_sede = TRUE entonces
                cant_nivel := cant_nivel + reg_hotel.cantidad_habitaciones
            Sino
                cant_nivel_2 := cant_nivel_2 + reg_hotel.cantidad_habitaciones
            Fin Si
            
            Leer(arch_hotel, reg_hotel)

        Fin Mientras
        corte_cadena()
        Escribir("El total de habitaciones que se encuentran en ciudades sedes del Mundial de fútbol es", cant_general)
        Cerrar(arch_hotel)
        Cerrar(salida)
Fin ACCION