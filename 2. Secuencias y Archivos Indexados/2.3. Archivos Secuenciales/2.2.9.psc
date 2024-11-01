ACCION 2.2.9() ES
    AMBIENTE
        productos = Registro
            Cod_producto : N(4)
            Tipo : {1, 2 , 3}
            Marca : AN(20)
            Modelo : AN(20)
            Descripcion : AN(100)
            Cantidad_Existente : N(2) 
            Precio_Unitario : N(6)
        FR

        arch_produc, salida : Archivo de productos ordenado por Cod_Producto
        reg_produc : productos
        c1, c2, c3, total: entero

    PROCESO
        Abrir E/(arch_produc)
        Abrir S/(salida)
        Leer(arch_produc, reg_produc)
        c1 := 0
        c2 := 0
        c3 := 0
        total := 0
        Mientras NFDA(arch_produc) hacer                                                                                    X + (X * 0.10)
            Si reg_produc.Tipo = 1 entonces                                                                                   X (1 + 1 * 0,10)
                c1 := c1 + 1                                                                                                   X * (1,10)
                // INVENTOS OSCUROS DE IAN: reg_produc.Precio_Unitario := reg_produc.Precio_Unitario * 1,10
                reg.Precio_Unitario := reg.Precio_Unitario + (reg.Precio_Unitario * 0.10)
                Grabar(salida, reg_produc)
            Fin Si
            Si reg_produc.Tipo = 2 entonces
                c2 := c2 + 1
                reg.Precio_Unitario := reg.Precio_Unitario + (reg.Precio_Unitario * 0.25)
                Grabar(salida, reg_produc)
            Fin Si
            Si reg_produc.Tipo = 3 entonces
                c3 := c3 + 1
                reg.Precio_Unitario := reg.Precio_Unitario + (reg.Precio_Unitario * 0.50)
                Grabar(salida, reg_produc)
            Fin Si
            Leer(arch_produc, reg_produc)
        Fin Mientras
        total := c1 + c2 + c3
        Escribir("Hay un total de ", c1, " productos de tipo 1 (calzados).")
        Escribir("Hay un total de ", c2, " productos de tipo 2 (Indumentaria).")
        Escribir("Hay un total de ", c3, " productos de tipo 3, accesorios (pelotas, raquetas, etc.).")
        Escribir("Hay una cantidad total de ", total, " productos en general.")
        Cerrar(arch_produc)
        Cerrar(salida)
Fin ACCION