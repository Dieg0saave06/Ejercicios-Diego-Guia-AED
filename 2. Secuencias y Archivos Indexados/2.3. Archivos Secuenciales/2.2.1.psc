ACCION 2.2.1() ES
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

    PROCESO
        Abrir e/(arch_alum)
        Leer(arch_alum, reg_alum)
        Escribir("Legajo | Apellido y nombre | DNI | Carrera")
        Mientras NFDA(arch_alum) hacer
            Escribir(reg_alum.Legajo, " | ", reg_alum.Apellido_Nombre, " | ", reg_alum.DNI, " | ", reg_alum.Carrera)
            Leer(arch_alum, reg_alum)
        Fin Mientras
        Cerrar(arch_alum)
Fin ACCION