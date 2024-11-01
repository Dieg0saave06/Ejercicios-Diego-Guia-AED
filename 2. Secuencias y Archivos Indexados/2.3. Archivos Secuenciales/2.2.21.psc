ACCION 2.2.21() ES
    AMBIENTE
        Fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        clave_2 = Registro
            Cod_usuario : N(4)
            Cod_amigo : N(4)
        FR

        amigos = Registro
            clave : clave_2
            fecha_amistad : Fecha
            Mensaje_muro : AN(250)
        FR

        arch_amigos, arch_sal : Archivo de amigos ordenado por clave
        reg_amigos, reg_sal : amigos

        notificaciones = Registro
            clave : clave_2
            cod_movimiento : AN(1)
            fecha_amistad : Fecha
            Mensaje_muro : AN(250)
        FR

        arch_noti : Archivo de notificaciones ordenado por clave
        reg_noti : notificaciones

        procedimiento leer_amigos() ES
            Leer(arch_amigos, reg_amigos)
            Si FDA(arch_amigos) entonces
                reg_amigos.clave := HV
            Fin Si
        Fin procedimiento

        procedimiento leer_noti() ES
            Leer(arch_noti, reg_noti)
            Si FDA(arch_noti) entonces
                reg_noti.clave := HV
            Fin Si
        Fin procedimiento

    PROCESO
        Abrir E/(arch_amigos)
        Abrir E/(arch_noti)
        Abrir /S(arch_sal)
        Leer(arch_amigos, reg_amigos)
        Leer(arch_noti, reg_noti)

        Mientras (reg_amigos.clave <> HV) o (reg_noti.clave <> HV) entonces
            Si reg_amigos.clave < reg_noti.clave entonces
                reg_sal := reg_amigos
                Grabar(arch_sal, reg_sal)
                leer_amigos()
            Sino
                Si reg_amigos.clave = reg_noti.clave entonces
                    Si reg_noti.cod_movimiento = "A" entonces
                        Escribir("ERROR, YA SOIS AMIGOS.")
                    Sino
                        Si reg_noti.cod_movimiento = "B" entonces
                            Escribir("Amigo eliminado.")
                        Sino
                            Si reg_noti.cod_movimiento = "M" entonces
                                reg_amigos.Mensaje_muro := reg_noti.Mensaje_muro
                                reg_sal := reg_amigos
                                Escribir(arch_sal, reg_sal)
                            Sino
                                Escribir("Error, codigo desconocido.")
                            Fin Si
                        Fin Si
                    Fin Si
                    leer_amigos()
                    leer_noti()
                Sino
                    Si reg_noti.cod_movimiento = "A" entonces
                        reg_sal.Cod_usuario := reg_noti.Cod_usuario
                        reg_sal.Cod_amigo := reg_noti.Cod_amigo
                        reg_sal.fecha_amistad := reg_noti.fecha_amistad
                        reg_sal.Mensaje_muro := reg_noti.Mensaje_muro
                        Grabar(arch_sal, reg_sal)
                        leer_noti()
                    Fin Si
                Fin Si
            Fin Si
        Fin Mientras
        Cerrar(arch_amigos)
        Cerrar(arch_noti)
        Cerrar(arch_sal)
Fin ACCION