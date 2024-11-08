ACCION ejercicio1(prim : Puntero a NodoC) ES
    AMBIENTE
        Fecha = Registro
            AA : N(4)
            MM : 1...12
            DD : 1...31
        FR

        compras = Registro
            Fecha_compra : Fecha
            Dni_cli : N(8)
            cant_art : N(3)
            imp_total : N(5)
        FR
        
        Arch_c : Archivo de compras ordenado por Fecha_compra
        Reg_c : compras

        socios = Registro
            Dni_cli : N(8)
            ApeyNom : AN(40)
            Fecha_adhe : Fecha
            Categoria : AN(30)
        FR

        Arch_s : Archivo de socios indexado por Dni_cli
        Reg_s : socios

        Nodo = Registro
            ApeyNom : AN(30)
            chances_tot : N(3)
            ant : puntero a Nodo
            prox : puntero a Nodo
        FR

        p, q, prim1, ult, atras : puntero a Nodo
        num, D := entero
        aux := puntero a NodoC

        procedimiento channnces() ES
            Si Reg_s.Categoria = "BLACK" entonces
                num := Tirar()
                Para D := 1 hasta num hacer
                    prim := *prim.prox
                Fin Para
                *p.chances_tot := *p.chances_tot + *prim.dato
            Fin Si
        Fin procedimiento

    PROCESO
        prim1 := null

        Abrir E/(Arch_c) ; Leer(Arch_c, Reg_c)
        Abrir E/(Arch_s)

        Mientras NFDA(Arch_c) hacer
            Reg_s.Dni_cli := Reg_c.Dni_cli
            Leer(Arch_s, Reg_s)
            Si EXISTE entonces                    
                Si prim1 = Null entonces
                    Nuevo(p)
                    *p.ant := null
                    *p.prox := null
                    *p.ApeyNom := Reg_s.ApeyNom
                    *p.chances_tot := 5 + (reg_c.imp_total div 100)
                    channnces()
                    prim1 := p
                Sino
                    ult := prim1
                    Mientras (ult <> null) y (Reg_s.ApeyNom > *ult.ApeyNom) hacer
                        atras := ult
                        ult := *ult.prox
                    Fin Mientras
                    Si *ult.ApeyNom = Reg_s.ApeyNom entonces
                        *ult.chances_tot := *ult.chances_tot + (Reg_c.imp_total div 100)
                        channnces()
                    Sino
                        Nuevo(p)
                        *p.ApeyNom := Reg_c.ApeyNom
                        *p.chances_tot := 5 + (Reg_c.imp_total div 100)
                        channnces()
                        Si ult = prim entonces
                            *p.ant := null
                            *p.prox := prim
                            prim := p
                        Sino
                            *atras.prox := p
                            *p.ant := atras
                            *p.prox := ult
                            Si (Reg_s.ApeyNom <> null) entonces
                                *ult.ant := p
                            Fin Si
                        Fin Si
                    Fin Si
                Fin Si
            Sino
                Escribir("ERROR.")   
            Fin Si
            Leer(Arch_c, Reg_c)
        Fin Mientras

        Cerrar(Arch_c)
        Cerrar(Arch_s)
        
Fin ACCION
            