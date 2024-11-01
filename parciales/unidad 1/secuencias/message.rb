ACCION parcial() ES

AMBIENTE

    sec_sal , sec_fila , sec_cum : SECUENCIA de caracteres
    c : contador
    v , v1 ,v2 : caracter


    Funcion convertime_esta (carc : caracter) : entero ES

        SEGUN carc HACER

            "1" : convertime_esta := 1
            "2" : convertime_esta := 2
            "3" : convertime_esta := 3
            "4" : convertime_esta := 4
            "5" : convertime_esta := 5
            "6" : convertime_esta := 6
            "7" : convertime_esta := 7
            "8" : convertime_esta := 8
            "9" : convertime_esta := 9
            "0" : convertime_esta := 0
            otros : esc("error no se ingreso un numero") ; convertime_esta := 9

        FIN_SEGUN

    FIN_FUNCION



PROCESO

ARR (sec_fila)
ARR (sec_cum)
CREAR (sec_sal)
avz (sec_fila, v) ; avz (sec_cum, v2)


MIENTRAS nfds (sec_fila) y nfds (sec_cum) HACER

    PARA x:= 1 a 4 HACER

        avz (sec_fila , v)

    FIN_PARA

    PARA x:= 1 a 6 HACER

        avz (sec_fila , v)
        avz (sec_cum , v2)


    FIN_PARA

    SI v = "t" ENTONCES
        avz (sec_fila, v)
        SI convertime_esta(v) <= 5 ENTONCES
            aux := convertime_esta(v)
            PARA x:= 1 a 6 HACER

                avz (sec_cum , v2)

            FIN_PARA

            SI v2 <> "#" ENTONCES

                MIENTRAS v <> "+" HACER

                    avz(sec_cum , v2)
            
                FIN_MIENTRAS
                avz(sec_cum , v2)
                cont_personas := 0
                MIENTRAS v2 <> "?" HACER

                    MIENTRAS v2 <> "." y v2 <> "?" HACER
                        ESC (sec_sal , v2)
                        AVZ (sec_cum , v2)
                    FIN_MIENTRAS

                    cont_personas := cont_personas + 1

                    SI v = "." ENTONCES
                        AVZ (sec_cum , v2)
                    FIN_SI 

                FIN_MIENTRAS

                SI aux <> cont_personas ENTONCES

                    irresponsables := irresponsables + 1

                FIN_SI

                avz (sec_cum , v2)
            SINO
                irresponsables := irresponsables + 1
                AVZ (sec_cum , v2)
                AVZ (sec_cum , v2)

            FIN_SI

        SINO 
            esc ("ERROR ingreso un carcter no deseado")
        FS
    SINO
        avz(sec_fila)
        SI convertime_esta(v) <= 5 ENTONCES
            aux := convertime_esta(v)
            PARA x:= 1 a 6 HACER

                avz (sec_cum , v2)

            FIN_PARA

            SI v2 <> "#" ENTONCES

                MIENTRAS v <> "+" HACER

                    avz(sec_cum , v2)
        
                FIN_MIENTRAS

                avz(sec_cum , v2)

                MIENTRAS v2 <> "?" HACER

                    MIENTRAS v2 <> "." y v2 <> "?" HACER
                        AVZ (sec_cum , v2)
                    FIN_MIENTRAS

                    cont_personas := cont_personas + 1

                    SI v = "." ENTONCES
                        AVZ (sec_cum , v2)
                    FIN_SI 

                FIN_MIENTRAS

                SI aux <> cont_personas ENTONCES

                    irresponsables := irresponsables + 1

                FIN_SI

                avz (sec_cum , v2)

            SINO

                irresponsables := irresponsables + 1
                avz(sec_cum , v2)
                avz(sec_cum , v2)

            FIN_SI
        SINO
            esc ("ERROR ingreso un carcter no deseado")
        FS
    FS

    avz (sec_fila , v)
    avz (sec_fila , v)
    MIENTRAS v <> "#" y nfds(sec_fila) HACER

        avz (sec_fila , v)

    FIN_MIENTRAS

    SI v = "#" ENTONCES
        avz (sec_fila , v)
    FIN_SI

    SI v2 = "?" ENTONCES
        AVZ(sec_cum , v2)
    FS

FIN_MIENTRAS

CERRAR (sec_cum)
CERRAR (sec_fila)  
CERRAR (sec_sal)

FIN_ACCION
