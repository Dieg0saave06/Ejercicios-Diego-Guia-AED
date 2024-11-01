ACCION 
    fecha = Registro
        AA : N(4)
        MM : 1...12
        DD : 1...31
    FR

    cliente = Registro
        id_casa : N(2)
        fecha_ult_lectura : fecha
        cant_lecturas : N(3)
        prom_lecturas : N(2)
        tipo_consumidor : {"A", "B", "C"}
    FR
    arch_clientes, arch_sal : Archivo de cliente ordenado por id_casa
    reg_clientes, reg_sal : cliente

    mediciones = Registro
        id_casa : N(2)
        fecha_medicion : fecha
        consumo : N(3)
    FR
    arch_mediciones : Archivo de mediciones
    reg_mediciones : mediciones
    

    procedimiento leer_clientes() ES
        Leer(arch_clientes, reg_clientes)
        Si FDA(arch_clientes) entonces
            reg_clientes.id_casa := HV
        Fin Si
    Fin procedimiento

    procedimiento leer_mediciones() ES
        Leer(arch_mediciones, reg_mediciones)
        Si FDA(arch_mediciones) entonces
            reg_mediciones.id_casa := HV
        Fin Si
    Fin procedimiento
    
    Funcion tipo_consu(promedio : entero) : caracter
        Segun promedio hacer
            < 20000 : tipo_consu() := "A"
            < 40000 : tipo_consu() := "B"
            >= 40000 : tipo_consu() := "C"
        Fin Segun
    Fin Funcion

    res_id_casa : N(2)
    res_fech : fecha
    cont_lecturas, tot_consumo, promedio : entero


    procedimiento tratar_mov() ES
        res_id_casa := reg_mediciones.id_casa
        cont_lecturas := 0
        tot_consumo := 0
        Mientras (reg_mediciones.id_casa = res_id_casa) hacer
            cont_lecturas := cont_lecturas + 1
            res_fech := reg_mediciones.fecha_medicion
            tot_consumo := tot_consumo + reg_mediciones.consumo
            leer_mediciones()
        Fin Mientras
    Fin procedimiento

    PROCESO 
        Abrir E/(arch_clientes)
        Abrir E/(arch_mediciones)   
        Abrir /S(arch_sal)
        leer_clientes()
        leer_mediciones()

        
        Mientras (reg_clientes.IDcasa <> HV) o (reg_mediciones.IDcasa <> HV) hacer 
            Si reg_clientes.IDcasa < reg_mediciones.IDcasa entonces 
                reg_sal := reg_clientes
                Grabar(arch_sal, reg_sal)
                leer_clientes()
            Sino 
                Si reg_clientes.IDcasa > reg_mediciones.IDcasa entonces 
                    tratar_mov()
                    reg_sal.id_casa := res_id_casa
                    reg_sal.fecha_ult_lectura := res_fech
                    reg_sal.cant_lecturas := cont_lecturas
                    reg_sal.prom_lecturas := tot_consumo div cont_lecturas
                    reg_sal.tipo_consumidor := tipo_consu(reg_sal.prom_lecturas)
                    Grabar(arch_sal, reg_sal)
                Sino
                    tratar_mov()
                    promedio := tot_consumo div cont_lecturas
                    reg_sal.id_casa := res_id_casa
                    reg_sal.fecha_ult_lectura := res_fech
                    reg_sal.cant_lecturas := reg_clientes.cant_lecturas + cont_lecturas
                    reg_sal.prom_lecturas := (reg_clientes.prom_lecturas + promedio) div 2
                    reg_sal.tipo_consumidor := tipo_consu(reg_sal.prom_lecturas)
                    Grabar(arch_sal, reg_sal)
                    leer_clientes()
                Fin Si
            Fin Si
        Fin Mientras
        Cerrar(arch_clientes)
        Cerrar(arch_mediciones)
        Cerrar(arch_salh_)
Fin ACCION