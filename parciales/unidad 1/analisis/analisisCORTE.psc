ACCION ejercicio2() ES
    AMBIENTE
        servicio = Registro
            sucursal : N(4)
            area : N(1)
            id_serv : N(6)
            desc : AN(45)
            cant_cli : N(4)
            monto : N(6.2)
        FR

        arch_servicio : Archivo de servicio ordenado por sucursal, area y id_serv
        reg_servicio : servicio

        res_sucursal : N(4)
        res_area : N(1)

        total_general, cant_area, cant_sucursal, aux: entero 


        procedimiento corte_area() ES
            Si (res_area = 1) y (cant_area > 2000000) entonces
                Escribir("El monto facturado de la sucursal ", res_sucursal, " del area ", res_area, " ha superado los $2.000.000, el cual es: $", cant_area, ".")
            Sino
                Escribir("El monto facturado de la sucursal ", res_sucursal, " del area ", res_area, " es $", cant_area, ".")
            Fin Si
            cant_sucursal := cant_sucursal + cant_area
            cant_area := 0
            res_area := reg_servicio.area
        Fin procedimiento

        procedimiento corte_sucursal() ES
            corte_area()
            Escribir("El monto facturado de la sucursal ", res_sucursal, " es ", cant_sucursal, ".")
            total_general := total_general + cant_sucursal
            Si res_sucursal = 0001 entonces
                aux := cant_sucursal
            Fin Si
            cant_sucursal := 0
            res_sucursal := reg_servicio.sucursal
        Fin procedimiento


    PROCESO
        Abrir E/(arch_servicio) ; Leer(arch_servicio, reg_servicio)
        total_general := 0 
        cant_sucursal := 0 
        cant_area := 0
        aux := 0
        res_area := reg_servicio.area
        res_sucursal := reg_servicio.sucursal

        Mientras NFDA(arch_servicio) hacer
            Si res_sucursal <> reg_servicio.sucursal entonces
                corte_sucursal()
            Sino
                Si res_area <> reg_servicio.area entonces
                    corte_area()
                Fin Si
            Fin Si

            Si reg_servicio.cant_cli > 100 entonces
                cant_area := cant_area + reg_servicio.monto
            Fin Si

            Si reg_servicio.cant_cli < 10 entonces
                contrataciones := contrataciones + 1
            Fin Si

            Leer(arch_servicio, reg_servicio)

        Fin Mientras
        corte_sucursal()
        Si aux < total_general * 0,20 entonces
            Escribir("El total facturado por la sucursal 1 es menor al 20% del total facturado por toda la empresa.")
        Sino 
            Si aux > total_general * 0,20 entonces
                Escribir("El total facturado por la sucursal 1 es mayor al 20% del total facturado por toda la empresa.")
            Sino 
                Escribir("El total facturado por la sucursal 1 es igual al 20% del total facturado por toda la empresa.")
            Fin Si
        Fin Si
        Escribir("El monto general total facturado es de la empresa es de ", total_general, ".")
        Escribir("La cantidad de contrataciones que no alcazaron los 10 clientes es ", contrataciones ".")
        cerrar(arch_servicio)
Fin ACCION