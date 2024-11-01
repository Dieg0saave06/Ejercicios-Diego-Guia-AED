Accion 3_9(arr : arreglo [1...200] de libros) ES
    AMBIENTE 
        libros = Registro 
            nro_libro : N(3)
            titulo : AN(100)
            autor : AN(100)
            cant_hojas : N(3)
        FR 
        
     
        pos, mayorVol, D: entero 
        nomMay : AN(100)
    PROCESO 
        mayorVol := 0
        Para D := 1 hasta 200 hacer 
            Si arr[D].autor = "Nicklaus Wirth" entonces 
                Escribir("De 'Nicklaus Wirth' se posee el libro: ", arr[D].titulo)
                Si mayorVol <= arr[D].cant_hojas entonces 
                    nomMay := arr[D].titulo 
                    mayorVol := arr[D].cant_hojas 
                Fin Si 
        
                Si arr[D].titulo = “Algoritmos + Estructuras de Datos=Programa” entonces 
                    pos := D 
                Fin Si 
            Fin Si
       Fin Para 
       Escribir("El libro 'Algoritmos + Estructuras de datos' se encuentra en la posicion: ", pos)
       Escribir("El libro de 'Nicklaus Wirth' con mayor volumen es ", nomMay)
Fin ACCION