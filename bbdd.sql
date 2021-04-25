-- Generado por Oracle SQL Developer Data Modeler 4.1.3.901
--   en:        2021-04-25 02:31:53 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE TABLE Tbl_Cargo
  (
    Id_Cargo     INTEGER NOT NULL ,
    Nombre_Cargo VARCHAR2 (50 CHAR) NOT NULL ,
    Sueldo       NUMBER
  ) ;
ALTER TABLE Tbl_Cargo ADD CONSTRAINT Tbl_Cargo_PK PRIMARY KEY ( Id_Cargo ) ;


CREATE TABLE Tbl_Cliente
  (
    Id_Cliente       INTEGER NOT NULL ,
    Identificacion   VARCHAR2 (50 CHAR) NOT NULL ,
    Nombre_Cliente   VARCHAR2 (30 CHAR) NOT NULL ,
    Apellido_Cliente VARCHAR2 (30) ,
    Correo           VARCHAR2 (50 CHAR) NOT NULL ,
    Id_Pais          INTEGER NOT NULL
  ) ;
ALTER TABLE Tbl_Cliente ADD CONSTRAINT Tbl_Cliente_PK PRIMARY KEY ( Id_Cliente ) ;


CREATE TABLE Tbl_Departamento
  (
    Id_departamento INTEGER NOT NULL ,
    Departaemnto    VARCHAR2 (30 CHAR) NOT NULL
  ) ;
ALTER TABLE Tbl_Departamento ADD CONSTRAINT Tbl_Departamento_PK PRIMARY KEY ( Id_departamento ) ;


CREATE TABLE Tbl_Empleado
  (
    ID_Empleado       INTEGER NOT NULL ,
    Nombre_Emp        VARCHAR2 (30 CHAR) NOT NULL ,
    Apellido_Emp      VARCHAR2 (30 CHAR) NOT NULL ,
    Correo_Emp        VARCHAR2 (50 CHAR) ,
    Fecha_Naciemiento DATE NOT NULL ,
    Fecha_Inicio      DATE NOT NULL ,
    Fecha_Final       DATE ,
    Id_Cargo          INTEGER ,
    Id_Tipo_Empl      INTEGER NOT NULL ,
    Id_departamento   INTEGER ,
    Id_Estado         INTEGER NOT NULL ,
    Id_Turno          INTEGER NOT NULL
  ) ;
ALTER TABLE Tbl_Empleado ADD CONSTRAINT Tbl_Empleado_PK PRIMARY KEY ( ID_Empleado ) ;


CREATE TABLE Tbl_Estado
  (
    Id_Estado INTEGER NOT NULL ,
    Estado    VARCHAR2 (12) NOT NULL
  ) ;
ALTER TABLE Tbl_Estado ADD CONSTRAINT Tbl_Estado_PK PRIMARY KEY ( Id_Estado ) ;


CREATE TABLE Tbl_Factura
  (
    Id_Factura     INTEGER NOT NULL ,
    Fecha          DATE NOT NULL ,
    Anticipo       NUMBER NOT NULL ,
    Total          NUMBER NOT NULL ,
    Id_tipo_Pago   INTEGER NOT NULL ,
    Id_Reservacion INTEGER NOT NULL ,
    Id_Estado      INTEGER NOT NULL
  ) ;
CREATE UNIQUE INDEX Tbl_Factura__IDX ON Tbl_Factura
  (
    Id_Reservacion ASC
  )
  ;
ALTER TABLE Tbl_Factura ADD CONSTRAINT Tbl_Factura_PK PRIMARY KEY ( Id_Factura ) ;


CREATE TABLE Tbl_Habitacion_Salon
  (
    Id_Hab_Salon      INTEGER NOT NULL ,
    Nombre_Hab        VARCHAR2 (5) NOT NULL ,
    Nivel             INTEGER NOT NULL ,
    Id_Tipo_Hab_Salon INTEGER NOT NULL ,
    Id_Estado         INTEGER NOT NULL
  ) ;
ALTER TABLE Tbl_Habitacion_Salon ADD CONSTRAINT Tbl_Habitacion_Salon_PK PRIMARY KEY ( Id_Hab_Salon ) ;


CREATE TABLE Tbl_Pais
  (
    Id_Pais     INTEGER NOT NULL ,
    Nombre_Pais VARCHAR2 (30 CHAR) NOT NULL
  ) ;
ALTER TABLE Tbl_Pais ADD CONSTRAINT Tbl_Pais_PK PRIMARY KEY ( Id_Pais ) ;


CREATE TABLE Tbl_Precio
  (
    Id_Precio         INTEGER NOT NULL ,
    Precio            NUMBER NOT NULL ,
    Id_Temporada      INTEGER NOT NULL ,
    Id_Tipo_Hab_Salon INTEGER
  ) ;
ALTER TABLE Tbl_Precio ADD CONSTRAINT Tbl_Precio_PK PRIMARY KEY ( Id_Precio ) ;


CREATE TABLE Tbl_Reservacio_Hab_Salon
  (
    Id_Res_Hab_Salon INTEGER NOT NULL ,
    Id_Hab_Salon     INTEGER NOT NULL ,
    Id_Reservacion   INTEGER NOT NULL
  ) ;
ALTER TABLE Tbl_Reservacio_Hab_Salon ADD CONSTRAINT Relation_39_PK PRIMARY KEY ( Id_Res_Hab_Salon ) ;


CREATE TABLE Tbl_Reservacion
  (
    Id_Reservacion INTEGER NOT NULL ,
    Fecha_Entrada  DATE NOT NULL ,
    Fecha_Salida   DATE ,
    Descripcion    VARCHAR2 (400) ,
    Id_Cliente     INTEGER NOT NULL ,
    Id_Tipo_Res    INTEGER NOT NULL ,
    Id_Temporada   INTEGER NOT NULL ,
    ID_Empleado    INTEGER NOT NULL
  ) ;
ALTER TABLE Tbl_Reservacion ADD CONSTRAINT Tbl_Reservacion_PK PRIMARY KEY ( Id_Reservacion ) ;


CREATE TABLE Tbl_TIpo_Empleado
  (
    Id_Tipo_Empl  INTEGER NOT NULL ,
    Tipo_Empleado VARCHAR2 (12) NOT NULL
  ) ;
ALTER TABLE Tbl_TIpo_Empleado ADD CONSTRAINT Tbl_TIpo_Empleado_PK PRIMARY KEY ( Id_Tipo_Empl ) ;


CREATE TABLE Tbl_Telefono
  (
    Id_Telefono INTEGER NOT NULL ,
    Telefono    INTEGER NOT NULL ,
    Descripcion VARCHAR2 (50) ,
    Id_Cliente  INTEGER NOT NULL ,
    ID_Empleado INTEGER NOT NULL
  ) ;
ALTER TABLE Tbl_Telefono ADD CONSTRAINT Tbl_Telefono_PK PRIMARY KEY ( Id_Telefono ) ;


CREATE TABLE Tbl_Temporada
  (
    Id_Temporada INTEGER NOT NULL ,
    Nombre_Tempo VARCHAR2 (8 CHAR) NOT NULL
  ) ;
-- Error - Index Tbl_Temporada__IDX has no columns
ALTER TABLE Tbl_Temporada ADD CONSTRAINT Tbl_Temporada_PK PRIMARY KEY ( Id_Temporada ) ;


CREATE TABLE Tbl_Tipo_Hab_Salon
  (
    Id_Tipo_Hab_Salon INTEGER NOT NULL ,
    Tipo_Hab_Salon    VARCHAR2 (40) NOT NULL ,
    Capacidad         INTEGER NOT NULL
  ) ;
-- Error - Index Tbl_Tipo_Hab_Salon__IDX has no columns
ALTER TABLE Tbl_Tipo_Hab_Salon ADD CONSTRAINT Tbl_Tipo_Hab_Salon_PK PRIMARY KEY ( Id_Tipo_Hab_Salon ) ;


CREATE TABLE Tbl_Tipo_Pago
  (
    Id_tipo_Pago INTEGER NOT NULL ,
    Tipo_Pago    VARCHAR2 (50 CHAR) NOT NULL
  ) ;
COMMENT ON COLUMN Tbl_Tipo_Pago.Tipo_Pago
IS
  ' 
' ;
ALTER TABLE Tbl_Tipo_Pago ADD CONSTRAINT Tbl_Tipo_Pago_PK PRIMARY KEY ( Id_tipo_Pago ) ;


CREATE TABLE Tbl_Tipo_Reservacion
  (
    Id_Tipo_Res INTEGER NOT NULL ,
    Tipo_Res    VARCHAR2 (15) NOT NULL
  ) ;
ALTER TABLE Tbl_Tipo_Reservacion ADD CONSTRAINT Tbl_Tipo_Reservacion_PK PRIMARY KEY ( Id_Tipo_Res ) ;


CREATE TABLE Tbl_Turno
  (
    Id_Turno     INTEGER NOT NULL ,
    Nombre_Turno VARCHAR2 (12) NOT NULL ,
    Hora_Inicio  DATE NOT NULL ,
    Hora_Final   DATE
  ) ;
ALTER TABLE Tbl_Turno ADD CONSTRAINT Tbl_Turno_PK PRIMARY KEY ( Id_Turno ) ;
