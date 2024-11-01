Accion DiegoXMajo()es 
    Ambiente
        Fecha = registro
            aa: N(4)
            mm: N(2)
            dd: N(2)
        Fr

        Totales = registro
            Barco : {1..3}
            Fecha : Fecha
            Obra : {1..5}
            Espectadores : N(3)
            Tot: N(5,2)
        Fr
        reg_T : Totales
        Arch_T : Archivo de Totales 

        Reg = registro
            Espec : N(6)
            Tot : N(5,2)
        Fr

        A: arreglo [1..3,1..13,1..5] de Reg 
        Barcomenos : {1..3}
        MenorBarc : T(5,2)
        MasEspec : entero
        resMes, ResMes2: N(2)
        ResBarc,ResBarc2: {1..3}
        MenorRec : real

    Proceso
        Abrir E/(Arch_T) ; Leer(Arch_T,reg_T)
        MasEspec := lv
        MenosBarc := Hv
        Para k:=1 a 5 hacer
            Para j:=1 a 13 hacer
                Para k:= 1 a 3 hacer
                    A[i,j,k].Espec := 0
                    A[i,j,k].Tot := 0
                FP
            Fp
        Fp
        Mientras NFDA (Arch_T) hacer
            i:= reg_T.Barco
            j:= reg_T.Fecha.mm
            k := reg_T.Obra
            A[i,j,k].Espec := A[i,j,k].Espec + reg_T.Espec
            A[i,j,k].Tot := A[i,j,k].Tot + reg_T.Tot
            A[i,13,k].Tot := A[i,13,k].Tot + reg_T.tot
            Leer(reg_T)
        Fm
        Cerrar(Arch_T)

        Para k:=1 a 5 hacer
            Para i:=1 a 3 hacer 
                Para j:=1 a 12 hacer
                    Si MenosBarc > A[i,j,k].Tot entonces
                        MenosBarc := A[i,j,k].Tot
                        resMes2 := j
                    Fs
                    Si MasEspec < A[i,j,k].Espec entonces
                        MasEspec:= A[i,j,k].Espec
                        resMes := j
                        resBarc := i
                        resObra := k
                    Fs
                Fp
                Esc("El barco",i "recaudo menos en el mes"j)
            Fp
        Fp
        Esc("La obra con mayor espectadores fue la obra",K " en el mes", j"y fue en el bark", i)
        
        Para k:=1 a 5 hacer
            Para i:=1 a 3 
                Si MenorRec > A[i,13,k] entonces
                    MenorRec := A[i,13,k]
                    ResBarc := i
                Fs
            Fp
            Esc("El barco",i "Fue el que recaudo menos en la obra",k)
        Fp
       
        

            

