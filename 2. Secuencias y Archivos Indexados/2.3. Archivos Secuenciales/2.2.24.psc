ACCION 2.2.24() ES
    AMBIENTE
        Fecha = Registro
            AA : N(4)
            MM : 1..12
            DD : 1...31
        FR

        costos_por_afil = Registro
            cod_afiliado : N(3)
            fecha_alta : Fecha
            fecha_baja : Fecha
            cant_servicios : N(2)
            costo : N(5)
        FR

        arch_cpa, arch_sal : Archivo de costos_por_afil ordenado por cod_afiliado
        reg_cpa, reg_sal : costos_por_afil

        servicios_semanales = Registro
            cod_afiliado : N(3)
            fecha_At : Fecha
            cod_servicio : N(3)
            costo : N(5)
        FR

        arch_serv : Archivo de servicios_semanales ordenado por cod_afiliado 
        reg_serv : servicios_semanales

 
        procedimiento leer_cpa() ES
            Leer(arch_cpa, reg_cpa)
            Si FDA(arch_cpa) entonces
                reg_cpa.cod_afiliado := HV
            Fin Si
        Fin procedimiento

        procedimiento leer_serv() ES
            Leer(arch_serv, reg_serv)
            Si FDA(arch_serv) entonces
                reg_serv.cod_afiliado := HV
            Fin Si
        Fin procedimiento

        cant_serv, tot_costo : entero
        procedimiento Tratar_afiliados() ES
            tot_costo := 0
            cant_serv := 0
            Mientras reg_cpa.cod_afiliado = reg_serv.cod_afiliado hacer
                cant_serv := cant_serv + 1
                tot_costo := tot_costo + reg_serv.costo
                leer_serv()
            Fin Mientras
        Fin procedimiento
    
    PROCESO
        Abrir E/(arch_cpa) ; leer_cpa()
        Abrir E/(arch_serv) ; leer_serv()
        Abrir /S(arch_sal)

        Mientras (reg_cpa.cod_afiliado <> HV) o (reg_serv.cod_afiliado <> HV) hacer
            Si reg_cpa.cod_afiliado < reg_serv.cod_afiliado entonces
                reg_sal := reg_cpa
                Grabar(arch_sal, reg_sal)
                leer_cpa()
            Sino
                Si reg_cpa.cod_afiliado > reg_serv.cod_afiliado entonces
                    Si reg_serv.cod_servicio = 001 entonces 
                        reg_sal.cod_afiliado := reg_serv.cod_afiliado
                        reg_sal.fecha_alta := reg_serv.fecha_At
                        reg_sal.cant_servicios := 1
                        reg_sal.costo := reg_serv.costo
                        Grabar(arch_sal, reg_sal)
                    Sino
                        Escribir("Error de alta.")
                    Fin Si
                    leer_serv()
                Sino
                    Si reg_cpa.cod_afiliado = reg_serv.cod_afiliado entonces
                        Si reg_serv.cod_servicio = 000 entonces
                            reg_sal := reg_cpa
                            reg_sal.fecha_baja := reg_serv.fecha_At
                            Grabar(arch_sal, reg_sal)
                            leer_serv()
                        Sino    
                            Tratar_afiliados()
                            reg_sal := reg_cpa
                            reg_sal.cant_servicios := reg_sal.cant_servicios + cant_serv 
                            reg_sal.costo := reg_sal.costo + tot_costo
                            Grabar(arch_sal, reg_sal)
                        Fin Si
                        leer_cpa()
                    Fin Si
                Fin Si
            Fin Si
        Fin Mientras
        Cerrar(arch_cpa)    
        Cerrar(arch_serv)    
        Cerrar(arch_sal)    
Fin ACCION
          