ACCION 2.3.1.a() ES
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

    PROCESO
        Abrir E/(arch_fac) ; Leer(arch_fac, reg_fac)
        Abrir E/S(arch_clientes)
        Escribir("Nro. Cliente | Nombre Cliente | Numero Factura")


        Mientras NFDA(arch_fac) hacer

            reg_clientes.nro_cliente := reg_fac.nro_cliente
            Leer(arch_clientes, reg_clientes)
            
            Si EXISTE entonces
                Mientras (reg_clientes.nro_cliente = reg_fac.nro_cliente) y NFDA(arch_fac) hacer
                    Escribir(reg_fac.nro_cliente, " | ", reg_clientes.nombre, " | ", reg_fac.nro_factura)
                    Leer(arch_fac, reg_fac)
                Fin Mientras
            Sino
                Escribir("Error, el cliente no existe.")
                Leer(arch_fac, reg_fac)
            Fin Si
            
        Fin Mientras
        Cerrar(arch_fac)
        Cerrar(arch_clientes)
Fin ACCION