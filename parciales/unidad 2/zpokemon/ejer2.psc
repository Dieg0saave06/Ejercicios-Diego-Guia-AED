ACCION ejercicio2(regio : Arreglo [1...31] de caracteres ; cate : Arreglo [1...16] de caracteres) ES
    AMBIENTE
        papers = Registro
            dni : N(8)
            ApeYnom : AN(50)
            email : AN(100)
            regional : N(2)
            categoria : N(2)
            titulo_trabajo : AN(50)
        FR

        arch_pa : Archivo de papers
        reg_pa : papers

        arr : Arreglo [1...32, 1...17] de enteros

        i, j, max : entero

    PROCESO

        Abrir E/(arch_pa)
        Leer(arch_pa, reg_pa)

        max := 1 
        
        Para i := 1 hasta 31 hacer
            Para 1 := 1 hasta 16 hacer
                arr[i ; j] := 0
            Fin Para
        Fin Para

        Mientras NFDA(arch_pa) hacer
            i := reg_pa.regional
            j := reg_pa.categoria

            arr[i ; j] := arr[i ; j] + 1
            arr[32 ; j] := arr[32 ; j] + 1
            arr[i ; 17] := arr[i ; 17] + 1
            Leer(arch_pa, reg_pa)
        Fin Mientras

        Para i := 1 hasta 31 hacer  
            Para j := 1 hasta 16 hacer
                Escribir("Para la categoria ", cate[j], " el total fue de ", arr[32 ; j])
            Fin Para
            Escribir("Para la regional ", regio[i], " el total fue de ", arr[i ; 17])
            Si arr[max ; 17] < arr[i ; 17] entonces
                max := i 
            Fin Si
        Fin Para
        
        Escribir("La regional con mas papers enviados fue la de ", regio[max], ".")
        Cerrar(arch_pa)

Fin ACCION