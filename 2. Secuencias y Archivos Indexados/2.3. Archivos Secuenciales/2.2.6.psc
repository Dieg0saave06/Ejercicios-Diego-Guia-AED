ACCION 2.2.6() ES
    AMBIENTE
        graduados = Registro
            Apellido_Nombre : AN(30)
            promedio : N(2)
        Fin Registro
        
        arch_gradu : Archivo de graduados
        reg_gradu : graduados
        contNO, contSI, contF, contMF : entero

    PROCESO
        Escribir("Apellido y Nombre | Promedio | Recomendación")
        Abrir E/(arch_gradu)
        Leer(arch_gradu, reg_gradu)
        contNO := 0
        contSI := 0
        contF := 0
        contMF := 0

        Mientras NFDA(arch_gradu) hacer
            //FORMA 1
            Segun reg_gradu.promedio hacer
                <7 : Escribir(reg_gradu.Apellido_Nombre, " | ", reg_gradu.promedio, " | ", "NO")
                <8 : Escribir(reg_gradu.Apellido_Nombre, " | ", reg_gradu.promedio, " | ", "SI")
                <9 : Escribir(reg_gradu.Apellido_Nombre, " | ", reg_gradu.promedio, " | ", "F")
                >=9 : Escribir(reg_gradu.Apellido_Nombre, " | ", reg_gradu.promedio, " | ", "MF")
                otros : Escribir("Se esperaba un valor numérico.")
            Fin Segun


            //FORMA 2
            Si reg_gradu.promedio < 7 entonces
                Escribir(reg_gradu.Apellido_Nombre, " | ", reg_gradu.promedio, " | ", "NO")
                contNO := contNO + 1
            Sino
                Si reg_gradu.promedio < 8 entonces
                    Escribir(reg_gradu.Apellido_Nombre, " | ", reg_gradu.promedio, " | ", "SI")
                    contSI := contSI + 1
                Sino
                    Si reg_gradu.promedio < 9 entonces
                        Escribir(reg_gradu.Apellido_Nombre, " | ", reg_gradu.promedio, " | ", "F")
                        contF := contF + 1
                    Sino    
                        Si reg_gradu.promedio > 9 entonces
                            Escribir(reg_gradu.Apellido_Nombre, " | ", reg_gradu.promedio, " | ", "MF")
                            contMF := contMF + 1
                        Sino
                            Escribir("Se esperaba un valor numérico.")
                        Fin Si
                    Fin Si
                Fin Si
            Fin Si
            Leer(arch_gradu, reg_gradu)
        Fin Mientras
        Escribir("La cantidad de graduados con recomendacion 'NO' es ", contNO, " y el promedio es ", contNO / (contF + contMF, contNO, contSI))
        Escribir("La cantidad de graduados con recomendacion 'SI' es ", contSI, " y el promedio es ", contSI / (contF + contMF, contNO, contSI))
        Escribir("La cantidad de graduados con recomendacion 'F' es ", contF, " y el promedio es ", contF / (contF + contMF, contNO, contSI))
        Escribir("La cantidad de graduados con recomendacion 'MF' es ", contMF, " y el promedio es ", contMF / (contF + contMF, contNO, contSI))
        Cerrar(arch_gradu)
Fin ACCION