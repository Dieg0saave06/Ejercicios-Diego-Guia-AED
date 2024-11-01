ACCION carra2(arr : Arreglo [1...23] de enteros)
    AMBIENTE
        Fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        viajes = Registro
            DNI : N(8)
            fechaV : Fecha
            prov_destino : N(2)
            monto_credito : N(10)
        FR

        arch_viajes : Archivo de viajes
        reg_viajes : viajes
        menor_monto, tot_credito, c : entero
        matriz : Arreglo [1...12, 1...23, 1...2] de enteros

    PROCESO

        Abrir E/(arch_viajes)
        Leer(arch_viajes, reg_viajes)

        menor_monto := HV
        c := 1
        tot_credito := 0 

        Para i := 1 hasta 12 hacer
            Para j := 1 hasta 23 hacer
                Para k := 1 hasta 2 hacer
                    matriz[i ; j ; k] := 0
                Fin Para
            Fin Para
        Fin Para

        Mientras NDFA(arch_viajes) hacer
            matriz[reg_viajes.fechaV.MM ; reg_viajes.prov_destino ; 1] := matriz[reg_viajes.fechaV.MM ; reg_viajes.prov_destino ; 1] + 1
            matriz[reg_viajes.fechaV.MM ; reg_viajes.prov_destino ; 2] := matriz[reg_viajes.fechaV.MM ; reg_viajes.prov_destino ; 2] + reg_viajes.monto_credito
            Leer(arch_viajes, reg_viajes)
        Fin Mientras

        Para i := 1 hasta 12 hacer
            Para j := 1 hasta 23 hacer
                Escribir("La provincia ", arr[j], " y el mes ", i, " hay una cantidad de viajes de ", matriz[i ; j ; 1], ", y monto de credito de ", matriz[i ; j ; 2])
                Si menor_monto > matriz[i ; j ; 2] entonces
                    menor_monto := matriz[i ; j ; 2]
                Fin Si
                Si i = 11 entonces
                    Si matriz[i ; c ; 1] < matriz[i ; j ; 1] entonces
                        c := i
                    Fin Si
                Fin Si
                tot_prov := tot_prov + matriz[i ; j ; 2]
            Fin Para
            Escribir("El promedio de credito del mes ", i, " es ", (tot_prov/12))
            tot_prov := 0
        Fin Para 

        Escribir("El destino mas concurrido en noviembre es ", arr[c])
        Cerrar(arch_viajes)
Fin ACCION
