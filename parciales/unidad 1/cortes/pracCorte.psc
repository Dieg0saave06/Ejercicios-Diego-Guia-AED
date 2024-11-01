ACCION UTN() ES
     AMBIENTE
        Fecha = Registro
            AA: N(4)
            MM: 1....12
            DD: 1....31
        Fin Registro
        Incripciones = Registro
            Clave = Registro
                Facultad: AN(100)
                Tema: AN(50)
                Curso: AN(100)
                Turno: ("Mañana", "Tarde", "Noche")
                Fecha_inicio: Fecha
                ID_curso: N(10)
            Fin Registro
            Duracion: N(3)
            Cupo: N(10)
            Cant_Inscriptos: N(50)
        Fin Registro
        Arch: Archivo de Incripciones ordenado por Facultad, Tema, Curso, Fecha_inicio, ID_curso
        Reg: Incripciones
        Total, Cont_facu, Cont_tema, Cont_curso: Entero
        resg_facu, resg_tema, resg_curso: Alfanumerico   

        Procedimiento Corte_curso() ES
            Escribir("La cantidad de inscriptos en el curso", resg_curso, "es de:", Cont_curso)
            Cont_tema:= Cont_tema + Cont_curso
            Cont_curso:= 0
            resg_curso:= reg.Clave.Curso
        Fin Procedimiento

        Procedimiento Corte_Tema() ES
            Corte_curso()
            Escribir("La cantidad de inscriptos en el tema", resg_tema,"es de:" Cont_tema)
            Cont_facu := Cont_facu + Cont_tema
            Cont_tema := 0
            resg_tema := reg.Clave.Tema
        Fin Procedimiento

        Procedimiento Corte_facu() ES
            Corte_Tema()
            Escribir("La cantidad de inscriptos en la facultad", resg_facu, "es de:", Cont_facu)
            Total := Total + Cont_facu
            Cont_facu := 0
            resg_facu := reg.Clave.Facultad
        Fin Procedimiento

        PROCESO
        Abrir E/(Arch)
        Leer(Arch, reg)

        Total := 0
        Cont_curso := 0
        Cont_facu := 0
        Cont_tema := 0

        resg_curso := reg.Clave.Curso
        resg_tema := reg.Clave.Tema
        resg_facu := reg.Clave.Facultad

        Mientras NFDA(Arch) hacer
            Si reg.Clave.Facultad <> resg_facu entonces
                Corte_facu()
            SiNo
                Si reg.Clave.Tema <> resg_tema entonces
                    Corte_Tema()
                SiNo 
                    Si reg.Clave.Curso <> resg_curso entonces
                        Corte_curso()
                    Fin Si
                Fin Si
            Fin Si
            Cont_curso := Cont_curso + reg.Cant_Inscriptos
            Leer(Arch, Reg)
        Fin Mientras
        Corte_facu()
        Escribir("El total de alumnos inscriptos es de:", Total)
        Cerrar(Arch)
Fin ACCION



