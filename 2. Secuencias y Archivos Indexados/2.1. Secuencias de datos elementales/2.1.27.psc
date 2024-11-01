// "Ejercicio 2.1.27¶
// Elaborar un procedimiento que dada una secuencia de caracteres como entrada genere otra del mismo tipo como salida.
// La secuencia de caracteres que se recibe incluye números de tarjetas de crédito, donde cada número tiene 16 dígitos. Se desea obtener como resultado una nueva secuencia de salida con los números de tarjetas válidos.
// El algoritmo para la validación de números de tarjetas de crédito es el siguiente: Para entender mejor el método usaremos un número correcto: 4013-7001-0977-4812, al que nos referiremos en el texto. Nos centramos en los 
// caracteres que ocupan posiciones impares.

// 4013700109774812  

// Por cada uno de ellos obtenemos el doble del valor que representan. Si el número resultante es menor que 9, se deja tal cual, en caso contrario, se le resta 9. En nuestro ejemplo: 4 * 2 = 8; 1 * 2 = 2; 7 * 2 = 14, mayor que nueve, 
// se le resta 9. 14 - 9 = 5; y así sucesivamente. Si el número resultante de la suma de las multiplicaciones y de los dígitos en posición par, es múltiplo de 10, y a la vez menor o igual a 150, es un número de tarjeta válido.

// Para nuestro ejemplo: 8+0+2+3+5+0+0+1+0+9+5+7+8+8+2+2 = 60; por lo tanto el número es válido."

ACCION 2.1.27() ES
    AMBIENTE
        sec, sec_sal : Secuencia de caracteres
        V : caracter
        x, acum, D: entero
        
        Funcion convert_num(car : caracter) : entero
            Segun car hacer
                "1" : convert_num() := 1
                "2" : convert_num() := 2
                "3" : convert_num() := 3
                "4" : convert_num() := 4
                "5" : convert_num() := 5
                "6" : convert_num() := 6
                "7" : convert_num() := 7
                "8" : convert_num() := 8
                "9" : convert_num() := 9
                "0" : convert_num() := 0
                otros : Escribir("Error. Se ingresó un dato erroneo.") ; convert_num() := 0
            Fin Segun
        Fin Funcion

        Funcion convert_car(num : entero) : caracter
            Segun num hacer
                1 : convert_car() := "1"
                2 : convert_car() := "2"
                3 : convert_car() := "3"
                4 : convert_car() := "4" 
                5 : convert_car() := "5"
                6 : convert_car() := "6"
                7 : convert_car() := "7"
                8 : convert_car() := "8"
                9 : convert_car() := "9"
                0 : convert_car() := "0"
                otros : Escribir("Error. Se ingresó un dato erroneo.") ; convert_car() := "0"
            Fin Segun
        Fin Funcion


    PROCESO
        ARRANCAR(sec) ; AVZ(sec, V)
        
        x := 0
        acum := 0
        par := 0
        impar := 0

        Mientras NDFS(sec) hacer
            Para D := 1 hasta 16 hacer
                x := convert_num(V) * (10**(16-D))
                acum := acum + x
                AVZ(sec, V)
            Fin Para

            x := acum

            Para D := 1 hasta 8  hacer
                par := x mod 10
                x := x div 10
                impar := (x mod 10) * 2
                x := x div 10
                suma := suma + par + impar
            Fin Para

            x := acum

            Si ((suma mod 10) = 0) y (suma <= 150) entonces
                Para D := 1 hasta 16 hacer
                    x := acum div (10**(16-3))
                    Escribir(sec_sal, convert_car(x))
                    acum := acum mod (10**(16-D)) 
                Fin Para
            Fin Si
            acum := 0
        Fin Mientras
        Cerrar(sec) 
        Cerrar(sec_sal)
Fin ACCION