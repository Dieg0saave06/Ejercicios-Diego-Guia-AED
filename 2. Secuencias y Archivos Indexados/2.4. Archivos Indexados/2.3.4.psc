ACCION 2.3.4() ES
    AMBIENTE
        fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        productos = Registro
            cod_prod : N(4)
            nombre : AN(30)
            stock : N(2)
            precio : N(4)
        FR

        arch_prod : Archivo indexado por cod_prod
        reg_prod : productos

        ticket = Registro
            nro_ticket : N(4)
            fecha_t : fecha
            cliente : {"consumidor final"}
        FR

        arch_ticket : Archivo indexado por nro_ticket
        reg_ticket : ticket

        detalle_ticket = Registro
            nro_ticket : N(4)
            nro_linea : N(4)
            cod_prod : N(4)
            cantidad : N(3)
        FR

        arch_det : Archivo indexado por nro_ticket
        reg_det : detalle_ticket

        empresa : AN(30)
        cuit : N(11)
        cant_dada, cod_dado : N(4)
        subtotal, total : entero
        start1, start2 : {"Si", "No"}

    PROCESO
        Abrir E/S (arch_prod)
        Abrir /S (arch_det)
        Abrir /S (arch_ticket)

        Escribir("Ingrese la empresa: ") ; Leer(empresa)
        Escribir("Ingrese el CUIT: ") ; Leer(cuit)
        
        Escribir("¿Comenzar el programucho? ('Si', 'No')") ; Leer(start1)

        Mientras start1 = "Si" hacer
            reg_ticket.nro_ticket := OBTENER_TICKET()
            reg_ticket.fecha_t := fecha_actual()
            reg_ticket.cliente := "Consumidor Final"
            Grabar(arch_ticket, reg_ticket)

            reg_det.nro_linea := 0
            Escribir("Comprobante")
            Escribir("Empresa: ", empresa, "  CUIT: ", cuit, "  Fecha: ", fecha_actual())
            Escribir("Cliente: Consumidor Final")
            Escribir("Producto | Cantidad | Subtotal")
            total := 0

            Escribir("¿Ingresar productos? ('Si', 'No')") ; Leer(start2)

            Mientras start2 = "Si" hacer
                subtotal := 0
                Escribir("Ingrese el codigo de producto: ") ; Leer(cod_dado)
                reg_prod.cod_prod := cod_dado
                Leer(arch_prod, reg_prod)
                
                Si EXISTE entonces
                    Escribir("Ingrese la cantidad del producto a descontar: ") ; Leer(cant_dada)
                    reg_prod.stock := reg_prod - cant_dada
                    Regrabar(arch_prod, reg_prod)
                    
                    reg_det.nro_linea := reg_det.nro_linea + 1
                    reg_det.nro_ticket := reg_ticket.nro_ticket
                    reg_det.cod_prod := reg_prod.cod_prod
                    reg_det.cantidad := cant_dada
                    Grabar(arch_det, reg_det)

                    subtotal := cant_dada * reg_prod.precio
                    total := total + subtotal
                    Escribir(reg_prod.nombre, " | ", cant_dada, " | ", subtotal)
                Sino
                    Escribir("El producto no existe.")
                Fin Si
                Escribir("¿Desea seguir registrando mas productos? ('Si', 'No')")
                Leer(start2)
            Fin Mientras
            Escribir("Total: ", total)
            Escribir("¿Desea registrar mas ventas? ('Si', 'No')")
            Leer(start1)
        Fin Mientras
        Cerrar(arch_prod)
        Cerrar(arch_ticket)
        Cerrar(arch_det)
Fin ACCION