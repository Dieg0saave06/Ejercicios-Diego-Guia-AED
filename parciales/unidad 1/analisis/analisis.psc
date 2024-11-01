ACCION ejercicio1() ES
    AMBIENTE
        sec, sec_sal : Secuencia de caracteres 
        V : caracter 
        
        cant2, total_reca, estudios, pacientes, cajonsito, alberto: entero
        A = 300
        E = 420
        I = 670

        Funcion convertime_esta(baraca : caracter) : entero
            Segun baraca hacer
                = "1" : convertime_esta() := 1
                = "2" : convertime_esta() := 1
                = "3" : convertime_esta() := 1
                = "4" : convertime_esta() := 1
                = "5" : convertime_esta() := 1
                = "6" : convertime_esta() := 1
                = "7" : convertime_esta() := 1
                = "8" : convertime_esta() := 1
                = "9" : convertime_esta() := 1
                = "9" : convertime_esta() := 1
                = otros : convertime_esta() := 0 ; Escribir("ERROR. Se le asignó '0".)
            Fin Segun 
        Fin Funcion


    PROCESO
        ARRANCAR(sec) ; CREAR(sec_sal)
        cant2 := 0 
        total_reca := 0
        estudios := 0
        pacientes := 0
        cajonsito := 0
        alberto := 0

        Mientras V <> "*" hacer
            Mientras V <> "," hacer
                AVZ(sec, V)
            Fin Mientras
            Si V = "," entonces
                AVZ(sec, V)
            Fin Si
            Para D := 1 hasta 2 hacer
                cajonsito := convertime_esta(V) * 10**(2-D)
                alberto := alberto + cajonsito
                AVZ(sec, V)
            Fin Para

            Si alberto > 2 entonces 
                Para D := 1 hasta alberto hacer
                    Si V = "A" entonces
                        Para D := 1 hasta 4 hacer
                            Escribir(sec_sal, V)
                            AVZ(sec, V)
                        Fin Para
                        total_reca := total_reca + A
                    Sino
                        Si V = "E" entonces
                            total_reca := total_reca + E
                            Para D := 1 hasta 4 hacer
                                AVZ(sec, V)
                            Fin Para
                        Sino 
                            Si V = "I" entonces
                                total_reca := total_reca + I
                                Para D := 1 hasta 4 hacer
                                    AVZ(sec, V)
                                Fin Para
                            Fin Si
                        Fin Si
                    Fin Si
                Fin Para
                estudios := estudios + alberto
                pacientes := pacientes + 1
            Sino
                Si alberto = 2 entonces
                    Para D := 1 hasta alberto hacer
                        Si V = "A" entonces
                            total_reca := total_reca + A
                            Para D := 1 hasta 4 hacer
                                AVZ(sec, V)
                            Fin Para
                        Sino
                            Si V = "E" entonces
                                total_reca := total_reca + E
                                Para D := 1 hasta 4 hacer
                                    AVZ(sec, V)
                                Fin Para
                            Sino 
                                Si V = "I" entonces
                                    total_reca := total_reca + I
                                    Para D := 1 hasta 4 hacer
                                        AVZ(sec, V)
                                    Fin Para
                                Fin Si
                            Fin Si
                        Fin Si
                    Fin Para
                    estudios := estudios + alberto
                    pacientes := pacientes + 1
                Sino
                    Si V = "A" entonces
                        total_reca := total_reca + A
                        Para D := 1 hasta 4 hacer
                            AVZ(sec, V)
                        Fin Para
                    Sino
                        Si V = "E" entonces
                            total_reca := total_reca + E
                            Para D := 1 hasta 4 hacer
                                AVZ(sec, V)
                            Fin Para
                        Sino 
                            Si V = "I" entonces
                                total_reca := total_reca + I
                                Para D := 1 hasta 4 hacer
                                    AVZ(sec, V)
                                Fin Para
                            Fin Si
                        Fin Si
                    Fin Si
                    estudios := estudios + alberto
                    pacientes := pacientes + 1
                Fin Si
            Fin Si
            alberto := 0
        Fin Mientras
        Escribir("El total recaudado en el dia es: ", total_reca)
        Escribir("El promedio de estudios por paciente es: ", estudios / pacientes)
        Cerrar(sec)
        Cerrar(sec_sal)
Fin ACCION
