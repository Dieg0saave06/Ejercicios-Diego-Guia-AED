ACCION supercorte() ES
    AMBIENTE
        fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        ventas = Registro
            nro_caja : N(3)
            forma_pago : {"EF", "TD", "TC"}
            nro_ticket : N(3)
            fecha_venta : fecha
            cantidad_articulos : N(3)
            importe_venta : N(6)
        FR

        arch_venta : Archivo de ventas ordenado por nro_caja, forma_pago, y nro_ticket
        reg_venta : ventas

        salida = Registro
            nro_caja : N(3)
            total_efectivo : N(6)
            total_tarjetas : N(6)
        FR

        arch_sal : Archivo de salida
        reg_sal : salida

        res_nro_caja : N(5)
        res_formaPago : {"EF", "TD", "TC"}
        total_formaPago, total_nro_caja, tot_efec, tot_tarjeta : entero

        procedimiento corte_formaPago() ES
            Escribir("El total de dinero recaudado de la caja N° ", res_nro_caja, " con la forma de pago ", res_formaPago, " es ", total_formaPago)
            total_nro_caja := total_nro_caja + total_formaPago
            total_formaPago := 0
            res_formaPago := reg_venta.forma_pago
        Fin procedimiento

        procedimiento corte_nro_caja() ES
            corte_formaPago()
            Escribir("El total de dinero recaudado de la caja N° ", res_nro_caja, " es ", total_nro_caja)
            reg_sal.nro_caja := res_nro_caja
            reg_sal.total_efectivo := tot_efec
            reg_sal.total_tarjetas := tot_tarjeta
            Grabar(arch_sal, reg_sal)
            Si tot_efec > tot_tarjeta entonces
                Escribir("La caja N° ", res_nro_caja, " tuvo mas recaudaciones en efectivo que con tarjetas.")
            Fin Si
            tot_efec := 0
            tot_tarjeta := 0
            total_nro_caja := 0
            res_nro_caja := reg_venta.nro_caja
        Fin procedimiento

    PROCESO
        Abrir E/(arch_venta)
        Leer(arch_venta, reg_venta)
        Abrir /S(arch_sal)
        total_formaPago := 0
        total_nro_caja := 0
        tot_efec := 0
        tot_tarjeta := 0
        res_nro_caja := reg_venta.nro_caja
        res_formaPago := reg_venta.forma_pago

        Mientras NFDA(arch_venta) hacer
            Si res_nro_caja <> reg_venta.nro_caja entonces
                corte_nro_caja()
            Sino
                Si res_formaPago <> reg_venta.forma_pago entonces
                    corte_formaPago()
                Fin Si
            Fin Si

            total_formaPago := total_formaPago + reg_venta.importe_venta
            Si reg_venta.forma_pago = "EF" entonces
                tot_efec := tot_efec + reg_venta.importe_venta
            Sino
                tot_tarjeta := tot_tarjeta + reg_venta.importe_venta
            Fin Si


            
            Leer(arch_venta, reg_venta)
        Fin Mientras
        corte_nro_caja()
        Cerrar(arch_venta)
        Cerrar(arch_sal)
Fin ACCION