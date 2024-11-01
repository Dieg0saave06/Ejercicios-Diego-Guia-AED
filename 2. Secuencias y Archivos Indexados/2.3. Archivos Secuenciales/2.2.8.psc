ACCION 2.2.8() ES
    AMBIENTE
        Fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        compras = Registro
            N_cliente : N(3)
            FUC : Fecha
            Monto : N(5)
        FR

        arch_compras : Archivo de compras ordenado por Nro_Cliente
        reg_compras : compras

        clientes = Registro
            N_cliente : N(3)
            Apellido_Nombre : AN(30)
            Domicilio : AN(100)
            Telefono : N(10)
            DNI : N(8)
        FR

        arch_clientes : Archivo de clientes ordenado por Nro_Cliente
        reg_clientes : clientes
        fecha_dada : Fecha
        Monto_dado : N(5)

    PROCESO
        abrir E/(arch_compras)
        abrir E/(arch_clientes)
        Leer(arch_compras, reg_compras)
        Leer(arch_clientes, reg_clientes)
        Escribir("Ingrese una fecha (año/mes/dia): ")
        Leer(fecha_dada.AA)
        Leer(fecha_dada.MM)
        Leer(fecha_dada.DD)
        Escribir("Ingrese un monto: ")
        Leer(Monto_dado)
        Escribir("Nombre y Apellido | Fecha de ultima compra | Monto ")
        Mientras NFDA(arch_compras) y NFDA(arch_clientes) hacer
            Si (reg_compras.FUC > fecha_dada) y (reg_compras.Monto > Monto_dado) entonces
                Escribir(reg_clientes.Apellido_Nombre, " | ", reg_compras.FUC, " | ", reg_compras,compras)
            Fin Si
            Leer(arch_compras)
            Leer(arch_clientes)
        Fin Mientras
        Cerrar(arch_compras)
        Cerrar(arch_clientes)
Fin ACCION