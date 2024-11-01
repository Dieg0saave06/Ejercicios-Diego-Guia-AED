"Ejercicio 2.2.10¶
Del archivo general de alumnos de la U.T.N. - Facultad Regional Resistencia, 
ordenado por carrera, se desea emitir la cantidad de alumnos correspondientes a cada carrera y el total general."

ACCION 2.2.10() ES
    AMBIENTE
        Fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        Fin Registro
        
        alumnos = Registro
            Clave = Registro
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
        arch_alum : Archivo de alumnos ordenado por carrera
        reg_alum : alumnos
        resg_carrera : {"ISI", "IEM", "IQ"}
        total_alumnos, total_general : entero

        procedimiento corte_carrera()
            Escribir("El total de alumnos de la carrera de ", resg_carrera, " es: ", total_alumnos)
            total_general := total_general + total_alumnos
            total_alumnos := 0
            resg_carrera := reg_alum.carrera
        Fin procedimiento

    PROCESO
        Abrir E/(arch_alum) ; Leer(arch_alum, reg_alum)
        total_alumnos := 0
        total_general := 0
        resg_carrera := reg_alum.carrera
        Mientras NFDA(arch_alum) hacer
            Si resg_carrera <> reg_alum.carrera entonces
                corte_carrera()
            Fin Si
            total_alumnos := total_alumnos + 1
            Leer(arch_alum, reg_alum)
        Fin Mientras
        corte_carrera()
        Escribir("El total de alumnos es ", total_general, ".")
        Cerrar(arch_alum)
Fin ACCION