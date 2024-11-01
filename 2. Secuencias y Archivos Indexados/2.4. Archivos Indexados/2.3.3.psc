ACCION 2.3.3() ES 
    AMBIENTE 
        peaje = Registro 
            patente : AN(6)
            Fecha : N(8)
            ult_hora : N(4)
            costo : N(3.2)
        FR 
        
        arch_peaje : archivo de peaje indexado por patente y Fecha 
        reg_peaje : peaje 
        
        Funcion costear(pepe : entero) : Real 
            Segun pepe hacer 
                = 1 : costear() := 1,20
                = 2 : costear() := 2,50
                = 3 : costear() := 4
                = 4 : costear() := 5
            Fin Segun 
        Fin Funcion 
        
        categ: N(1)
        patente_dada : AN(6)
        fecha_dada : N(8)
        arrancar : AN(2)
        
   PROCESO 
       Abrir E/ (arch_peaje)
       Esc("Arrancar el laburo (SI/NO): ")
       Leer(arrancar)
       Mientras arrancar = "SI" hacer
            Esc("Ingrese la patente del auto: ")
            Leer(patente_dada)
            reg_peaje.patente := patente_dada 
            reg_peaje.Fecha := fecha_actual()
            Leer(arch_peaje, reg_peaje)
            Si EXISTE entonces 
                Escribir("Usted ya pasó hoy en dia. ")
                reg_peaje.ult_hora := hora_actual()
                Regrabar(arch_peaje, reg_peaje)  // dulce de tortosa la actividad no pedia regrabar
            Sino                                                                       
                Escribir("Ingrese la categoria: ")
                Leer(categ) 
                reg_peaje.costo := costear(categ)
                reg_peaje.ult_hora := hora_actual()
                Grabar(arch_peaje, reg_peaje)
            Fin Si
            Escribir("¿Quiere continuar? (SI/NO)")
            Leer(arrancar)
        Fin Mientras
        Cerrar(arch_peaje)           
Fin ACCION                
               
       