ACCION spotify() ES
    AMBIENTE
        sec_playlist, sec_canciones, sec_sal : Secuencia de caracteres
        Vp, Vc : caracter
        rock, electro, folklore, pop, cont_general, canciones, cont, mayor, D : entero

        Funcion convert_num(car : caracter) : entero
            Segun car hacer
                = "1" : convert_num() := 1
                = "2" : convert_num() := 2
                = "3" : convert_num() := 3
                = "4" : convert_num() := 4
                = "5" : convert_num() := 5
                = "6" : convert_num() := 6
                = "7" : convert_num() := 7
                = "8" : convert_num() := 8
                = "9" : convert_num() := 9
                = "0" : convert_num() := 0
            Fin Segun
        Fin Funcion

    PROCESO
        ARRANCAR(sec_playlist)
        ARRANCAR(sec_canciones)
        AVZ(sec_playlist, Vp)
        AVZ(sec_canciones, Vc)
        rock := 0 ; pop := 0 ; electro := 0 ; folklore := 0 
        cont := 0 ; cont_general := 0 ; canciones := 0 
        mayorR := 0 ; mayorE := 0 ; mayorF := 0 ; mayorP := 0


        Mientras NFDS(sec_playlist) y NFDS(sec_canciones) hacer
            Si Vp = "R" entonces
                rock := rock + 1
                AVZ(sec_playlist, Vp)
                AVZ(sec_playlist, Vp)
                Mientras Vp <> "+" hacer // copio el nombre de la playlist
                    Escribir(sec_sal, Vp)
                    AVZ(sec_playlist, Vp)
                Fin Mientras
                AVZ(sec_playlist, Vp)
                Escribir(sec_sal, "+") // escribo el + para separar los datos
                Para D := 1 hasta 3 hacer  // me salteo todo hasta la cantidad de canciones
                    Mientras Vp <> "+" hacer
                        AVZ(sec_playlist, Vp)
                    Fin Mientras
                    AVZ(sec_playlist, Vp)
                Fin Para
                Para D := 1 hasta 3 hacer
                    cont := cont + convert_num(Vp) * 10**(3 - D)
                    AVZ(sec_playlist, Vp)
                Fin Para
                canciones := canciones + cont // sumo la cantidad de canciones
                Para D := 1 hasta cont hacer                 
                    Mientras Vc <> "#" hacer //escribo el nombre de la cancion
                        Escribir(sec_sal, Vc)
                        AVZ(sec_canciones, Vc)
                    Fin Mientras
                    Escribir(sec_sal, "+") //separo con un +
                    AVZ(sec_playlist, Vc)
                    Para D := 1 hasta 2 hacer
                        Mientras Vc <> "#" hacer
                            AVZ(sec_canciones, Vc)
                        Fin Mientras
                    Fin Para
                    AVZ(sec_canciones, Vc)
                    Mientras Vc <> "/" hacer
                        Escribir(sec_sal, Vc)
                        AVZ(sec_canciones, Vc)
                    Fin Mientras
                Fin Para
                Escribir(sec_sal, "#") //finaliza y pongo la marca #
                Si cont > mayorR entonces //De este genero guardo la mayor cantidad de canciones
                    mayorR := cont
                Fin Si
            Sino     //'Si' anidados para contar cada genero.
                Si Vp = "E" entonces
                    electro := electro + 1
                    Para D := 1 hasta 5 hacer
                    Mientras Vp <> "+" hacer
                            AVZ(sec_playlist, Vp)
                        Fin Mientras
                    Fin Para
                    AVZ(sec_playlist, Vp)
                    Para D := 1 hasta 3 hacer
                        cont := cont + convert_num(Vp) * 10**(3 - D)
                        AVZ(sec_playlist, Vp)
                    Fin Para
                    Para D := 1 hasta cont hacer  
                        Mientras Vc <> "/" hacer
                            AVZ(sec_canciones, Vc)
                        Fin Mientras
                        AVZ(sec_canciones, Vc)
                    Fin Para
                    canciones := canciones + cont 
                    Si cont > mayorE entonces //De este genero guardo la mayor cantidad de canciones
                        mayorE := cont
                    Fin Si
                Sino
                    Si Vp = "F" entonces
                        folklore := folklore + 1
                        Para D := 1 hasta 5 hacer
                            Mientras Vp <> "+" hacer
                                AVZ(sec_playlist, Vp)
                            Fin Mientras
                        Fin Para
                        AVZ(sec_playlist, Vp)
                        Para D := 1 hasta 3 hacer
                            cont := cont + convert_num(Vp) * 10**(3 - D)
                            AVZ(sec_playlist, Vp)
                        Fin Para
                        Para D := 1 hasta cont hacer   
                            Mientras Vc <> "/" hacer
                                AVZ(sec_canciones, Vc)
                            Fin Mientras
                            AVZ(sec_canciones, Vc)
                        Fin Para
                        canciones := canciones + cont 
                        Si cont > mayorF entonces //De este genero guardo la mayor cantidad de canciones
                            mayorF := cont
                        Fin Si
                    Sino 
                        pop := pop + 1
                        Para D := 1 hasta 5 hacer
                            Mientras Vp <> "+" hacer
                                AVZ(sec_playlist, Vp)
                            Fin Mientras
                        Fin Para
                        AVZ(sec_playlist, Vp)
                        Para D := 1 hasta 3 hacer
                            cont := cont + convert_num(Vp) * 10**(3 - D)
                            AVZ(sec_playlist, Vp)
                        Fin Para
                        Para D := 1 hasta cont hacer   
                            Mientras Vc <> "/" hacer
                                AVZ(sec_canciones, Vc)
                            Fin Mientras
                            AVZ(sec_canciones, Vc)
                        Fin Para
                        canciones := canciones + cont 
                        Si cont > mayorP entonces //De este genero guardo la mayor cantidad de canciones
                            mayorP := cont
                        Fin Si
                    Fin Si
                Fin Si
            Fin Si
            cont_general := cont_general + 1
            cont := 0   // Reseteo el contador de canciones
        Fin Mientras
        Si (contR > contE) y (contR > contP) y (contR > contF) entonces //'SI' anidados para evaluar cual genero tiene mas canciones.
            Escribir("La playlist con mas canciones es la de genero 'ROCK'.")
        Sino
            Si (contE > contR) y (contE > contP) y (contE > contF) entonces
                Escribir("La playlist con mas canciones es la de genero 'ELECTRONICA'.")
            Sino 
                Si (contP > contR) y (contP > contE) y (contP > contF) entonces
                    Escribir("La playlist con mas canciones es la de genero 'POP'.")
                Sino
                    Escribir("La playlist con mas canciones es la de genero 'FOLKLORE'.")
                Fin Si
            Fin Si
        Fin Si
        Escribir("El porcentaje de playlists de rock sobre el total es ", rock / cont_general * 100)
        Escribir("El porcentaje de playlists de pop sobre el total es ", pop / cont_general * 100)
        Escribir("El porcentaje de playlists de electro sobre el total es ", electro / cont_general * 100)
        Escribir("El porcentaje de playlists de folklore sobre el total es ", rock / cont_general * 100)
        Escribir("La cantidad promedio de canciones de las playlists ", canciones / cont_general)
        Cerrar(sec_canciones)
        Cerrar(sec_playlist)
        Cerrar(sec_sal)
Fin ACCION