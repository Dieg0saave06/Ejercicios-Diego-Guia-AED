ACCION 2.2.17 ES 
    AMBIENTE 
        Fecha = Registro 
            AA : N(4)
            MM : 1...12 
            DD : 1...31
        FR 
        
        aspirantes = Registro 
            DNI : N(8)
            apeynom : AN(30)
            carrera : AN(20)
            F_nac : fecha
            email : AN(50)
            colegioSec : AN(50)
            fechaInscripcion : fecha 
            aprobado : {"Si", "No"}
        FR 
       
        arch_agosto, arch_febrero : Archivo de aspirantes ordenado por DNI 
        reg_agosto, reg_febrero : aspirantes 
       
        seguimiento = Registro 
            DNI : N(8)
            apeynom AN(30)
            email : AN(50)
            colegioSec : AN(50)
        FR 
       
        salida : Archivo de seguimiento ordenado por DNI 
        reg_salida : seguimiento ordenado por DNI
        cont : entero
       
       
    PROCESO 
        Abrir E/(arch_agosto) ; Abrir E/(arch_febrero)
        Abrir /S(salida)
        Leer(arch_agosto, reg_agosto)
        Leer(arch_febrero, reg_febrero)
        cont := 0
       
        Mientras NDFA(arch_agosto) y NFDA(arch_febrero) hacer 
          
            Si reg_agosto.DNI < reg_febrero.DNI entonces 
                    Leer(arch_agosto, reg_agosto)
            Sino 
                Si reg_agosto.DNI > reg_febrero.DNI entonces       
                    Leer(arch_febrero, reg_febrero)
                Sino 
                    Si reg_agosto.DNI = reg_febrero.DNI entonces
                        Si reg_agosto.aprobado = "No" y reg_febrero.aprobado = "No" entonces
                            reg_salida.DNI := reg_febrero.DNI 
                            reg_salida.apeynom := reg_febrero.apeynom 
                            reg_salida.email := reg_febrero
                            reg_salida.colegioSec := reg_febrero.colegioSec 
                            Grabar(salida, reg_salida)
                            cont := cont + 1
                        Fin Si  
                        Leer(arch_febrero, reg_febrero)
                        Leer(arch_agosto, reg_agosto)
                    Fin Si 
                Fin Si 
            Fin Si 
        Fin Mientras  
        Escribir("La cantidad de aspirantes que se grabaron en el archivo 'SEGUIMIENTO' es de ", cont)
        Cerrar(arch_agosto)
        Cerrar(arch_febrero)
        Cerrar(salida)
Fin ACCION
         
         
         
         