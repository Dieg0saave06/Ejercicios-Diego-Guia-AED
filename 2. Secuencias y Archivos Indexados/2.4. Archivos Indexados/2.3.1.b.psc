ACCION 2.3.1.b() ES
    AMBIENTE
        fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        facturas = Registro
            nro_cliente : N(3)
            nro_factura : N(5)
            fech : fecha
            importe : N(6)
        FR

        arch_fac : Archivo de facturas ordenado por nro_cliente, nro_factura
        reg_fac : facturas

        clientes = Registro
            nro_cliente : N(3)
            nombre : AN(30)
            DNI : N(8)
            cuit : N(11)
            domicilio : AN(50)
        FR

        arch_clientes : Archivo de clientes indexado por nro_cliente
        reg_clientes : clientes
        tot_importe, cant_facturas : entero

        procedimiento tratar_factura() ES
            tot_importe := 0
            cant_facturas := 0
            Mientras (reg_clientes.nro_cliente = reg_fac.nro_cliente) y NFDA(arch_fac) hacer
                tot_importe := tot_importe + reg_fac.importe
                cant_facturas := cant_facturas + 1
                Leer(arch_fac, reg_fac)
            Fin Mientras
        Fin procedimiento


    PROCESO
        Abrir E/(arch_fac) ; Leer(arch_fac, reg_fac)
        Abrir E/(arch_clientes)
        Escribir("Nro. Cliente | Nombre Cliente | Total Facturado | Cantidad de Facturas")

        Mientras NFDA(arch_fac) hacer

            reg_clientes.nro_cliente := reg_fac.nro_cliente
            Leer(arch_clientes, reg_clientes)
        
            Si EXISTE entonces
                tratar_factura()
                Escribir(reg_clientes.nro_cliente, " | ", reg_clientes.nombre, " | ", tot_importe, " | ", cant_facturas)
                Leer(arch_fac, reg_fac)
            Sino
                Escribir("Error, el cliente no existe.")
                Leer(arch_fac, reg_fac)
            Fin Si
        Fin Mientras
        Cerrar(arch_fac)
        Cerrar(arch_clientes)
Fin ACCION