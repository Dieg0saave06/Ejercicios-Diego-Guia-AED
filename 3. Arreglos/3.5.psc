ACCION 3.5(A: arreglo [1 .. 30] de reales ; B: arreglo [1 .. 30] de reales)
    AMBIENTE 
    C : arreglo [1 .. 60] de reales 
    ia, ib : entero

    PROCESO 
        ia := 1 ; ib := 1
        
        Mientras (ia <=30) y (ib <=30) hacer 
            Si A[ia] < B[ib] entonces 
                C[ia] := A[ia]
                ia := ia + 1
            Sino 
                Si A[ia] > B[ib] entonces 
                    C[ib] := B[ib]
                    ib := ib + 1
                Sino 
                    C[ia] := A[ia]
                    C[ib] := B[ib]
                    ia := ia + 1 
                    ib := ib + 1
                Fin Si 
            Fin Si 
       Fin Mientras 

       Mientras ia <=30 hacer 
           C[ia] := A[ia]
           ia := ia + 1 
       Fin Mientras 
       
       Mientras ib <=30 hacer 
           C[ib] := A[ib]
           ib := ib + 1 
       Fin Mientras
Fin ACCION