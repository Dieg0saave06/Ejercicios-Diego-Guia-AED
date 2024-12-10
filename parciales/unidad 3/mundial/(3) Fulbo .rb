Ejercicio 1)

Accion "Mundialuki" es (Prims: puntero a Simple)
    Ambiente


    Funcion Edad(Arreglo[i] de enteros):entero es
        Si (I = 1) entonces
            Edad:= Arr[i] div 26
        sino
            Edad: Edad[i] + Edad(Arr[i - 1])
        FS
    FF


    NomMay,NomMen,dato: Alfanumerico
    EquipoMen,EquipoMay,Grupo: entero
    Proceso
    EquipoMen:= 0 
    EquipoMay:= 0
    Ps:= Prims
    Para I:= 1 a 32 hacer #LLENO LA LISTA
        Esc("Ingrese el Nombre del pais Sorteado")
        Leer(dato)
        Mientras (*Ps.Pais <> dato) entonces
            Ps:= *Ps.prox
        FM
        Esc("Ingrese el Grupo que le toco")
        Leer(grupo)
        *Ps.Grupo:= Grupo
    FP
    Os:= Prims
    Mientras (NO Bandera) hacer
        Ps:= Prims 
        Mientras (*Os.grupo > *Ps.Grupo) hacer #ORDENO LISTA
            Ts:= Ps
            Ps:= *Ps.prox
        FM
        Si (Ps = Prim) entonces
            *(*Os.ant).prox:= *Os.prox
            *(*Os.prox).ant:= *Os.ant
            Os:= Prim
            *Os.ant:= null
            *Os.prox:= Ps
            *Ps.ant:= Os
        sino
            Si (Ps <> null) entonces
                *(*Os.ant).prox:= *Os.prox
                *(*Os.prox).ant:= *Os.ant
                *Ts.prox:= Os
                *Os.ant:= Ts
                *Os.prox:= Ps
                *Ps.ant:= Os
            sino
                *(*Os.ant).prox:= *Os.prox
                *(*Os.prox).ant:= *Os.ant
                *Ts.prox:= Os
                *Os.ant:= Ts
                *Os.prox:= null
            FS
        FS
        Ts:= Prims
        Ps:= *Prims.prox
        Mientras (*Ts.Grupo <= *Ps.Grupo) y (Ps <> null) hacer  #CONTROLO SI ESTA ORDENADO
                Ts:= Ps
                Ps:= *Ps.prox
        FM
        Si (*Ts.Grupo > *Ps.Grupo) y (Ps <> null) entonces
            Bandera:= Falso
        sino
            Bandera:= Verdadero
        FS
        Os:=*Os.prox
    FM
    Ps:= Prims
    Mientras (Ps <> null) hacer
        Si (Edad(*Ps.Edad) > EquipoMay) entonces
            EquipoMay:= Edad(*Ps.Edad)
            NomMay:= *Ps.Equipo
        sino
            Si (Edad(*Ps.Edad) < EquipoMen) entonces
                EquipoMen:= Edad(*Ps.Edad)
                NomMen:= *Ps.Equipo
            FS
        FS
        Ps:= *Ps.prox
    FM
    Esc("El equipo con mayor promedio de equipos fue",NomMay,"con promedio de",EquipoMay)
    Esc("El equipo con menor promedio de equipos fue",NomMen,"con promedio de",EquipoMen)
FA


Ejercicio 2)

Accion "Partidos" es(Prims: puntero a Simple)

Partidos = registro
    ID_Partido: N(8)
    Equipo_Local: AN(40)
    Equipo_Visitante: AN(40)
FR
Arch: archivo de Partidos
Reg: Partidos

Resultados = registro
    ID_Partido: N(8)
    Cantidad_Goal_Local: N(2)
    Cantidad_Goal_Visita: N(2)
    Tarj_Roja_Local: N(2)
    Tarj_Amarilla_Local: N(2)
    Tarj_Amarilla_Visitante: N(2)
    Tarj_Roja_Visitante: N(2)
FR
Arch_Index: archivo de Resultados indexado por ID_Partido
Index: Resultados

Nodo = registro
    Equipo: AN(20)
    Puntos: N(3)
    Dif_Goal: N(3)
    Cant_Rojas: N(3)
    Cant_Amarillas: N(3)
    prox: puntero a Nodo
    ant: puntero a Nodo
FR
P,Prim: puntero a Nodo

Procedimiento AnotarLocal() es
    Mientras (P <> Reg.Equipo_Local) y (P <> null) hacer
        P:= *P.prox
    FM
    Si (P = Reg.Equipo_Local) entonces
        Puntos()
        *P.Dif_Goal:= Index.Cantidad_Goal_Local - Index.Cantidad_Goal_Visita
        *P.Tarj_Roja:= *P.Tarj_Roja + Index.Tarj_Roja_Local
        *P.Tarj_Amarilla:= *P.Tarj_Amarilla + Index.Tarj_Amarilla_Local
    sino
    Nuevo(P)
    *P.Equipo:= Reg.Equipo_Local
    Puntos()
    *P.Dif_Goal:= Index.Cantidad_Goal_Local - Index.Cantidad_Goal_Visita
    *P.Tarj_Roja:= *P.Tarj_Roja + Index.Tarj_Roja_Local
    *P.Tarj_Amarilla:= *P.Tarj_Amarilla + Index.Tarj_Amarilla_Local
    Si (Prim = null) entonces
        Prim := P
        *P.ant:= null
        *P.prox:= null
        O:= P
    sino
        *O.prox:= P
        *P.ant:= O
        *P.prox:= null
        O:= P
    FS
FP

Procedimiento Puntos() es
    Segun Diferencia hacer
        < 0 := *P.puntos + 3
        > 0 := *P.puntos + 3
        = 0 := *P.puntos + 1
    FS
FP   

Procedimiento AnotarVisitante() es
    Mientras (P <> Reg.Equipo_Visitante) y (P <> null) hacer
        P:= *P.prox
    FM
    Si (P = Reg.Equipo_Visitante) entonces
        Puntos()
        *P.Dif_Goal:= Index.Cantidad_Goal_Visita - Index.Cantidad_Goal_Local
        *P.Tarj_Roja:= *P.Tarj_Roja + Index.Tarj_Roja_Visitante
        *P.Tarj_Amarilla:= *P.Tarj_Amarilla + Index.Tarj_Amarilla_Visitante
    sino
        Nuevo(P)
        *P.Equipo:= Reg.Equipo_Visitante
        Puntos()
        *P.Dif_Goal:= Index.Cantidad_Goal_Visita - Index.Cantidad_Goal_Local
        *P.Tarj_Roja:= *P.Tarj_Roja + Index.Tarj_Roja_Visitante
        *P.Tarj_Amarilla:= *P.Tarj_Amarilla + Index.Tarj_Amarilla_Visitante
        Si (Prim = null) entonces
            Prim := P
            *P.ant:= null
            *P.prox:= null
             O:= P
        sino
            *O.prox:= P
            *P.ant:= O
            *P.prox:= null
            O:= P
        FS
    FS
FP

Bandera: logico

Proceso
Prim:= null
Bandera:= Falso
Abrir E/(Arch)
Leer(Arch,Reg)
Abrir E/(Index)
Mientras NFDA(Arch) hacer
    Index.ID_Partido:= Reg.ID_Partido
    Leer(Arch_Index,Index)
    Si (EXISTE) entonces
        Diferencia:= Index.Cantidad_Goal_Local - Index.Cantidad_Goal_Visita
        Prim:= P
        Si (Diferencia < 0) entonces
            AnotarVisitante()
        sino
            Si (Diferencia > 0) entonces
                AnotarLocal()
            sino
                AnotarVisitante()
                AnotarLocal()
            FS
        FS
    sino
        Esc("No se juego el partido down")
    FS
FM
O:= Prim
Mientras (O <> null) hacer  #BORRO LOS QUE NO PASAN
    P:= O
    Si (*O.puntos < 4) entonces
        Si (*O.puntos = 4) y (*O.Dif_Goal < 2) entonces
            Si (*O.puntos = 3) y (9 NOse que mierda) entonces
                Si (O = prim) y (O <> null) entonces
                    *(*O.prox).ant:= null
                    Prim := *O.prox
                    P:= *O.prox
                    Disponer(O)
                sino
                    Si (O <> null) entonces
                        *(*O.ant).prox:= *O.prox
                        *(*O.prox).ant:= *O.ant
                        P:= *P.prox
                        Disponer(O)
                    FS
                FS
            FS
        FS
    FS
    O:= *P.prox
FM
Mientras ( NO Bandera) hacer
    T:= Prim
    O:= Prim
    Mientras (*O.Puntos < *T.Puntos) y (T <> null) hacer #ORDENANZA DE MAYOR A MENOR
        T:= *T.prox
    FM
    Si (T <> null) entonces
        *(*O.prox).ant:= *O.ant
        *(*O.ant).prox:= *O.prox
        *(*T.prox).ant:= O
        *O.prox:= *T.prox
        *T.prox:= O
        *O.ant:= T
    sino
        *(*O.prox).ant:= *O.ant
        *(*O.ant).prox:= *O.prox
        *(*T.ant).prox:= O
        *O.ant:= *T.ant
        *O.prox:= null
    FS
    T:= *Prim.prox
    O:= Prim
    Mientras (*O.Puntos < *T.Puntos) y (T <> null) hacer #ORDENANZA DE MAYOR A MENOR
        T:= *T.prox
    FM
    Si (*O.Puntos < *T.Puntos) entonces
        Bandera:= Verdadero
    sino
        Bandera:= Falso
    FS
FM
O:= Prim
Mientras (O <> null) entonces
    Si (*O.Tarj_Roja > cantroja) entonces
        cantroja:= *O.Tarj_Roja
        equiporoja:= *O.Equipo
    FS
    Esc(*O.equipo)
    O:=*O.prox
FM
Esc("El equipo con mayor cantidad de tarjetas rojas fue",equiporoja,"con",cantroja,"tarjetas")
Cerrar(Arch_Index)
Cerrar(Arch)
FA