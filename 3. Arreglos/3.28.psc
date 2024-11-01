ACCION 3.28(V : Arreglo [1...6] de reales) ES 
    AMBIENTE 
        terrenos = Registro 
            nro_terreno : N(3)
            zona : {"A", B, C, D, E, F}
            ubicacion : 1...10
            superficie : N(6)
        FR 
        
        arch_te : Archivo de terrenos 
        reg_te : terrenos 
        
        Arr : Arreglo [1...7, 1...11] de reales 
        
        i, j : entero 
        cal, sup : real
        
        
    PROCESO 
        Abrir E/(arch_te) ; Leer(arch_te, reg_te)
        Para i := 1 hasta 7 hacer 
            Para j := 1 hasta 11 hacer 
                Arr[i ; j] := 0 
            Fin para 
        Fin para 
        
        Mientras NFDA(arch_te) hacer 
            Segun reg_te.zona hacer 
                = "A" : i := 1 
                = "B" : i := 2
                = "C" : i := 3
                = "D" : i := 4
                = "E" : i := 5
                = "F" : i := 6
            Fin Segun 
            
            j := reg_te.ubicacion 
            sup := reg_te.superficie 
            cal := (sup * V[i])
            
            Arr[7 ; j] := Arr[7 ; j] + cal 
            Arr[i ; 11] := Arr[i ; 11] + cal
            Arr[i ; j] := Arr[i ; j] + cal 
            Leer(arch_te, reg_te)
        Fin Mientras 
        
        Escribir("zonas  1  2  3  4  5  6  7  8  9  10  Total X zona")
        Para i := 1 hasta 7 hacer 
            Si i = 7 entonces 
                Escribir("Totales X zona")
            Sino 
                Segun i hacer 
                    = 1 : zon := "A"
                    = 2 : zon := "B"
                    = 3 : zon := "C"
                    = 4 : zon := "D"
                    = 5 : zon := "E"
                    = 6 : zon := "F"
                Fin segun
                Escribir(zon)
           Fin si 
           Para j := 1 hasta 11 hacer 
               Escribir(Arr[i ; j])
           Fin Para 
       Fin para 
Fin ACCION
           