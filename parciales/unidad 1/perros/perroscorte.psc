ACCION ejercicio() ES
    AMBIENTE
        adopciones = Registro
            Departamento : AN(50)
            localidad : AN(50)
            barrio : AN(100)
            DNI_adoptante : N(8)
            id_mascota : N(2)
            tipodecaniche : {"C", "F"}
            cant_anteriores : N(2)
        FR

        arch_adop : Archivo de adopciones ordenado por Departamento, localidad, barrio, DNI_adoptante, id_mascota
        reg_adop : adopciones

        salida = Registro
            Departamento : AN(50)
            localidad : AN(50)
            cant_anteriores : N(2)
        FR

        arch_salida : Archivo de salida
        reg_salida : salida

        res_depto
        res_loca
        res_barrio
        cant_adop_gatos
        cant_adop_perros
        cant_loca_gatos
        cant_loca_perros
        cant_general_gatos
        cant_general_perros

        procedimiento corte_barrio()
            Escribir("En el departamento ", res_depto, ", en la localidad ", res_loca, ", en el barrio ", res_barrio, " hay una cantidad de ", 
            cant_adop_perros, " perros adoptados.")
            Escribir("En el departamento ", res_depto, ", en la localidad ", res_loca, ", en el barrio ", res_barrio, " hay una cantidad de ", 
            cant_adop_gatos, " gatos adoptados.")
            cant_loca_perros := cant_loca_perros + cant_adop_perros
            cant_loca_gatos := cant_loca_gatos + cant_adop_gatos
            cant_adop_perros := 0
            cant_adop_gatos := 0
            res_barrio := reg_adop.barrio
        Fin procedimiento

        procedimiento corte_loca()
            corte_barrio()
            Escribir("En el departamento ", res_depto, ", en la localidad ", res_loca, ", hay una cantidad de ", cant_loca_perro, " adopciones.")
            Escribir("En el departamento ", res_depto, ", en la localidad ", res_loca, ", hay una cantidad de ", cant_loca_gatos, " adopciones.")
            cant_general_perros := cant_general_perros + cant_loca_perros
            cant_general_gatos := cant_general_gatos + cant_loca_gatos
            cant_loca_perro := 0
            cant_loca_gatos := 0
            res_loca := reg_adop.localidad
        Fin procedimiento


    PROCESO
        Abrir E/(arch_adop)
        Leer(arch_adop, reg_adop)

        res_depto := reg_adop.Departamento
        res_loca := reg_adop.localidad
        res_barrio := reg_adop.barrio

        cant_adop_gatos := 0 ; cant_loca_gatos := 0
        cant_loca_gatos := 0 ; cant_loca_perro := 0
        cant_general_gatos := 0 ; cant_general_perros := 0

        Mientras NFDA(arch_adop) hacer
            Si res_loca <> reg_adop.localidad entonces
                corte_loca()
            Sino
                Si res_barrio <> reg_adop.barrio entonces
                    corte_barrio()
                Fin Si
            Fin Si

            Si reg_adop.tipodecaniche = "C" entonces
                cant_adop_perros := cant_adop_perros + 1
            Sino
                cant_adop_gatos := cant_adop_gatos + 1
            Fin Si

            Si reg_adop.cant_anteriores > 3 entonces
                reg_salida.Departamento := reg_adop.Departamento
                reg_salida.localidad := reg_adop.localidad
                reg_salida.cant_anteriores := reg_adop.cant_anteriores
                Grabar(arch_salida, reg_salida)
            Fin Si

            Leer(arch_adop, reg_adop)

        Fin Mientras
        corte_loca()
        Escribir("El porcentaje de gatos adoptados en la provincia es de: ", (cant_general_gatos / (cant_general_gatos + cant_general_perros) * 100))
        Cerrar(arch_adop)
        Cerrar(arch_salida)
Fin ACCION