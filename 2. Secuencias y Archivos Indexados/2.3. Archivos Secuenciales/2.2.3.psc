ACCION 2.2.3() ES
    AMBIENTE
        biblioteca = Registro
            N_socio : N(4)
            N_telefono : N(12)
            Apellido_Nombre : AN(30)
            Carrera : {"ISI", "IEM", "IQ", "LAR"}
            Domicilio : AN(100)
            CUP : N(2)
        Fin Registro

        arch_biblio, arch_salida : Archivo de biblioteca
        reg_biblio : biblioteca

    PROCESO
        Abrir e/(arch_biblio) ; Abrir s/(arch_salida)
        Leer(arch_biblio, reg_biblio)


        Mientras NFDA(arch_biblio) hacer
            Si (reg_biblio.Carrera = "ISI") y (reg_biblio.CUP > 4) entonces
                Grabar(arch_salida, reg_biblio)
            Fin Si
            Leer(arch_biblio, reg_biblio)
        Fin Mientras
        Cerrar(arch_biblio)
        Cerrar(arch_salida)
Fin ACCION
