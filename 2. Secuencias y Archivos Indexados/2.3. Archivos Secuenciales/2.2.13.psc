ACCION 2.2.13() ES
    AMBIENTE
        fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31

        reparaciones = Registro
            Cod_sucursal : N(6)
            Marca : AN(20)
            Modelo : AN(20)
            Cod_Tragamonedas : N(6)
            Fecha_reparacion : fecha
            Costo_reparacion : N(8)
        FR

        arch_reparaciones : Archivo de reparaciones ordenado por Cod_Sucursal, Marca, Modelo, Cod_Tragamonedas
        reg_reparaciones : reparaciones

        res_sucursal : N(6)
        res_marca : AN(20)
        res_modelo : AN(20)
        res_tragamonedas : N(6)
        
        cant_rep, cant_modelo, cant_marca, cant_codsucur, cant_general : entero
        costo_rep, costo_modelo, costo_marca, costo_codsucur, costo_general : entero

        procedimiento Corte_traga()
            Escribir("En la sucursal ", res_sucursal, ", la marca ", res_marca, ", del modelo ", res_modelo, "
            el tragamonedas ", res_tragamonedas, " tiene un total de ", cant_rep, " de reparaciones.")
            Escribir("El costo de las reparaciones del tragamonedas ", res_tragamonedas, ", de la marca ", res_marca, ", del modelo 
            ", res_modelo, ", de la sucursal ", res_codsucur, ", es de ", costo_rep, ".")
            cant_modelo := cant_modelo + cant_rep
            costo_modelo := costo_modelo + costo_rep
            cant_rep := 0 ; costo_rep := 0
            res_tragamonedas := reg_reparaciones.Cod_Tragamonedas
        Fin procedimiento

        procedimiento Corte_modelo()
            Corte_traga()
            Escribir("En la sucursal ", res_sucursal, ", la marca ", res_marca, ", del modelo ", res_modelo, " hay un total de ", cant_modelo, 
            " de reparaciones.")
            Escribir("El costo de las reparaciones de la marca ", res_marca, ", del modelo 
            ", res_modelo, ", de la sucursal ", res_codsucur, ", es de ", costo_modelo, ".")
            cant_marca := cant_marca + cant_modelo
            costo_marca := costo_marca + costo_modelo
            cant_modelo := 0 ; costo_modelo := 0
            res_modelo := reg_reparaciones.modelo
        Fin procedimiento

        procedimiento Corte_marca()
            Corte_modelo()
            Escribir("En la sucursal ", res_sucursal, ", la marca ", res_marca, " tiene un total de ", cant_marca, " de reparaciones.")
            Escribir("El costo de las reparaciones del modelo ", res_modelo, ", de la sucursal ", res_codsucur, ", es de ", costo_marca, ".")
            cant_codsucur := cant_codsucur + cant_marca
            costo_codsucur := costo_codsucur + costo_marca
            cant_marca := 0 ; costo_marca := 0
            res_marca := reg_reparaciones.Marca
        Fin procedimiento

        procedimiento Corte_codsucur()
            Corte_marca()
            Escribir("En la sucursal ", res_codsucur, " hay un total de ", cant_codsucur, " de reparaciones.")
            Escribir("El costo de las reparaciones de la sucursal ", res_codsucur, ", es de ", costo_marca, ".")
            cant_general := cant_general + cant_codsucur
            costo_general := costo_general + costo_codsucur
            cant_codsucur := 0 ; costo_codsucur := 0
            res_codsucur := reg_reparaciones.Cod_Sucursal
        Fin procedimiento


    PROCESO
        Abrir E/(arch_reparaciones)
        Leer(arch_reparaciones, reg_reparaciones)
        res_sucursal := reg_reparaciones.sucursal
        res_marca := reg_reparaciones.Marca
        res_modelo := reg_reparaciones.Modelo
        res_tragamonedas := reg_reparaciones.Cod_Tragamonedas

        cant_rep := 0 ; cant_modelo := 0 ; cant_marca := 0 ; cant_codsucur := 0 ; cant_general := 0
        costo_rep := 0 ; costo_modelo := 0 ; costo_marca := 0 ; costo_codsucur := 0 ; costo_general := 0

        Mientras NFDA(arch_reparaciones) hacer
            Si res_codsucur <> reg_reparaciones.Cod_Sucursal entonces
                Corte_codsucur()
            Sino
                Si res_marca <> reg_reparaciones.Marca entonces
                    Corte_marca()
                Sino 
                    Si res_modelo <> reg_reparaciones.modelo entonces
                        Corte_modelo()
                    Sino 
                        Si res_tragamonedas <> reg_reparaciones.Cod_Tragamonedas entonces
                            Corte_traga()
                        Fin Si
                    Fin Si
                Fin Si
            Fin Si
            cant_rep := cant_rep + 1
            costo_rep := costo_rep + reg_reparaciones.Costo_reparacion
            Leer(arch_reparaciones, reg_reparaciones)
        Fin Mientras
        Corte_codsucur()
        Escribir("La cantidad total de reparaciones es de: ", cant_general)
        Escribir("El costo total de las reparaciones es de: ", total_costo)
        Cerrar(arch_reparaciones)
Fin ACCION