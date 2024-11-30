"Ejercicio 5.3.7¶
Escribir una función recursiva que encuentre el número de nodos de un árbol binario."

Funcion CantNodos(p: puntero a nodo, num: entero) : entero ES
    Si p = null entonces
        CantNodos := 0
    Sino    
        CantNodos := 1 + CantNodos(*p.izquierda) + CantNodos(*p.derecha)
    Fin Si
Fin Funcion

    