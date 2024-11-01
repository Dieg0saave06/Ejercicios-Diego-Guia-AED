ACCION 3.24()
    AMBIENTE
        empleados = Registro
            NomyApe : AN(50)
            nro_caja : N(5)
            imp_facturado : N(6)
            hora_fact : N(4)
        FR

        arch_emp : Archivo de empleados ordenado por NomyApe
        reg_emp : empleados
        arr : Arreglo [1...11, 1...6] de reales
        i, h : entero
        imp := reales

    PROCESO
        Abrir E/(arch_emp) ; Leer(arch_emp, reg_emp)

        Para i := 1 hasta 11 hacer
            Para j := 1 hasta 6 hacer
                arr[i ; j] := 0
            Fin Para
        Fin Para

        Mientras NDFA(arch_emp) hacer
            i := reg_emp.nro_caja
            h := reg_emp.hora_fact
            imp := reg_emp.imp_facturado

            Si (h >= 8) y (h <= 10) entonces
                j := 1
            Sino
                Si (h >= 10) y (h <= 12) entonces
                    j := 2
                Sino
                    Si (h >= 12) y (h <= 16) entonces
                        j := 3
                    Sino
                        Si (h >= 16) y (h <= 18) entonces
                            j := 4
                        Sino
                            Si (h >= 18) y (h <= 20) entonces
                                j := 5
                            Fin Si
                        Fin Si
                    Fin Si
                Fin Si
            Fin Si
            arr[i ; j] := arr[i ; j] + imp
            arr[i ; 6] := arr[i ; 6] + imp
            arr[11 ; j] := arr[11 ; j] + imp
            arr[11 ; 6] := arr[11 ; 6] + imp
            Leer(arch_emp, reg_emp)
        Fin Mientras

        Cerrar(arch_emp)
        Para i := 1 hasta 10 hacer
            Para j := 1 hasta 5 hacer
                Segun j hacer
                    1 : hora := "8 - 10"
                    2 : hora := "10 - 12"
                    3 : hora := "12 - 16"
                    4 : hora := "16 - 18"
                    5 : hora := "18 - 20"
                Fin Segun 
                Escribir("Para el horario ", hora, " hubo un importe total de ", arr[11 ; j])
            Fin Para
            Escribir("Para la caja N° ", i, " hubo un importe total de ", arr[i ; 6])
        Fin Para
        Escribir("El importe total general fue de ", arr[11 ; 6])
Fin ACCION