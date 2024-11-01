// CICLO EXCLUYENTE

ACCION 2.2.16() ES
    AMBIENTE 
        Fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        peliculas = Registro
            Nro_pelicula : N(3)
            titulo : AN(30)
            genero : AN(20)
            cant_copias : N(3)
            fecha_estreno : Fecha
        FR

        arch_pelis, arch_nuevas, salida: Archivo de peliculas ordenado por Nro_pelicula
        reg_pelis, reg_nuevas : peliculas

    PROCESO
        Abrir E/(arch_pelis) ; Abrir E/(arch_nuevas)
        Abrir /S(salida)
        Leer(arch_pelis, reg_pelis) ; Leer(arch_nuevas, reg_nuevas)

        Mientras NDFA(arch_pelis) y NDFA(arch_nuevas) hacer
            Si reg_pelis.Nro_pelicula < reg_nuevas.Nro_pelicula entonces
                Grabar(salida, reg_pelis)
                Leer(arch_pelis, reg_pelis)
            Sino
                Si reg_pelis.Nro_pelicula > reg_nuevas.Nro_pelicula entonces
                    Grabar(salida, reg_nuevas)
                    Leer(arch_nuevas, reg_nuevas)
                Sino
                    Si reg_pelis.Nro_pelicula = reg_nuevas.Nro_pelicula entonces
                        Grabar(salida, reg_nuevas)
                        Leer(arch_pelis, reg_pelis)
                        Leer(arch_nuevas, reg_nuevas)
                    Fin Si
                Fin Si
            Fin Si
        Fin Mientras
    
        Mientras NFDA(arch_pelis) hacer
            Grabar(salida, reg_pelis)
            Leer(arch_pelis, reg_pelis)
        Fin Mientras

        Mientras NFDA(arch_nuevas) hacer
            Grabar(salida, reg_nuevas)
            Leer(arch_nuevas, reg_nuevas)
        Fin Mientras

        Cerrar(arch_pelis)
        Cerrar(arch_nuevas)
        Cerrar(salida)

Fin ACCION


--------------------------------------------------------------------------------------------------------------
// CICLO INCLUYENTE

ACCION 2.2.16() ES
    AMBIENTE 
        Fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        peliculas = Registro
            Nro_pelicula : N(3)
            titulo : AN(30)
            genero : AN(20)
            cant_copias : N(3)
            fecha_estreno : Fecha
        FR

        arch_pelis, arch_nuevas, salida: Archivo de peliculas ordenado por Nro_pelicula
        reg_pelis, reg_nuevas : peliculas

        procedimiento leer_pelis() ES
            Leer(arch_pelis, reg_pelis)
            Si FDA(arch_pelis) entonces
                reg_pelis.Nro_pelicula := HV
            Fin Si
        Fin procedimiento

        procedimiento leer_nuevas() ES
            Leer(arch_nuevas, reg_nuevas)
            Si FDA(arch_nuevas) entonces
                reg_nuevas.Nro_pelicula := HV
            Fin Si
        Fin procedimiento

    PROCESO
        Abrir E/(arch_pelis) ; Abrir E/(arch_nuevas)
        Abrir /S(salida)
        leer_pelis() ; leer_nuevas()

        Mientras (reg_pelis.Nro_pelicula <> HV) o (reg_nuevas.Nro_pelicula <> HV) hacer
            Si reg_pelis.Nro_pelicula < reg_nuevas.Nro_pelicula entonces
                Grabar(salida, reg_pelis)
                leer_pelis()
            Sino
                Si reg_pelis.Nro_pelicula > reg_nuevas.Nro_pelicula entonces
                    Grabar(salida, reg_nuevas)
                    leer_nuevas()
                Sino
                    Si reg_pelis.Nro_pelicula = reg_nuevas.Nro_pelicula entonces
                        Grabar(salida, arch_nuevas)
                        leer_pelis()
                        leer_nuevas()
                    Fin Si
                Fin Si
            Fin Si
        Fin Mientras

        Cerrar(arch_pelis)
        Cerrar(arch_nuevas)
        Cerrar(salida)

Fin ACCION
