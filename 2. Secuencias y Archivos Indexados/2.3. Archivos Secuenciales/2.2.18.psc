ACCION 2.1.18() ES  
    AMBIENTE
        articulos = Registro
            Cod_prod : N(4)
            tipo : AN(20)
            marca : AN(20)
            descripcion : AN(100)
            cant_unidades : N(5)
        FR
        sucur1, sucur2, arch_sal: Archivo de articulos
        reg_sucur1, reg_sucur2, reg_sal: articulos
        
       
    PROCESO
        Abrir E/(sucur1)
        Abrir E/(sucur2)
        Abrir /S(arch_sal)
        Leer(sucur1, reg_sucur1)
        Leer(sucur2, reg_sucur2)
        Mientras NFDA(sucur1) y NFDA(sucur2) hacer
            Si reg_sucur1.Cod_prod < reg_sucur2.Cod_prod entonces
                reg_sal := reg_sucur1
                Grabar(arch_sal, reg_sal)
                Escribir(reg_sucur1.Cod_prod, " | ", reg_sucur1.tipo, " | ", reg_sucur1.marca, " | ", reg_sucur1.descripcion, " | ", reg_sucur1.cant_unidades, " | ", "0", " | ", reg_sucur1.cant_unidades)
                Leer(sucur1, reg_sucur1)
            Sino
                Si reg_sucur1.Cod_prod > reg_sucur2.Cod_prod entonces
                    reg_sal := reg_sucur2
                    Grabar(arch_sal, reg_sal)
                    Escribir(reg_sucur2.Cod_prod, " | ", reg_sucur2.tipo, " | ", reg_sucur2.marca, " | ", reg_sucur2.descripcion, " | ", "0", " | ",reg_sucur2.cant_unidades,   " | ", reg_sucur2.cant_unidades)
                    Leer(sucur2, reg_sucur2)
                Sino
                    reg_sal := reg_sucur1
                    reg_sal.cant_unidades := reg_sal.cant_unidades + reg_sucur2.cant_unidades
                    Grabar(arch_sal, reg_sal)
                    Escribir(reg_sucur1.Cod_prod, " | ", reg_sucur1.tipo, " | ", reg_sucur1.marca, " | ", reg_sucur1.descripcion, " | ", reg_sucur1.cant_unidades, " | ",reg_sucur2.cant_unidades,   " | ", reg_sucur1.cant_unidades + reg_sucur2.cant_unidades)
                    Leer(sucur1, reg_sucur1)
                    Leer(sucur2, reg_sucur2)
                Fin Si
            Fin Si
        Fin Mientras
        Mientras NFDA(sucur1) hacer
            reg_sal := reg_sucur1
            Grabar(arch_sal, reg_sal)
            Escribir(reg_sucur1.Cod_prod, " | ", reg_sucur1.tipo, " | ", reg_sucur1.marca, " | ", reg_sucur1.descripcion, " | ", reg_sucur1.cant_unidades, " | ", "0", " | ", reg_sucur1.cant_unidades)
            Leer(sucur1, reg_sucur1)
        Fin Mientras
        Mientras NFDA(sucur2) hacer
            reg_sal := reg_sucur2
            Grabar(arch_sal, reg_sal)
            Escribir(reg_sucur2.Cod_prod, " | ", reg_sucur2.tipo, " | ", reg_sucur2.marca, " | ", reg_sucur2.descripcion, " | ", "0", " | ",reg_sucur2.cant_unidades,   " | ", reg_sucur2.cant_unidades)
            Leer(sucur2, reg_sucur2)
        Fin Mientras
        Cerrar(sucur1)
        Cerrar(sucur2)
        Cerrar(arch_sal)
Fin ACCION


