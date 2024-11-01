ACCION 2.2.14() ES 
    AMBIENTE 
        censo = Registro 
            Radio : N(4)
            Manzana : N(2)
            Nro_vivienda : N(2)
            Condición_vivienda : ("Muy Buena", "Buena","Mala")
            Cantidad_habitantes : N(5)
        FR 
        
        arch_censo : Archivo de censo ordenado por Radio, Manzana, Nro_vivienda 
        reg_censo : censo 
        
        res_Manzana : N(2)
        res_Radio : N(4)
        cant_manzana, cant_radio, cant_general : entero 
        
        procedimiento corte_manzana() ES 
            Escribir("La cantidad de personas que habitan en viviendas con muy buena condicion en la manzana ", res_manzana, ", del radio" , res_radio, " es ", cant_manzana)
            cant_radio := cant_radio + cant_manzana 
            cant_manzana := 0 
            res_manzana := reg_censo.Manzana 
        Fin procedimiento 
        
        
        procedimiento corte_radio() ES 
            corte_manzana()
            Escribir("La cantidad de personas que habitan en viviendas con muy buena condicion en el radio ", res_radio, " es ", cant_radio)
            cant_general := cant_general + cant_radio 
            cant_radio := 0 
            res_radio := reg_censo.Radio 
        Fin procedimiento 
        
        
    PROCESO 
        Abrir E/(arch_censo) ; Leer(arch_censo, reg_censo)
        cant_manzana := 0 
        cant_radio := 0 
        cant_general := 0 
        res_manzana := reg_censo.Manzana 
        res_radio := reg_censo.Radio 
        
        Mientras NFDA(arch_censo) hacer 
            Si res_Radio <> reg_censo.Radio entonces 
                corte_radio()
            Sino 
                Si res_manzana <> reg_censo.Manzana entonces 
                    corte_manzana()
                Fin Si 
            Fin Si 
            
            Si reg_censo.Condicion_vivienda = "Muy Buena" entonces 
                cant_manzana := cant_manzana + reg_censo.Cantidad_habitantes 
            Fin Si 
            Leer(arch_censo, reg_censo)
        Fin Mientras 
        corte_radio()
        Escribir("El total general de personas que habitan viviendas en condiciones 'Muy buena' son ", cant_general)
        Cerrar(arch_censo)
Fin ACCION