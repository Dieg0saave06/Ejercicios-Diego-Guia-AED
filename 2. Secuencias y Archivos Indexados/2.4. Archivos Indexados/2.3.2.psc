ACCION 2.3.2() ES
    AMBIENTE
        Fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        empleados = Registro
            Nro_sucursal : N(3)
            Categoria : {"A", "B", "C"}
            Nom_empleado : AN(30)
            Cod_curso : N(3)
            Tecnico : {"SI", "NO"}
        FR

        arch_empleados : Archivo de empleados ordenado por Nro_sucursal y Categoria
        reg_empleados : empleados

        curso = Registro
            Cod_curso : N(3)
            Nombre : AN(30)
            Fech : Fecha
            cant_horas : N(3)
        FR

        arch_curso : Archivo indexado por Cod_curso
        reg_curso : curso

        res_nro_sucur : N(3)
        res_categoria : {"A", "B", "C"}
        empleado_tec, empleado_NoTec, tot_categoria, sucur_tec, sucur_Notec, tot_sucur, tot_tec, tot_Notec, tot_general : entero

        procedimiento corte_categoria() ES
            Escribir("Para la sucursal N° ", res_nro_sucur, ", de la categoria ", res_categoria, " hay una total de ", empleado_tec, " empleados tecnicos, y un total de ", empleado_NoTec, " empleados no tecnicos.")
            Escribir("Para la sucursal N° ", res_nro_sucur, ", de la categoria ", res_categoria, " hay una total de ", tot_categoria, " empleados.")
            sucur_tec := sucur_tec + empleado_tec
            sucur_Notec := sucur_Notec + empleado_NoTec
            tot_sucur := tot_sucur + tot_categoria
            empleado_tec := 0
            empleado_NoTec := 0
            tot_categoria := 0
            res_categoria := reg_empleados.categoria
        Fin procedimiento

        procedimiento corte_sucursal() ES
            corte_categoria()
            Escribir("Para la sucursal N° ", res_nro_sucur, " hay una total de ", sucur_tec, " empleados tecnicos, y un total de ", sucur_Notec, " empleados no tecnicos.")
            Escribir("Para la sucursal N° ", res_nro_sucur, " hay una total de ", tot_sucur, " empleados.")
            tot_tec := tot_tec + sucur_tec
            tot_Notec := tot_Notec + sucur_Notec
            tot_general := tot_general + tot_sucur
            sucur_tec := 0
            sucur_Notec := 0
            tot_sucur := 0 
            res_nro_sucur := reg_empleados.Nro_sucursal
        Fin procedimiento

    PROCESO
        Abrir E/(arch_empleados) ; Leer(arch_empleados, reg_empleados)
        Abrir E/S(arch_curso)
        empleado_tec := 0 ; empleado_NoTec := 0 ; tot_categoria := 0 
        sucur_tec := 0 ; sucur_Notec := 0 ; tot_sucur := 0
        tot_tec := 0 ; tot_Notec := 0 ; tot_general := 0

        res_categoria := reg_empleados.categoria
        res_nro_sucur := reg_empleados.Nro_sucursal

        Mientras NFDA(arch_empleados) hacer
            Si res_nro_sucur <> reg_empleados.Nro_sucursal entonces
                corte_sucursal()
            Sino
                Si res_categoria <> reg_empleados.categoria entonces
                    corte_categoria()
                Fin Si
            Fin Si

            reg_curso.Cod_curso := reg_empleados.Cod_curso
            Leer(arch_curso, reg_curso)

            Si EXISTE entonces  
                Escribir(reg_empleados.Nro_sucursal, reg_empleados.categoria, reg_empleados.Nom_emplead, reg_curso.Nombre)
            Sino
                Escribir("Error, el empleado no existe.")
            Fin Si
            Si reg_empleados.tecnico = "SI" entonces
                empleado_tec := empleado_tec + 1 
            Sino
                empleado_NoTec := empleado_NoTec + 1
            Fin Si
            tot_categoria := tot_categoria + 1
            Leer(arch_empleados, reg_empleados)
        Fin Mientras
        corte_sucursal()
        Escribir("El total general de empleados tecnicos de la empresa es ", tot_tec)
        Escribir("El total general de no empleados tecnicos de la empresa es ", tot_Notec)
        Escribir("El total general de empleados de la empresa es ", tot_general)
        Cerrar(arch_empleados)
        Cerrar(arch_curso)
Fin Mientras