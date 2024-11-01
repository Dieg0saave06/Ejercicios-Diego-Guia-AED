ACCION 2.2.7() ES
    AMBIENTE
        padron = Registro
            Nombre_apellido : AN(30)
            Clase : N(4)
            DNI : N(8)
            Direccion : AN(100)
            N_Mesa : N(3)
            Observaciones : AN(100)
            N_Circuito : N(3)
            Partido : {0, 1, 2, 3}
        FR

        arch_padron : Archivo de padron
        reg_padron : padron 

        salida = Registro
            Nombre_apellido : AN(30)
            DNI : N(8)
            Direccion : AN(100)
        FR
        archs1, archs2 : Archivo de salida
        reg_sal : salida

    PROCESO
        Abrir E/(arch_padron)
        Abrir S/(archs1)
        Abrir S/(archs2)
        Leer(arch_padron, reg_padron)
        Mientras NFDA(arch_padron) hacer
            Si reg_padron.Partido = 3 entonces
                reg_sal.Nombre_apellido := reg_padron.Nombre_apellido
                reg_sal.DNI := reg_padron.DNI
                reg_sal.Direccion := reg_padron.Direccion
                Grabar(archs1, reg_sal)
            Fin Si
            Si (reg_padron.Partido = 0) y (reg_padron.Clase > 1940) entonces
                reg_sal.Nombre_apellido := reg_padron.Nombre_apellido
                reg_sal.DNI := reg_padron.DNI
                reg_sal.Direccion := reg_padron.Direccion
                Grabar(archs2, reg_sal)
            Fin Si
            Leer(arch_padron, reg_padron)
        Fin Mientras
        Cerrar(arch_padron)
        Cerrar(archs1)
        Cerrar(archs2)
Fin ACCION