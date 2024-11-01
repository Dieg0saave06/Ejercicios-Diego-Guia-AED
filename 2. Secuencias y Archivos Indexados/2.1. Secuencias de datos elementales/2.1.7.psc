"Se tiene una secuencia de enteros que contiene todos los CUIT de los empleados de una empresa, la misma termina con el CUIT 0. 
Para evitar largas esperas en los días de pago, 
la empresa necesita organizarlos de acuerdo al último dígito de su documento, generar una secuencia con 
los CUIT de las personas que su número de documento termine con 0, 1, 2 o 3."

20472273664
// OPCION 1


ACCION 2.1.7() ES
	AMBIENTE
		Sec_ent, Sec_sal : Secuencia de enteros
		V, resg, D: entero
		gods : {0, 1, 2, 3}

		PROCESO
		ARRANCAR(Sen_ent) ; CREAR(Sec_sal)
		AVZ(Sen_ent, V)
		Mientras NFDS(Sen_ent) hacer
			Para D := 1 hasta 10 hacer
				resg := resg + (10**(11-D)) * V
				AVZ(Sec_ent, V)
			Fin Para
			Si V en gods entonces
				AVZ(Sec_ent, V)	
				resg := resg + V
				Para D := 1 hasta 11 hacer
					Escribir(Sec_sal, (resg div 10**(11-D)))
					resg := resg mod (10**(11-D))
				Fin Para
				AVZ(Sec_ent, V)
			Sino	
				AVZ(Sec_ent, V)
				AVZ(Sec_ent, V)
			Fin Si
		Fin Mientras
		Cerrar(Sec_ent)
		Cerrar(Sec_sal)
Fin ACCION	
			
// OPCION 2 

"Se tiene una secuencia de enteros que contiene todos los CUIT de los empleados de una empresa, la misma termina con el CUIT 0. 
Para evitar largas esperas en los días de pago, 
la empresa necesita organizarlos de acuerdo al último dígito de su documento, generar una secuencia con 
los CUIT de las personas que su número de documento termine con 0, 1, 2 o 3."

20472273664

ACCION 2.1.7() ES
	AMBIENTE
		Sec_ent, Sec_sal : Secuencia de enteros
		V, D: entero
		gods : {0, 1, 2, 3}

		PROCESO
		ARRANCAR(Sen_ent) ; CREAR(Sec_sal)
		AVZ(Sen_ent, V)
		Mientras V <> 0 hacer
			Si (((V mod 100) - (V mod 10)) / 10) en gods entonces
				Escribir(Sec_sal, V)
			Fin Si
			AVZ(Sec_sal, V)
		Fin Mientras
		Cerrar(Sec_ent)
		Cerrar(Sec_sal)
Fin ACCION	


				// ejemplo para los downs que no entienden
						20472273664

						(64 - 4 ) / 10
						60 / 10
						6 "NO CUMPLE"


				