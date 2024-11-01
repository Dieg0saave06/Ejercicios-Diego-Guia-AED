ACCION 2.2.15() ES 
    AMBIENTE 
        alumnos = Registro 
            Escuela : AN(100)
            Ano : N(4)
            Division : N(2)
            Nombre : AN(30)
            Cantidad_inasistencias : N(2)
        FR 
        
        arch_alumnos : Archivo de alumnos y ordenado por Escuela, Año, Division 
        reg_alumnos : alumnos 
        
        clases_dadas : entero 

        res_escuela : AN(100)
        res_ano : N(4)
        res_division : N(2)
        res_alumnos : AN(30)
        res_inasistencias : entero
        cant_libres_escuela, cant_inasistencias, cant_ano, cant_libres, cant_regulares, cant_escuela, cant_total : entero

        procedimiento corte_Division()
            Escribir("En la escuela ", res_escuela, ", del año ", res_ano, ", en la división ", res_division, " hay una cantidad de ", 
            cant_alumnos, " alumnos. ")
            cant_ano := cant_ano + cant_alumnos 
            cant_alumnos := 0
            res_division := reg_alumnos.division 
        Fin procedimiento 
            
        procedimiento corte_ano()
            corte_division()
            Escribir("En la escuela ", res_escuela, ", del año ", res_ano, " hay una cantidad de ", cant_libres, " alumnos libres. ")
            Escribir("En la escuela ", res_escuela, ", del año ", res_ano, " hay una cantidad de ", cant_regulares, " alumnos regulares. ")
            Escribir("En la escuela ", res_escuela, ", del año ", res_ano, " hay una cantidad total de ", cant_ano, " alumnos . ")
            cant_escuela := cant_escuela + cant_ano 
            cant_libres_escuela := cant_libres_escuela + cant_libres
            cant_libres := 0 
            cant_regulares := 0 
            cant_ano := 0 
            res_division := reg_alumnos.Division 
        Fin procedimiento

        procedimiento corte_escuela()
            corte_ano()
            Escribir("En la escuela ", res_escuela, " hay un total de ", cant_escuela, " alumnos.")
            Escribir("El porcentaje de alumnos libres es de: ", (cant_libres_escuela/cant_escuela) * 100)
            Escribir("El promedio de inasistencias por alumno es de: ", cant_inasistencias / cant_escuela)
            cant_total := cant_total + cant_escuela
            cant_escuela := 0
            cant_inasistencias := 0
            res_escuela := reg_alumnos.Escuela
        Fin procedimiento

    PROCESO
        Escribir("Escriba el total de clases dictadas en el año: ")
        Leer(clases_dadas)
        Abrir E/(arch_alumnos) ; Leer(arch_alumnos, reg_alumnos)
        cant_libres_escuela := 0 ; cant_inasistencias := 0 ; cant_ano := 0 ; cant_libres := 0 ; cant_regulares := 0 ; cant_escuela := 0 ; cant_total := 0
        res_escuela := reg_alumnos.Escuela
        res_ano := reg_alumnos.Ano
        res_division := reg_alumnos.Division

        Mientras NFDA(arch_alumnos) hacer
            Si res_escuela <> reg_alumnos.Escuela entonces
                corte_escuela()
            Sino 
                Si res_ano <> reg_alumnos.Ano entonces
                    corte_ano()
                Sino 
                    Si res_division <> reg_alumnos.Division entonces
                        corte_Division()
                    Fin Si
                Fin Si
            Fin Si

            Si 0,20 <= ((reg_alumnos.Cantidad_inasistencias / clases_dadas)) entonces
                cant_libres := cant_libres + 1
            Sino    
                cant_regulares := cant_regulares + 1
            Fin Si

            cant_alumnos := cant_alumnos + 1
            cant_inasistencias := cant_inasistencias + reg_alumnos.Cantidad_inasistencias
            
            Leer(arch_alumnos, reg_alumnos)

        Fin Mientras
        corte_escuela()
        Escribir("El total de alumnos es: ", cant_total)

Fin ACCION