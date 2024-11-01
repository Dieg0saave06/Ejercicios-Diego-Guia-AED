ACCION 2.2.5() ES
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
        arch_alum : Archivo de alumnos
        reg_alum : alumnos
        ano_pasado : N(4)

    PROCESO
        Escribir("Ingrese el año pasado: ")
        Leer(ano_pasado)
        Abrir e/(arch_alum)
        Leer(arch_alum, reg_alum)
        Mientras NFDA(arch_alum) hacer
            Si reg_alum.Fecha_de_Ingreso.AA = ano_pasado entonces
                Si reg_alum.Nota > 7 entonces
                    Escribir(reg_alum.Legajo, " | ", reg_alum.Apellido_Nombre,  " | ", reg_alum.carrera)
                Fin Si
            Fin Si
            Leer(arch_alum, reg_alum)
        Fin Mientras
        Cerrar(arch_alum)
Fin ACCION