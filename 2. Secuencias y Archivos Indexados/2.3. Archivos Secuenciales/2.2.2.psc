ACCION 2.2.2() ES
    AMBIENTE
        Fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        Fin Registro
        
        facturas = Registro
            N_factura : N(6)
            Fecha_factura : Fecha
            Total : N(10)
        Fin Registro

        Fecha_dada : Fecha
        Arch_facturas : Archivo de facturas
        reg_facturas : facturas

    PROCESO
        Escribir("Número de factura | Fecha de Factura | Total")
        Abrir e/(Arch_facturas)
        Leer(Arch_facturas, reg_facturas)
        Escribir("DAME UNA FECHA CON EL FORMATO 'AAAA/MM/DD': ")
        Leer(Fecha_dada.AA)
        Leer(Fecha_dada.MM)
        Leer(Fecha_dada.DD)
        Mientras NFDA(Arch_facturas) hacer
            Si (reg_facturas.Fecha_factura > Fecha_dada) y (reg_facturas.Total < 1000) entonces
                Escribir(reg_facturas.N_factura, " | ", reg_facturas.Fecha_factura, " | ", reg_facturas.Total)
            Fin Si
            Leer(Arch_facturas, reg_facturas)
        Fin Mientras
        Cerrar(Arch_facturas)
Fin ACCION


        