"Ejercicio 2.1.8¶
Teniendo en cuenta el ejercicio anterior, se solicita que la 
secuencia de salida sea una secuencia de caracteres y los CUIT se separen unos de otros con el caracter "-"."

    


ACCION 2.1.8() ES
	AMBIENTE
		Sec_ent : Secuencia de enteros
        Sec_sal : Secuencia de caracteres
        cajonsito_de_letras : caracter
		V, D, cajon_2: entero
		gods : {0, 1, 2, 3}

        Funcion convert(num: entero): caracter
            Segun num hacer
                num = 1 : convert := "1"
                num = 2 : convert := "2"
                num = 3 : convert := "3"
                num = 4 : convert := "4"
                num = 5 : convert := "5"
                num = 6 : convert := "6"
                num = 7 : convert := "7"
                num = 8 : convert := "8"
                num = 9 : convert := "9"
                num = 0 : convert := "0"
                otros : convert = "0" ; Escribir("EL NUMERO NO VA, SE LE ASIGNÓ CERO")  //si o si hay que asignarle un valor sino explota the world
            Fin Segun
        Fin Funcion
      
		PROCESO
		ARRANCAR(Sen_ent) ; CREAR(Sec_sal)
		AVZ(Sen_ent, V)
		Mientras V <> 0 hacer
			Si (((V mod 100) - (V mod 10)) / 10) en gods entonces
                cajon_2 := V
                Para D := 1 hasta 11 hacer
                    cajonsito_de_letras := convert(cajon_2 div 10**(11-D))
                    cajon_2 := cajon_2 mod 10**(11-D)
                    Escribir(Sec_sal, cajonsito_de_letras)
                Fin Para

                Escribir(Sec_sal, "-")
            Fin Si
			AVZ(Sec_sal, V)
		Fin Mientras
		Cerrar(Sec_ent)
		Cerrar(Sec_sal)
    Fin ACCION