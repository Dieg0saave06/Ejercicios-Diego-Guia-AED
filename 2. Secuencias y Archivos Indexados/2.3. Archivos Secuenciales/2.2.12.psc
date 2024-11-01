ACCION 2.2.12() ES
    AMBIENTE
        poblacion = Registro
            Provincia : AN(50)
            Departamento : AN(50)
            Ciudad : AN(50)
            Barrio : AN(50)
            ID_casa : N(10)
            Cantidad_Habitantes : N(6)
        FR
        
        arch_pob : Archivo de poblacion ordenado por Provincia, Departamento, Ciudad, Barrio, ID_Casa
        reg_pob : poblacion

        pob_salida = Registro
            Provincia : AN(50)
            Departamento : AN(50)            
            Cantidad_Habitantes : N(6)
        FR

        arch_sal : Archivo de pob_salida
        reg_sal : pob_salida

        res_depa, res_prov : AN(50)
        cant_habitantes : entero
        
        procedimiento corte_depa()
            reg_sal.Provincia := res_prov
            reg_sal.Departamento := res_depa
            reg_sal.Cantidad_Habitantes := cant_habitantes
            Grabar(arch_sal, reg_sal)
            res_depa := reg_pob.Departamento
            cant_habitantes := 0
        Fin procedimiento

        procedimiento corte_prov()
            corte_depa()
            res_prov := reg_pob.Provincia
        Fin procedimiento

    PROCESO
        Abrir E/(arch_pob) ; Abrir S/(arch_sal)
        Leer(arch_pob, reg_pob)
        cant_habitantes := 0
        res_depa := reg_pob.Departamento
        res_prov := reg_pob.Provincia

        Mientras NFDA(arch_pob) hacer
            Si res_prov <> reg_pob.Provincia entonces
                corte_prov()
            Sino
                Si res_depa <> reg_pob.Departamento entonces
                    corte_prov()
                Fin Si
            Fin Si
            cant_habitantes := cant_habitantes + reg_pob.cant_habitantes
            Leer(arch_pob, reg_pob)
        Fin Mientras
        corte_prov()
        cerrar(arch_pob)
        cerrar(arch_sal)
Fin ACCION

