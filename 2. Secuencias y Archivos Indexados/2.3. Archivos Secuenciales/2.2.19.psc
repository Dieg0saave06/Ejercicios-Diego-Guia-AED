ACCION 2.2.19() ES 
    AMBIENTE 
        fecha = Registro 
            AA : N(4)
            MM : 1...12 
            DD : 1...31 
        FR 
        
        clave_remedios : Registro 
            farmacia : AN(60)
            medicamento : AN(60)
        FR 
        
        mae_remedios = Registro 
            clave : clave_remedios 
            cant_actual : N(4)
            fecha_venc : fecha 
        FR 
           
        arch_remedios, arch_sal: Archivo de mae_remedios ordenados por clave 
        reg_remedios, reg_sal: mae_remedios 
        
        
        movimientos = Registro 
            clave : clave_remedios 
            cod_mov : N(1)
            cant_recibida : N(4)
        FR 
        
        arch_movimientos : Archivo de movimientos ordenado por clave y cod_mov
        reg_movimientos : movimientos 
        
        rem_venc = Registro 
            medicamento : AN(60)
            cant_vencida : N(4)
        FR 
        
        arch_rem_venc : Archivo de rem_venc ordenado por medicamento  
        reg_rem_venc : rem_venc 

        procedimiento leer_mae() ES
            Leer(arch_remedios, reg_remedios)
            Si FDA(arch_remedios) entonces
                reg_remedios.clave := HV
            Fin Si
        Fin procedimiento

        procedimiento leer_mov() ES
            Leer(arch_movimientos, reg_movimientos)
            Si FDA(arch_movimientos) entonces
                reg_movimientos.clave := HV
            Fin Si
        Fin procedimiento

        fecha_actual : fecha

    PROCESO            
        Abrir E/(arch_remedios)
        Abrir E/arch_movimientos 
        Abrir /S(arch_rem_venc)
        Abrir /S(arch_sal)
        leer_mae()
        leer_mov()
        Escribir("Ingresa la fecha actual (AAAA/MM/DD): ")
        Leer(fecha_actual.AA)
        Leer(fecha_actual.MM)
        Leer(fecha_actual.DD)

            
        Mientras (reg_remedios.clave <> HV) o (reg_movimientos.clave <> HV) entonces
            Si arch_remedios.clave < arch_movimientos.clave entonces 
                Grabar(arch_sal, reg_remedios)
                leer_mae()
            Sino 
                Si (arch_remedios.clave = arch_movimientos.clave) entonces 
                    Si reg_movimientos.cod_mov = 1 entonces 
                        Escribir("ERROR")                
                    Sino 
                        Si reg_movimientos.cod_mov = 2 entonces
                            reg_rem_venc.medicamento = reg_remedios.medicamento 
                            reg_rem_venc = reg_remedios.cant_actual 
                            Grabar(arch_rem_venc, reg_rem_venc) 
                        Sino 
                            Si reg_movimientos.cod_mov = 3 entonces 
                                reg_sal = reg_remedios 
                                reg_sal.cant_actual = reg_remedios.cant_actual + reg_movimientos.cant_recibida 
                                Grabar(arch_sal, reg_sal)
                            Fin Si
                        Fin Si 
                    Fin Si
                    leer_mae()
                    leer_mov()
                Sino 
                    Si (reg_movimientos.cod_mov = 1) y (reg_remedios.fecha_venc >= fecha_actual + 30) entonces
                        reg_remedios.cant_actual := reg_movimientos.cant_recibida
                        reg_sal := reg_remedios
                        Grabar(arch_sal, reg_sal)
                    Sino
                        Escribir("ERROR")
                    Fin Si
                    leer_mov()
                Fin Si  
            Fin Si
        Fin Mientras
        Cerrar(arch_remedios)
        Cerrar(arch_movimientos)
        Cerrar(arch_sal)
        Cerrar(arch_rem_venc)
Fin Mientras