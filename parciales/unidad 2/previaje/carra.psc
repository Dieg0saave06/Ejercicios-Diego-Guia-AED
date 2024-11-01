ACCION ejercicio_1(Arr : Arreglo [1...200] de enteros) ES
    AMBIENTE
        Fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        Tarjeta = Registro
            DNI : N(8)
            num_cuenta : N(8)
            credito : N(10)
            ult_carga : Fecha
        FR

        arch_tarj : Archivo de tarjeta indexado por DNI
        reg_tarj : Tarjeta

        Turista = Registro
            DNI : N(8)
            nombre : AN(100)
            Fecha_nac : Fecha
            Telefono : AN(100)
            valido : booleano
        FR

        arch_turi : Archivo de Turista indexado por DNI
        reg_turi : Turista

        Facturas = Registro
            nro_factura : N(10)
            DNI : N(8)
            id_servicio : N(3)
            monto : N(7)
            fecha_carga : Fecha
        FR

        arch_fac : Archivo de facturas ordenado por nro_factura y DNI
        reg_fac : Facturas

        dolar, valor_dolar: entero
        



    PROCESO
        Abrir E/S(arch_tarj)
        Abrir E/S(arch_turi)
        Abrir E/(arch_fac) ; Leer(arch_fac, reg_fac)
        Escribir("Ingrese el valor del dolar: ")
        Leer(dolar)
        valor_dolar := dolar * 200

        Mientras NFDA(arch_fac) hacer
            Si (reg_fac.fecha_carga.MM > 9) y (reg_fac.fecha_carga.MM <= 12) entonces
                reg_tarj.DNI := reg_fac.DNI
                Leer(arch_tarj, reg_tarj)
                Si EXISTE entonces
                    Si (arr[reg_fac.id_servicio] = 1) y (reg_tarj.credito < valor_dolar) entonces

            



            
            reg_turi.DNI := reg_fac.DNI
            Leer(arch_turi, reg_turi)
           

