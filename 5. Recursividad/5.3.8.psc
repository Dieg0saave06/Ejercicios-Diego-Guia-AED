"Ejercicio 5.3.8
Escribir una función recursiva que encuentre la altura de un árbol binario."


Funcion alturaArbol(p: puntero a nodo) : entero ES
    Si p = null entonces
        alturaArbol := -1
    Sino
        Altura_izq := alturaArbol(p.izquierda)
        Altura_der := alturaArbol(p.derecha)

        alturaArbol := 1 + Maximo(Altura_izq, Altura_der)
    Fin Si
Fin Funcion