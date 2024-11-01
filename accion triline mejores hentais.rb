ACCION tri_line (Audi : arreglo de [1...20]) es
    AMBIENTE
        FECHA = registro
            AA : N(4)
            MM : N(2)
            DD : N(2)
        FR
        
        RECLAMOS = registro ord. por Region y CodRecl
            CodRecl : N(10)
            FechaRecl : FECHA
            MailCliente : AN(20)
            Urgencia : {"A";"B";"C"}
            Detalle : AN(100)
            Region : N(2)
        FR

        REPORTE = registro index. por Region
            Region : N(2)
            UltFechaRec : FECHA
            UrgAlta : N(6)
            UrgMedia : N(6)
            UrgBaja : (6) 
            NueAud : {"S";"N"}
        FR    

        Arch_R : archivo de RECLAMOS ord. por Region y CodRecl
        Reg_R : RECLAMOS
        Arch_Rep : archiv de REPORTE index. por Region
        Reg_Rep : REPORTE

        Resg_Reg : entero
        i : entero
        PROCEDIMIENTO leerReclamo () es
            leer(Arch_R,Reg_R)
            Si FDA (Arch_R) hacer
                Reg_R.Region := HV
            FS
        FP 

    ALGORITMO
        Abrir E/S(Arch_Rep,Reg_Rep)
        Abrir E/(Arch_R,Reg_R)
        leerReclamo()
        Mientras (Reg_R <> HV) hacer
            Reg_Rep.Region := Reg_R.Region
            leer(Arch_Rep,Reg_Rep)
            Si EXISTE hacer
                Resg_Reg := Reg_R.Region
                Mientras (Reg_R.Region = Resg_Reg) hacer
                    Reg_Rep.UltFechaRec := Reg_R.FechaRecl
                    Segun Reg_R.Urgencia hacer
                        "A" : Reg_Rep.UrgAlta := Reg_Rep.UrgAlta + 1
                        "M" : Reg_Rep.UrgMedia := Reg_Rep.UrgMedia + 1
                        "B" : Reg_Rep.UrgBaja := Reg_Rep.UrgBaja + 1
                    FSG
                    ReGrabar(Arch_Rep,Reg_Rep)
                    leerReclamo()
                FM
            Sino
                esc("error, no existe dicha region")
                leerReclamo()
            FS
        FM
        cerrar(Arch_R)
        
        Para i = 1 a 20 hacer
            Reg_Rep.Region := i
            leer(Arch_Rep,Reg_Rep)
            Si (Audi[i] < 10) Y (Reg_Rep.UrgAlta > Reg_Rep.UrgBaja * 2) hacer
                esc("Se requiere Auditoria")
                Si (Reg_Rep.NueAud = "N") hacer    
                    Reg_Rep.NueAud := "S"
                FS
                Audi[i] := Audi[i] + 1
            FS
        FP
        Para i = 1 a 20 hacer
            esc("Para la Region "(i)" se solicitaron "(Audi[i])" auditorias.")
        FP
        
        cerrar(Arch_Rep)
        
    FIN ALGORITMO
FIN ACCION


PROCESOS ESTADISTICOS
    AMBIENTE
        RECLAMOS = registro ord. por Region y CodRecl
            CodRecl : N(10)
            FechaRecl : FECHA
            MailCliente : AN(20)
            Urgencia : {"A";"B";"C"}
            Detalle : AN(100)
            Region : N(2)
        FR
        Arch_R : archivo de RECLAMOS ord. por Region y CodRecl
        Reg_R : RECLAMOS
        
        Arr : arreglo de [1...13 ; 1...4]

        ReclamosEnero : entero
        MenosReclamos : entero
        MayorReclamos : entero
        i;j : enteros

        Funcion cero () es
            Para i := 1 a 13 hacer
                Para j := 1 a 4 hacer
                    Arr[i;j] := 0
                FP
            FP
        FF

        Funcion transReg () es
            Segun Reg_R.Urgencia hacer
                "A" := 1
                "M" := 2
                "B" := 3
            FS
        FF

    ALGORITMO
        Abrir E/Arch_R
        leer(Arch_R,Reg_R)
        cero()
        MayorReclamos := LV
        MenosReclamos, ReclamosEnero := 0

        Mientras NFDA (Arch_R) hacer
            i := Reg_R.FechaRecl.MM
            j := transReg(Reg_R.Urgencia)
            Arr[i;j] := Arr[i;j] + 1
            Arr[i;4] := Arr[i;4] + 1
            Arr[13;j] := Arr[13;j] +1
            leer(Arch_R,Reg_R)
        FM
        cerrar(Arch_R)    
    
        Para i := 1 a 12 hacer
            ReclamosEnero := Arr[1;1]
            Si (Arr[i;2] < 10) hacer
                MenosReclamos := MenosReclamos +1
            FS
            Si (Arr[i;4] > MayorReclamos) hacer
                MayorReclamos := i
            FS
        FP 
        esc("El numero de reclamos de urgencia Alta que se registraron en Enero es"(ReclamosEnero)"")
        esc("El mes en el que se produjo la mayor cantidad de reclamos es "(i)"")
        esc("La cantidad de meses que se registrarron menos de 10 reclamos de Urgencia Media es "(MenosReclamos)"")
        
        Para j := 1 a 3 hacer
            esc("La cantidad de reclamos de tipo "(j)" es "(Arr[13:j])"")
        FP
    FIN ALGORITMO
FIN ACCION
    
        

           
                     

