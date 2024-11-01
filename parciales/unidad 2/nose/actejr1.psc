ACCION ejercicio1(arr : Arreglo [1...26] de caracteres) ES
    AMBIENTE    
        productos = Registro
            id_producto : N(4)
            nombre : AN(50)
            descripcion : AN(100)
            categoria : {"C", "R", "G", "S"}
            nuevo_lan : {"Si", "No"}
            porcentaje_desc : N(1,2)
            stock : N(5)
        FR

        arch_p, arch_sal : Archivo de productos ordenado por id_producto
        reg_p, reg_sal : productos

        preventas = Registro
            id_producto : N(4)
            id_cliente : N(4)
            cantidad : N(5)
            es_perso : {"Si", "No"}
            nro_jugador : 1...26
            nombre_jug : AN(50)
            talle : N(1)
        FR
        arch_pre : Archivo de preventas ordenado por id_producto y id_cliente
        reg_pre : preventas

        procedimiento leer_prod()
            Leer(arch_p, reg_p)
            Si FDA(arch_p) entonces
                reg_p.id_producto := HV
            Fin Si
        Fin procedimiento

        procedimiento leer_prev()
            Leer(arch_pre, reg_pre)
            Si FDA(arch_pre) entonces
                reg_pre.id_producto := HV
            Fin Si
        Fin procedimiento

        faltante, perd, tot_fal, max, jug : entero
        rem, cam, gorr, short : entero

    PROCESO
        Abrir E/(arch_p) ; leer_prod()
        Abrir E/(arch_pre) ; leer_prev()
        Abrir /S(arch_sal)
        faltante := 0 ; perd := 0 ; tot_fal := 0
        rem := 0 ; cam := 0 ; gorr := 0 ; short := 0  
        max := LV ; jug := 0

        Mientras (reg_p.id_producto <> HV) o (reg_pre.id_producto <> HV) hacer
            Si reg_p.id_producto < reg_pre.id_producto entonces
                Grabar(arch_sal, reg_p)            
                leer_prod()
            Sino
                Si reg_p.id_producto = reg_pre.id_producto entonces   
                    Si max < reg_pre.cantidad entonces
                        max := reg_pre.cantidad
                        jug := reg_pre.nro_jugador
                    Fin Si
                    Si reg_pre.cantidad > reg_p.stock entonces
                        faltante := (reg_pre.cantidad - reg_p.stock)
                        Escribir("Error, falta de stock.")
                    Si reg_pre.cantidad < reg_p.stock entonces  
                        reg_sal := reg_p
                        reg_sal.stock := reg_sal.stock - reg_pre.cantidad
                        Grabar(reg_sal, reg_sal)
                    Fin Si
                    Segun reg_p.categoria hacer
                        = "C" : cam := cam + 1
                        = "R" : rem := rem + 1
                        = "G" : gorr := gorr + 1
                        = "S" : short := short + 1
                    Fin Segun
                    leer_prod()
                    leer_prev()
                Sino
                    perd := perd + reg_pre.cantidad
                    Escribir("Error, producto inexistente")
                    leer_prev()
                Fin Si
            Fin Si
        Fin Mientras
        tot_fal := faltante + perd
        Escribir("El jugador que vendio mas camisetas fue ", arr[jug])
        Escribir("Se procesaron una cantidad de ", tot_fal, " productos por falta de stock. ")

        Si (cam < rem) y (cam < gorr) y (cam < short) entonces  
            Escribir("Las camisetas fueron las menos solicitadas. ")
        Sino
            Si (rem < cam) y (rem < gorr) y (rem < short) entonces  
                Escribir("Las remeras fueron las menos solicitadas. ")
            Sino
                Si (gorr < rem) y (gorr < cam) y (gorr < short) entonces  
                    Escribir("Las gorras fueron las menos solicitadas. ")
                Sino
                    Escribir("Los short fueron los menos solicitados. ")
                Fin Si
            Fin Si
        Fin Si
        Cerrar(arch_p)
        Cerrar(arch_pre)
        Cerrar(arch_sal)
Fin ACCION
