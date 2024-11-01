ACCION ejercicio2() ES
    AMBIENTE
        Fecha = Registro    
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        usuarios = Registro 
            id_usuario : N(4)
            DNI : N(8)
            sexo : {"M", "F"}
            ApeYnom : AN(50)
            domicilio : AN(100)
            localidad : AN(50)
            provincia : AN(30)
            edad : N(2)
        FR

        arch_u : Archivo indexado por id_usuario
        reg_u : usuarios

        novedades = Registro
            nro_serie : N(4)
            modelo :
            tipo_novedad : {1, 2, 3, 4}
            fecha_novedad : Fecha
            hora_inicio :
            hora_fin :
            circuito_nro :
            id_usuario :
        FR

        arch_n : Archivo de novedades ordenado por nro_serie y modelo
        reg_n : novedades
        i, j : entero

        arr : Arreglo [1...4, 1...2] de enteros
        
        Funcion edad(num : entero) : caracter
            Segun num hacer
                = 1 : Escribir("Menores a 18")
                = 2 : Escribir("Entre 18 y 35 años")
                = 3 : Escribir("Entre 35 y 75 años")
                = 4 : Escribir("Mayores 75 años")
            Fin Segun
        Fin Funcion         

    PROCESO
        Abrir E/(arch_u)
        Abrir E/(arch_n) ; Leer(arch_n, reg_n)

        Para i := 1 hasta 4 hacer
            Para j := 1 hasta 2 hacer
                arr[i ; j] := 0
            Fin Para
        Fin Para

        Mientras NDFA(arch_n) hacer
            reg_u.id_usuario := reg_n.id_usuario
            Leer(arch_u, reg_u)
            Si EXISTE entonces
                Segun reg_u.edad hacer
                    < 18 : i := 1
                    < 35 : i := 2
                    < 75 : i := 3
                    >= 75 : i := 4
                Fin Segun   
                Segun diff_horas(reg_n.hora_inicio, reg_n.hora_fin) hacer   
                    > 6 : j := 1
                    <= 6 : j := 2
                Fin Segun
                arr[i ; j] := arr[i ; j] + 1
            Sino
                Escribir("Error, no existe el usuario.")
            Fin Si

            Leer(arch_n, reg_n)
        Fin Mientras

        a := 1

        Para i := 1 hasta 4 hacer
            Para j := 1 hasta 2 hacer
                Si j = 1 entonces
                    Escribir("El grupo etario ", edad(i), " tuvo ", arr[i ; j], " de paseos intensivos.")
                Sino
                    Escribir("El grupo etario ", edad(i), " tuvo ", arr[i ; j], " de paseos recreativos.")
                    Si arr[a ; 1] < arr[i ; 1] entonces
                        a := i
                    Fin Si
                Fin Si
            Fin Para
        Fin Para

        Escribir("El rango etario que realizó mas paseos recreativos fue el de ", edad(a))
        Escribir("Los mayores a 75 años realizaron ", arr[4 ; 1], " prestamos de tipo intensivo.")
        Cerrar(arch_n)
        Cerrar(arch_u)

Fin ACCION


