Funcion suma(Arr : Arreglo [1...10] de enteros, i : entero) : entero ES 
    Si i = 1 entonces 
        suma := Arr[i]
    Sino 
        suma := Arr[i] + suma[a, i - 1]
    Fin Si 
Fin Funcion