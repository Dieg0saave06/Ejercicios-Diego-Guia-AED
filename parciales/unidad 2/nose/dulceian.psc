ACCION 
    AMBIENTE
        Fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        juan = Registro
            nom : AN(50)
            fechaJ : fecha
            monto : N(6)
            sexo : {"M", "F"}
            edad : N(2)
        FR

        arch_juan : Archivo de juan ordenado por nombre
        reg_juan : juan

        arr : arreglo [1...3, M F] de enteros

        arr : arreglo [1...3, 1..2] de enteros

        // Generar un informe por sexo por edad (MENORES 18, MAYORES 18 y MENORES DE 60, Y MAYORES DE 60)
        // Informar que sexo tuvo mayores montos
        // Informar el total por sexo, edad.
        fechita : fecha

    PROCESO
        Abrir E/(juan)
        Leer(arch_juan, reg_juan)
        Escribir("Ingrese Fecha (AAAA/MM/DD): ")
        Leer(fechita.AA)
        Leer(fechita.MM)
        Leer(fechita.DD)

        Mientras NFDA(juan) hacer
            Si reg_juan.fechaJ > fechita entonces
                Segun reg_juan.edad hacer
                    < 18 : arr[1;reg_juan.sexo] := arr[1;reg_juan.sexo] + reg_juan.monto
                    < 60 : arr[2;reg_juan.sexo] := arr[2;reg_juan.sexo] + reg_juan.monto
                    > 60 : arr[3;reg_juan.sexo] := arr[3;reg_juan.sexo] + reg_juan.monto
                Fin Segun             
            Fin Si
            Leer(arch_juan, reg_juan)
        Fin Mientras

        Escribir("El total de sexo 'F' MENORES 18 con monto tanto es: ", arr[1; F])
        Escribir("El total de sexo 'M' MENORES 18 con monto tanto es: ", arr[1; M])
        Escribir("El total de sexo 'F' mayores de 18 y menores de 60 con monto tanto es: ", arr[2; F])
        Escribir("El total de sexo 'M' mayores de 18 y menores de 60 con monto tanto es:: ", arr[2; M])
        Escribir("El total de sexo 'F' mayores de 60 con monto tanto es: ", arr[3; F])
        Escribir("El total de sexo 'M' mayores de 60 con monto tanto es: ", arr[3; M])



        Si (arr[1; F] + arr[2; F] + arr[3; F]) > (arr[1; M] + arr[2; M] + arr[3; M]) entonces
            Escribir("El sexo 'F' tuvo mayores montos")
        Sino
            Escribir("El sexo 'M' tuvo mayores montos")
        Fin Si

        Escribir("El monto total de sexo 'F' es: ", (arr[1; F] + arr[2; F] + arr[3; F]))
        Escribir("El monto total de sexo 'M' es: ", (arr[1; M] + arr[2; M] + arr[3; M]))
        Escribir("El monto total de MENORES 18 es: ", (arr[1; M] + arr[1; F]))
        Escribir("El monto total de MAYORES 18 y MENORES 60 es: ", (arr[2; M] + arr[2; F]))
        Escribir("El monto total de MAYORES 60 es: ", (arr[3; M] + arr[3; F]))

        Cerrar(arch_juan)
Fin ACCION