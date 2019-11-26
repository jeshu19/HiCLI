-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-11-26 15:50:34.558

-- tables
-- Table: CONSULTA_ENFERMEDAD
CREATE TABLE CONSULTA_ENFERMEDAD (
    IDCONENF int NOT NULL AUTO_INCREMENT COMMENT 'ID identificador de la tala Consulta_Enfermedad.',
    FECCONENF date NULL COMMENT 'Fecha en que se realizo la consulta.',
    CODHISCLI int NOT NULL COMMENT 'Codigo de historia clinica.',
    CODENF char(7) NOT NULL COMMENT 'Codigo de Enfermedad.',
    CONSTRAINT CONSULTA_ENFERMEDAD_pk PRIMARY KEY (IDCONENF)
) COMMENT 'Una persona puede tener múltiples enfermedades a lo largo de su historia clinica y para esto es esta tabla.';

-- Table: ENFERMEDAD
CREATE TABLE ENFERMEDAD (
    CODENF char(7) NOT NULL COMMENT 'Codigo identificador de enfermedad.',
    DESCENF varchar(100) NULL COMMENT 'Descripcion de enfermedad.',
    CONSTRAINT ENFERMEDAD_pk PRIMARY KEY (CODENF)
) COMMENT 'Aqui se registraran todas las enfermedades que existen hasta el dia de hoy.';

-- Table: ESPECIALIDAD
CREATE TABLE ESPECIALIDAD (
    IDESP int NOT NULL AUTO_INCREMENT COMMENT 'Código identificador de la Especialidad.',
    DESESP varchar(50) NULL COMMENT 'Descripción de la Especialidad',
    ESTESP char(1) NULL COMMENT 'Estado de Activo o Inactivo.',
    CONSTRAINT ESPECIALIDAD_pk PRIMARY KEY (IDESP)
) COMMENT 'Esta tabla contiene todas las Especialidades de los trabajadores.';

-- Table: ESTABLECIMIENTO
CREATE TABLE ESTABLECIMIENTO (
    IDEST int NOT NULL AUTO_INCREMENT COMMENT 'Codigo identificador del Establecimiento.',
    NOMEST varchar(80) NULL COMMENT 'Nombre del Establecimiento.',
    DIREST varchar(100) NULL COMMENT 'Direccion del establecimiento.',
    CODUBI char(6) NOT NULL COMMENT 'Codigo de Ubigeo.',
    TELEST char(7) NOT NULL COMMENT 'Teléfono del Establecimiento.',
    ESTEST char(1) NULL COMMENT 'Estado de Activo o Inactivo.',
    CONSTRAINT ESTABLECIMIENTO_pk PRIMARY KEY (IDEST)
) COMMENT 'Contiene todos los establecimientos de la SBS.';

-- Table: HISTORIA_CLINICA
CREATE TABLE HISTORIA_CLINICA (
    CODHISCLI int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada Historia Clinica.',
    PESHISCLI numeric(6,2) NULL COMMENT 'Peso de cada paciente.',
    ALTHISCLI numeric(6,2) NULL COMMENT 'Altura de cada paciente.',
    IDPAC int NOT NULL COMMENT 'Codigo de cada Paciente.',
    IDTRA int NOT NULL COMMENT 'Codigo de cada trabajador.',
    FECHISCLI date NULL COMMENT 'Fecha en que se realizo cada Historia Clinica.',
    CONSTRAINT HISTORIA_CLINICA_pk PRIMARY KEY (CODHISCLI)
) COMMENT 'Contiene las Historias Clinicas de todos los pacientes.';

-- Table: PACIENTE
CREATE TABLE PACIENTE (
    IDPAC int NOT NULL AUTO_INCREMENT COMMENT 'Codigo identificador del Paciente.',
    IDPER int NOT NULL COMMENT 'ID de la Persona que es un paciente.',
    ESTCIVPAC char(1) NULL COMMENT 'Estado civil del paciente.',
    FECREGPAC date NOT NULL COMMENT 'Fecha de registro del Paciente.',
    ESTPAC char(1) NULL COMMENT 'Estado de Activo o Inactivo.',
    CONSTRAINT PACIENTE_pk PRIMARY KEY (IDPAC)
) COMMENT 'Contiene datos de los pacientes registrados.';

-- Table: PACIENTE_ACOMPANANTE
CREATE TABLE PACIENTE_ACOMPANANTE (
    CODPACACO int NOT NULL AUTO_INCREMENT,
    IDPAC int NOT NULL COMMENT 'ID del paciente.',
    IDPER int NOT NULL COMMENT 'ID de la persona acompañante.',
    TIPACO char(1) NULL COMMENT 'Tipo Acompañante:
P: Padre
M: Madre
O: Otros',
    FECPACACO date NULL COMMENT 'Fecha de registro de Acompañante.',
    ESTPACACO char(1) NULL,
    CONSTRAINT PACIENTE_ACOMPANANTE_pk PRIMARY KEY (CODPACACO)
) COMMENT 'Aqui se registraran las personas que tengan acompañantes.';

-- Table: PERSONA
CREATE TABLE PERSONA (
    IDPER int NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la persona',
    NOMPER varchar(80) NULL COMMENT 'Nombre de la persona',
    APEPER varchar(80) NULL COMMENT 'Apellido de la Persona',
    CELPER char(9) NOT NULL COMMENT 'Celular de la Persona',
    DNIPER char(8) NULL COMMENT 'DNI de la persona',
    DIRPER varchar(150) NULL COMMENT 'Direccion de la persona',
    FECNACPER date NULL COMMENT 'Fecha de Nacimiento',
    SEXPER char(1) NULL COMMENT 'Sexo de la Persona',
    TIPPER char(3) NULL COMMENT 'Diferenciador de los tipos de Persona PAC(paciente) - TRA(Trabajador) - ACO(Acompañante).',
    CODUBI char(6) NOT NULL COMMENT 'Codigo del Ubigeo',
    ESTPER char(1) NULL COMMENT 'Estado de la Persona',
    CONSTRAINT PERSONA_pk PRIMARY KEY (IDPER)
) COMMENT 'Contiene todos los datos personales de las personas.';

-- Table: TRABAJADOR
CREATE TABLE TRABAJADOR (
    IDTRA int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del Trabajador',
    IDPER int NOT NULL COMMENT 'Codigo de la persona',
    IDESP int NOT NULL COMMENT 'Id de la Especialidad a la que pertenece.',
    IDEST int NOT NULL COMMENT 'Id del establecimiento al que pertenece.',
    CARTRA char(1) NULL COMMENT 'Cargo del trabajador.',
    FECREGTRA date NULL COMMENT 'Fecha en la que se registro el trabajador.',
    EMAILTRA varchar(60) NOT NULL COMMENT 'Correo electrónico del Trabajador.',
    IDUSE int NOT NULL COMMENT 'Id que relaciona al trabajador con su usuario y contraseña.',
    ESTTRA char(1) NULL COMMENT 'Estado de activo y inactivo.',
    CONSTRAINT TRABAJADOR_pk PRIMARY KEY (IDTRA)
) COMMENT 'Contiene los datos principales de cada trabajador.';

-- Table: UBIGEO
CREATE TABLE UBIGEO (
    CODUBI char(6) NOT NULL COMMENT 'Codigo Ubigeo',
    DEPUBI varchar(100) NULL COMMENT 'Derpartamento de Ubigeo',
    PROVUBI varchar(100) NULL COMMENT 'Provincia de Ubigeo',
    DISTUBI varchar(100) NULL COMMENT 'Distrito de Ubigeo',
    CONSTRAINT UBIGEO_pk PRIMARY KEY (CODUBI)
) COMMENT 'Contiene todos los Ubigeos del PERÚ.';

-- Table: USUARIO
CREATE TABLE USUARIO (
    IDUSE int NOT NULL AUTO_INCREMENT COMMENT 'Codigo identificador por usuario.',
    NAMUSE varchar(50) NULL COMMENT 'Nombre de Usuario.',
    PASUSE varchar(50) NULL COMMENT 'Contraseña de Usuario.',
    TIPUSE char(1) NULL COMMENT 'Tipo de Usuario A(Admin) - U(User)',
    ESTUSE char(1) NULL COMMENT 'Estado de Activo o Inactivo.',
    CONSTRAINT USUARIO_pk PRIMARY KEY (IDUSE)
) COMMENT 'Inicio de Sesión.';

-- foreign keys
-- Reference: ENFERMEDAD_CONSULTA_ENFERMEDAD_CODENF (table: CONSULTA_ENFERMEDAD)
ALTER TABLE CONSULTA_ENFERMEDAD ADD CONSTRAINT ENFERMEDAD_CONSULTA_ENFERMEDAD_CODENF FOREIGN KEY ENFERMEDAD_CONSULTA_ENFERMEDAD_CODENF (CODENF)
    REFERENCES ENFERMEDAD (CODENF);

-- Reference: ESPECIALIDAD_TRABAJADOR_IDESP (table: TRABAJADOR)
ALTER TABLE TRABAJADOR ADD CONSTRAINT ESPECIALIDAD_TRABAJADOR_IDESP FOREIGN KEY ESPECIALIDAD_TRABAJADOR_IDESP (IDESP)
    REFERENCES ESPECIALIDAD (IDESP);

-- Reference: ESTABLECIMIENTO_TRABAJADOR_IDEST (table: TRABAJADOR)
ALTER TABLE TRABAJADOR ADD CONSTRAINT ESTABLECIMIENTO_TRABAJADOR_IDEST FOREIGN KEY ESTABLECIMIENTO_TRABAJADOR_IDEST (IDEST)
    REFERENCES ESTABLECIMIENTO (IDEST);

-- Reference: HISTORIA_CLINICA_CONSULTA_ENFERMEDAD_CODHISCLI (table: CONSULTA_ENFERMEDAD)
ALTER TABLE CONSULTA_ENFERMEDAD ADD CONSTRAINT HISTORIA_CLINICA_CONSULTA_ENFERMEDAD_CODHISCLI FOREIGN KEY HISTORIA_CLINICA_CONSULTA_ENFERMEDAD_CODHISCLI (CODHISCLI)
    REFERENCES HISTORIA_CLINICA (CODHISCLI);

-- Reference: PACIENTE_HISTORIA_CLINICA_IDPAC (table: HISTORIA_CLINICA)
ALTER TABLE HISTORIA_CLINICA ADD CONSTRAINT PACIENTE_HISTORIA_CLINICA_IDPAC FOREIGN KEY PACIENTE_HISTORIA_CLINICA_IDPAC (IDPAC)
    REFERENCES PACIENTE (IDPAC);

-- Reference: PACIENTE_PACIENTE_ACOMPANANTE_IDPAC (table: PACIENTE_ACOMPANANTE)
ALTER TABLE PACIENTE_ACOMPANANTE ADD CONSTRAINT PACIENTE_PACIENTE_ACOMPANANTE_IDPAC FOREIGN KEY PACIENTE_PACIENTE_ACOMPANANTE_IDPAC (IDPAC)
    REFERENCES PACIENTE (IDPAC);

-- Reference: PERSONA_PACIENTE_ACOMPANANTE_IDPER (table: PACIENTE_ACOMPANANTE)
ALTER TABLE PACIENTE_ACOMPANANTE ADD CONSTRAINT PERSONA_PACIENTE_ACOMPANANTE_IDPER FOREIGN KEY PERSONA_PACIENTE_ACOMPANANTE_IDPER (IDPER)
    REFERENCES PERSONA (IDPER);

-- Reference: PERSONA_PACIENTE_IDPER (table: PACIENTE)
ALTER TABLE PACIENTE ADD CONSTRAINT PERSONA_PACIENTE_IDPER FOREIGN KEY PERSONA_PACIENTE_IDPER (IDPER)
    REFERENCES PERSONA (IDPER);

-- Reference: PERSONA_TRABAJADOR_IDPER (table: TRABAJADOR)
ALTER TABLE TRABAJADOR ADD CONSTRAINT PERSONA_TRABAJADOR_IDPER FOREIGN KEY PERSONA_TRABAJADOR_IDPER (IDPER)
    REFERENCES PERSONA (IDPER);

-- Reference: TRABAJADOR_HISTORIA_CLINICA_IDTRA (table: HISTORIA_CLINICA)
ALTER TABLE HISTORIA_CLINICA ADD CONSTRAINT TRABAJADOR_HISTORIA_CLINICA_IDTRA FOREIGN KEY TRABAJADOR_HISTORIA_CLINICA_IDTRA (IDTRA)
    REFERENCES TRABAJADOR (IDTRA);

-- Reference: UBIGEO_ESTABLECIMIENTO_CODUBI (table: ESTABLECIMIENTO)
ALTER TABLE ESTABLECIMIENTO ADD CONSTRAINT UBIGEO_ESTABLECIMIENTO_CODUBI FOREIGN KEY UBIGEO_ESTABLECIMIENTO_CODUBI (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: UBIGEO_PERSONA_CODUBI (table: PERSONA)
ALTER TABLE PERSONA ADD CONSTRAINT UBIGEO_PERSONA_CODUBI FOREIGN KEY UBIGEO_PERSONA_CODUBI (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: USUARIO_TRABAJADOR_IDUSE (table: TRABAJADOR)
ALTER TABLE TRABAJADOR ADD CONSTRAINT USUARIO_TRABAJADOR_IDUSE FOREIGN KEY USUARIO_TRABAJADOR_IDUSE (IDUSE)
    REFERENCES USUARIO (IDUSE);

-- End of file.

