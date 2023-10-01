-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-01 09:03:36.407

-- tables
-- Table: Alumno
CREATE TABLE Alumno (
    ID int  NOT NULL COMMENT 'identificador unico del estudiante',
    Nombre varchar(80)  NOT NULL COMMENT 'nombre del estudiante',
    Apellido_paterno varchar(80)  NOT NULL COMMENT 'contiene el apellido paterno del estudiante',
    Apellido_Materno varchar(80)  NOT NULL COMMENT 'contiene el apellido materno del estudiante',
    Direccion varchar(80)  NOT NULL COMMENT 'contiene la direccion del estudiante',
    Telefono int  NOT NULL COMMENT 'contiene el telefono del estudiante',
    Edad int  NOT NULL COMMENT 'contiene la edad del estudiante',
    Grado int  NOT NULL COMMENT 'grado del estudiante',
    Nivel varchar(80)  NOT NULL COMMENT 'si el estudiante se encuentra en nivel primario o secundario',
    Genero varchar(80)  NOT NULL COMMENT 'genero del estudiante',
    Matricula_ID int  NOT NULL,
    CONSTRAINT Alumno_pk PRIMARY KEY (ID)
) COMMENT 'contiene los datos del estudiante ';

-- Table: Carlos_Pedro_Silva_Luyo
CREATE TABLE Carlos_Pedro_Silva_Luyo (
    ID int  NOT NULL COMMENT 'contiene el identificador unico de la tabla 
Carlos Pedro Silva Luyo',
    Nombre Varchar(40)  NOT NULL COMMENT 'nombre de la institucion educativa',
    Direccion varchar(80)  NOT NULL COMMENT 'contiene la direccion de la institucion educativa',
    Telefono char(9)  NOT NULL COMMENT 'contiene el telefono principal de contactos de la institucion educativa',
    Correo_electronico varchar(80)  NOT NULL COMMENT 'contiene el correo de la institucion educativa',
    Director varchar(60)  NOT NULL COMMENT 'nombre del director o directora de la institucion educativa',
    CONSTRAINT Carlos_Pedro_Silva_Luyo_pk PRIMARY KEY (ID)
) COMMENT 'tabla de la institucion educativa';

-- Table: Cursos
CREATE TABLE Cursos (
    ID int  NOT NULL COMMENT 'identificador unico del curso',
    Nombre varchar(80)  NOT NULL COMMENT 'nombre del curso',
    Descripcion varchar(80)  NOT NULL COMMENT 'descripciones importantes',
    Horario timestamp  NOT NULL COMMENT 'horarios de los cursos',
    Duracion timestamp  NOT NULL COMMENT 'duracion de cada curso',
    Grado_ID int  NOT NULL,
    CONSTRAINT Cursos_pk PRIMARY KEY (ID)
) COMMENT 'datos de los cursos';

-- Table: Examenes
CREATE TABLE Examenes (
    ID int  NOT NULL COMMENT 'identificador unico de la tabla de examenes',
    Fecha_Examenes timestamp  NOT NULL COMMENT 'fechas en las que se realizan los examenes',
    Tipo_Examen varchar(80)  NOT NULL COMMENT 'tipo de examen puede ser un examen dentro de la unidad o examenes finales o examenes de recuperacion',
    Alumno_ID int  NOT NULL,
    CONSTRAINT Examenes_pk PRIMARY KEY (ID)
) COMMENT 'datos del examen';

-- Table: Grado
CREATE TABLE Grado (
    ID int  NOT NULL COMMENT 'identificador unico del grado',
    Nivel_Educativo varchar(80)  NOT NULL COMMENT 'si es primaria o secundaria',
    Nombre_Grado varchar(90)  NOT NULL COMMENT 'si se encuentra en 1° de primaria o 2° de secundaria,etc.',
    Alumno_ID int  NOT NULL,
    CONSTRAINT Grado_pk PRIMARY KEY (ID)
) COMMENT 'datos del grado ';

-- Table: Maestros
CREATE TABLE Maestros (
    ID int  NOT NULL COMMENT 'identificador de la tabla maestro',
    Nombre varchar(80)  NOT NULL COMMENT 'nombre del maestro',
    Apellido_Paterno varchar(80)  NOT NULL COMMENT 'apellido paterno del maestro',
    Apellido_Materno varchar(80)  NOT NULL COMMENT 'apellido materno del maestro',
    Telefono int  NOT NULL COMMENT 'telefono del maestro',
    Especialidad varchar(80)  NOT NULL COMMENT 'especialidad del maestro',
    Correo_Electronico varchar(80)  NOT NULL COMMENT 'correo electronico del maestro',
    Fecha_Nacimiento date  NOT NULL COMMENT 'fecha de nacimiento del maestro',
    Grado_ID int  NOT NULL,
    Cursos_ID int  NOT NULL,
    CONSTRAINT Maestros_pk PRIMARY KEY (ID)
) COMMENT 'datos de los maestros';

-- Table: Matricula
CREATE TABLE Matricula (
    ID int  NOT NULL COMMENT 'identificador unico de la tabla matricula',
    Fecha_inscripcion timestamp  NOT NULL COMMENT 'fecha en la que se realiso la matricula',
    Estado bool  NOT NULL COMMENT 'estado de la matricula si se encuentra activa o inactiva',
    Carlos_Pedro_Silva_Luyo_ID int  NOT NULL,
    CONSTRAINT Matricula_pk PRIMARY KEY (ID)
) COMMENT 'contiene los datos de la matricula';

-- Table: Resultado_Examen
CREATE TABLE Resultado_Examen (
    ID int  NOT NULL COMMENT 'IDENTIFICADOR unico de la tabla de resultados de los examenes',
    Resultado_Examen decimal(20,00)  NOT NULL COMMENT 'resultado de la nota en decimales ya que las notas no sueles aveces ser datos enteros',
    Fecha_Resultado timestamp  NOT NULL COMMENT 'fecha en la que se emitio los resultado',
    Examenes_ID int  NOT NULL,
    CONSTRAINT Resultado_Examen_pk PRIMARY KEY (ID)
) COMMENT 'rasultados de los examenes';

-- foreign keys
-- Reference: Alumno_Matricula (table: Alumno)
ALTER TABLE Alumno ADD CONSTRAINT Alumno_Matricula FOREIGN KEY Alumno_Matricula (Matricula_ID)
    REFERENCES Matricula (ID);

-- Reference: Cursos_Grado (table: Cursos)
ALTER TABLE Cursos ADD CONSTRAINT Cursos_Grado FOREIGN KEY Cursos_Grado (Grado_ID)
    REFERENCES Grado (ID);

-- Reference: Examenes_Alumno (table: Examenes)
ALTER TABLE Examenes ADD CONSTRAINT Examenes_Alumno FOREIGN KEY Examenes_Alumno (Alumno_ID)
    REFERENCES Alumno (ID);

-- Reference: Grado_Alumno (table: Grado)
ALTER TABLE Grado ADD CONSTRAINT Grado_Alumno FOREIGN KEY Grado_Alumno (Alumno_ID)
    REFERENCES Alumno (ID);

-- Reference: Maestros_Cursos (table: Maestros)
ALTER TABLE Maestros ADD CONSTRAINT Maestros_Cursos FOREIGN KEY Maestros_Cursos (Cursos_ID)
    REFERENCES Cursos (ID);

-- Reference: Maestros_Grado (table: Maestros)
ALTER TABLE Maestros ADD CONSTRAINT Maestros_Grado FOREIGN KEY Maestros_Grado (Grado_ID)
    REFERENCES Grado (ID);

-- Reference: Matricula_Carlos_Pedro_Silva_Luyo (table: Matricula)
ALTER TABLE Matricula ADD CONSTRAINT Matricula_Carlos_Pedro_Silva_Luyo FOREIGN KEY Matricula_Carlos_Pedro_Silva_Luyo (Carlos_Pedro_Silva_Luyo_ID)
    REFERENCES Carlos_Pedro_Silva_Luyo (ID);

-- Reference: Resultado_Examen_Examenes (table: Resultado_Examen)
ALTER TABLE Resultado_Examen ADD CONSTRAINT Resultado_Examen_Examenes FOREIGN KEY Resultado_Examen_Examenes (Examenes_ID)
    REFERENCES Examenes (ID);

-- End of file.

