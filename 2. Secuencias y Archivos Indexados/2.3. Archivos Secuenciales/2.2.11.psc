ACCION 2.2.11() ES
    AMBIENTE
        fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        alumnos = Registro
            Sexo : {"M", "F"}
            Carrera : {"ISI", "IEM", "LAR", "IEM"}
            Nro_Legajo : N(5)
            Fecha_Ingreso : fecha
            Total_Materias_Aprobadas : N(2)
        FR

        arch_alum : Archivo de alumnos ordenado Sexo, Carrera, Nro_Legajo
        reg_alum : alumnos
        res_sexo : {"M", "F"}
        res_carrera : {"ISI", "IEM", "LAR", "IEM"}
        total_sexo_mas20, total_sexo_meno20, total_carrera_mas20, total_carrera_meno20, total_general_mas20, total_general_meno20 : entero

        procedimiento corte_carrera()
            Escribir("El total de alumnos de genero ", res_sexo, " de la carrera ", res_carrera, " con menos a 20 materias aprobadas es ", total_carrera_meno20)
            Escribir("El total de alumnos de genero ", res_sexo, " de la carrera ", res_carrera, " con mas a 20 materias aprobadas es ", total_carrera_mas20)
            total_sexo_meno20 := total_sexo_meno20 + total_carrera_meno20
            total_sexo_mas20 := total_sexo_mas20 + total_carrera_mas20
            total_carrera_meno20 := 0
            total_carrera_mas20 := 0
            res_carrera := reg_alum.carrera
        Fin procedimiento

            // subaccion corte_n es
                // llamada al corte_n-1
                // Emitir resultados del nivel
                // Acumular totales al nivel superior
                // Reiniciar totales de este nivel
                // Resguardar la nueva clave
            // fin subaccion

        procedimiento corte_sexo()
            corte_carrera()
            Escribir("El total de alumnos de genero ", res_sexo, " con menos de 20 materias aprobadas es ", total_sexo_meno20)
            Escribir("El total de alumnos de genero ", res_sexo, " con mas de 20 materias aprobadas es ", total_sexo_mas20)
            total_general_meno20 := total_general_meno20 + total_sexo_meno20
            total_general_mas20 := total_general_mas20 + total_sexo_mas20
            total_sexo_meno20 := 0
            total_sexo_mas20 := 0
            res_sexo := reg_alum.Sexo
        Fin procedimiento



    PROCESO
        Abrir E/(arch_alum) ; Leer(arch_alum, reg_alum)
        total_sexo_mas20 := 0 ; total_sexo_meno20 := 0
        total_carrera_mas20 := 0 ; total_carrera_meno20 := 0
        total_general_mas20 := 0 ; total_general_meno20 := 0
        res_carrera := reg_alum.carrera
        res_sexo := reg_alum.Sexo
        Mientras NFDA(arch_alum) hacer
            Si res_sexo <> reg_alum.Sexo entonces
                corte_sexo()
            Sino
                Si res_carrera <> reg_alum.carrera entonces
                    corte_carrera()
                Fin Si
            Fin Si
            Si reg_alum.Fecha_de_Ingreso.AA = 2009 entonces
                Si reg_alum.Total_Materias_Aprobadas > 20 entonces
                    total_carrera_mas20 := total_carrera_mas20 + 1
                Sino
                    total_carrera_meno20 := total_carrera_meno20 + 1
                Fin Si
            Fin Si
            Leer(arch_alum, reg_alum)
        Fin Mientras
        corte_sexo()
        Escribir("El total de alumnos con mas de 20 materias aprobadas es ", total_general_mas20)
        Escribir("El total de alumnos con menos de 20 materias aprobadas es ", total_general_meno20)
        Cerrar(arch_alum)
Fin ACCION