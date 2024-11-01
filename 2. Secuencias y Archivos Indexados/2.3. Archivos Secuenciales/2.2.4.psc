ACCION 2.2.4() ES
    AMBIENTE
        Fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        Fin Registro

        alumnos = Registro
            Apellido_Nombre : AN(30)
            Carrera : {"ISI", "IEM", "IQ"}
            Legajo : N(5)
            Fecha_de_Nacimiento : Fecha
            Fecha_de_Ingreso : Fecha
            DNI : N(8)
            Sexo : {"M", "F"}
            FUE : Fecha
            Nota :  N(2)
        Fin Registro
        arch_alum, arch_salida: Archivo de alumnos
        reg_alum : alumnos
        carrera_dada : {"ISI", "IEM", "IQ"}
        Fecha_dada : N(4)

    PROCESO
        Abrir E/(arch_alum)
        Abrir /S(arch_salida)
        Leer(arch_alum, reg_alum)
        Escribir("Ingresa el año: ")
        Leer(Fecha_dada)
        Escribir("Ingrese una carrera ('ISI', 'IEM', 'IQ'): ")
        Leer(carrera_dada)

        Mientras NFDA(arch_alum) hacer
            Si reg_alum.FUE.AA = Fecha_dada entonces
                Si reg_alum.Carrera = carrera_dada entonces
                    Si reg_alum.Nota > 7 entonces
                        Grabar(arch_salida, reg_alum)
                    Fin Si
                Fin Si
            Fin Si
            Leer(arch_alum, reg_alum)
        Fin Mientras
        Cerrar(arch_alum)
        Cerrar(arch_salida)
Fin ACCION


