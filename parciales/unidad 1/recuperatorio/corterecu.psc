ACCION ejercicio_2() ES
    AMBIENTE
        medallas = Registro
            Clave = Registro
                pais : AN(20)
                deporte : AN(20)
                categoria : AN(20)
                ano : N(4)
            FR
            MO : N(3)
            MP : N(3)
            MB : N(3)
        FR
        arch_M : Archivo de medallas ordenado por Clave 
        reg_M : medallas

        salida = Registro
            pais : AN(20)
            cant_m : N(3)   
        FR
        arch_sal : Archivo de salida
        reg_sal : salida

        procedimiento corte_categ() ES
            esc("La cantidad de medallas del pais  ", res_pais, " del deporte ", res_deporte, " de la categoria ", res_categoria, " es ", tot_categ)
            tot_deportes := tot_deportes + tot_categ
            tot_categ := 0
            res_categoria := reg.Clave.categoria
        Fin procedimiento

        procedimiento corte_carrera() es
            corte_categ()
            tot_pais := tot_pais + tot_deportes
            tot_deportes := 0
            res_deporte := reg.Clave.deporte
        Fin procedimiento

        procedimiento corte_pais() es
            corte_deporte()
            esc("El total de medellas del pais ", res_pais, " es ", tot_pais)
            Si cont_MO > 0 y cont_MP > 0 y cont_MB > 0 entonces
                reg_sal.pais := reg.Clave.pais
                reg_sal.cant_m := tot_pais
                grabar(salida, reg_sal)
            Fin Si
            tot_general := tot_general + tot_pais
            cont_MO := 0
            cont_MP := 0
            cont_MB := 0
            tot_pais := 0
            res_pais := reg.pais
        Fin procedimiento

    PROCESO
        Abrir E/(arch_M) ; Leer(arch_M, reg_M) ; Crear(salida)
        cont_MO := 0 ; cont_MP := 0 ; cont_MB := 0
        tot_pais := 0 ; tot_deportes := 0 ; tot_categ := 0 ; tot_general := 0
        res_pais := reg_M.Clave.pais
        res_deporte := reg_M.Clave.deporte
        res_categoria := reg_M.Clave.categoria

        Mientras NFDA(arch_M) hacer
            Si res_pais <> reg_M.Clave.pais entonces
                corte_pais()
            Sino
                Si res_deporte <> reg_M.Clave.deporte entonces
                    corte_carrera()
                Sino
                    Si res_categoria <> reg_M.Clave.categoria entonces
                        corte_categ()
                    Fin Si
                Fin Si
            Fin Si
    
            cont_MO := cont_MO + reg.MO
            cont_MP := cont_MP + reg.MP
            cont_MB := cont_MB + reg.MB
            tot_categ := tot_categ + cont_MO + cont_MP + cont_MB
            Leer(arch_M, reg_M)
        Fin Mientras  
        corte_pais()
        Escribir("El total general de medallas es ", tot_general, ".")
        Cerrar(arch_M)
        Cerrar(salida)
Fin ACCION
