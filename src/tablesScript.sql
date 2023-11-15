// DROP DE TABLAS

DROP TABLE accesorio_deportivo CASCADE CONSTRAINTS;
DROP TABLE articulo_extra CASCADE CONSTRAINTS;
DROP TABLE cliente CASCADE CONSTRAINTS;
DROP TABLE compras CASCADE CONSTRAINTS;
DROP TABLE ejercicio CASCADE CONSTRAINTS;
DROP TABLE ejercicio_cardio CASCADE CONSTRAINTS;
DROP TABLE ejercicio_pesas CASCADE CONSTRAINTS;
DROP TABLE ejercicio_por_grupo CASCADE CONSTRAINTS;
DROP TABLE grupo_muscular CASCADE CONSTRAINTS;
DROP TABLE historial_ejercicios CASCADE CONSTRAINTS;
DROP TABLE registro_ejercicio CASCADE CONSTRAINTS;
DROP TABLE rutina CASCADE CONSTRAINTS;
DROP TABLE suplemento CASCADE CONSTRAINTS;
DROP TABLE suscripcion CASCADE CONSTRAINTS;

// CREACIÓN DE TABLAS

CREATE TABLE accesorio_deportivo (
    talla             VARCHAR2(20),
    articulo_extra_id NUMBER NOT NULL
);

ALTER TABLE accesorio_deportivo ADD CONSTRAINT accesorio_deportivo_pk PRIMARY KEY ( articulo_extra_id );

CREATE TABLE articulo_extra (
    id          NUMBER NOT NULL,
    nombre      VARCHAR2(30) NOT NULL,
    precio      NUMBER NOT NULL,
    link_imagen VARCHAR2(255) NOT NULL,
    marca       VARCHAR2(20) NOT NULL,
    stock       INTEGER NOT NULL
);

ALTER TABLE articulo_extra ADD CONSTRAINT articulo_extra_pk PRIMARY KEY ( id );

CREATE TABLE cliente (
    id                   INTEGER NOT NULL,
    nombre               VARCHAR2(50) NOT NULL,
    fecha_nacimiento     DATE NOT NULL,
    genero               VARCHAR2(20) NOT NULL,
    ciudad               VARCHAR2(20) NOT NULL,
    peso_lb              NUMBER NOT NULL,
    altura_cm            INTEGER NOT NULL,
    porcentaje_descuento NUMBER NOT NULL,
    es_estudiante        CHAR(1) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id );

CREATE TABLE compras (
    id                 INTEGER NOT NULL,
    cantidad           INTEGER,
    cliente_id         INTEGER NOT NULL,
    articulo_extra_id NUMBER NOT NULL
);

ALTER TABLE compras ADD CONSTRAINT compras_pk PRIMARY KEY ( id );

CREATE TABLE ejercicio (
    id            INTEGER NOT NULL,
    nombre        VARCHAR2(50) NOT NULL,
    descripcion   VARCHAR2(255) NOT NULL,
    link_tutorial VARCHAR2(255),
    link_imagen   VARCHAR2(255)
);

ALTER TABLE ejercicio ADD CONSTRAINT ejercicio_pk PRIMARY KEY ( id );

CREATE TABLE ejercicio_cardio (
    id                INTEGER NOT NULL,
    duracion_segundos NUMBER NOT NULL,
    calorias_quemadas INTEGER NOT NULL,
    ejercicio_id      INTEGER NOT NULL
);

ALTER TABLE ejercicio_cardio ADD CONSTRAINT ejercicio_cardio_pk PRIMARY KEY ( id );

CREATE TABLE ejercicio_pesas (
    id           INTEGER NOT NULL,
    peso_lb      NUMBER NOT NULL,
    repeticiones INTEGER NOT NULL,
    ejercicio_id INTEGER NOT NULL
);

ALTER TABLE ejercicio_pesas ADD CONSTRAINT ejercicio_pesas_pk PRIMARY KEY ( id );

CREATE TABLE ejercicio_por_grupo (
    ejercicio_id      INTEGER NOT NULL,
    grupo_muscular_id INTEGER NOT NULL
);

CREATE TABLE grupo_muscular (
    id     INTEGER NOT NULL,
    nombre VARCHAR2(30) NOT NULL
);

ALTER TABLE grupo_muscular ADD CONSTRAINT grupo_muscular_pk PRIMARY KEY ( id );

CREATE TABLE historial_ejercicios (
    fecha                 DATE NOT NULL,
    record_personal       CHAR(1),
    registro_ejercicio_id INTEGER NOT NULL,
    rutina_id             INTEGER NOT NULL,
    cliente_id            INTEGER NOT NULL
);

CREATE TABLE registro_ejercicio (
    id           INTEGER NOT NULL,
    ejercicio_id INTEGER NOT NULL
);

ALTER TABLE registro_ejercicio ADD CONSTRAINT registro_ejercicio_pk PRIMARY KEY ( id );

CREATE TABLE rutina (
    id                INTEGER NOT NULL,
    duracion_segundos INTEGER NOT NULL,
    nombre            VARCHAR2(50) NOT NULL,
    fecha_creacion    DATE NOT NULL,
    dificultad        VARCHAR2(20) NOT NULL,
    cliente_id        INTEGER NOT NULL
);

ALTER TABLE rutina ADD CONSTRAINT rutina_pk PRIMARY KEY ( id );

CREATE TABLE suplemento (
    dosis_gramos      INTEGER NOT NULL,
    articulo_extra_id NUMBER NOT NULL
);

ALTER TABLE suplemento ADD CONSTRAINT suplemento_pk PRIMARY KEY ( articulo_extra_id );

CREATE TABLE suscripcion (
    fecha_inicio       DATE NOT NULL,
    fecha_finalizacion DATE NOT NULL,
    precio_base        NUMBER NOT NULL,
    cliente_id         INTEGER NOT NULL
);

ALTER TABLE suscripcion ADD CONSTRAINT suscripcion_pk PRIMARY KEY ( cliente_id );

// LLAVES FORÁNEAS

ALTER TABLE accesorio_deportivo
    ADD CONSTRAINT accesorio_deportivo_ae_fk FOREIGN KEY ( articulo_extra_id )
        REFERENCES articulo_extra ( id );

ALTER TABLE compras
    ADD CONSTRAINT compras_articulo_extra_fk FOREIGN KEY ( articulo_extra_id )
        REFERENCES articulo_extra ( id );

ALTER TABLE compras
    ADD CONSTRAINT compras_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( id );

ALTER TABLE ejercicio_cardio
    ADD CONSTRAINT ejercicio_cardio_re_fk FOREIGN KEY ( id )
        REFERENCES registro_ejercicio ( id );

ALTER TABLE ejercicio_pesas
    ADD CONSTRAINT ejercicio_pesas_re_fk FOREIGN KEY ( id )
        REFERENCES registro_ejercicio ( id );

ALTER TABLE ejercicio_por_grupo
    ADD CONSTRAINT ejercicio_por_grupo_e_fk FOREIGN KEY ( ejercicio_id )
        REFERENCES ejercicio ( id );

ALTER TABLE ejercicio_por_grupo
    ADD CONSTRAINT ejercicio_por_grupo_gm_fk FOREIGN KEY ( grupo_muscular_id )
        REFERENCES grupo_muscular ( id );

ALTER TABLE historial_ejercicios
    ADD CONSTRAINT historial_ejercicios_c_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( id );

ALTER TABLE historial_ejercicios
    ADD CONSTRAINT historial_ejercicios_r_fk FOREIGN KEY ( rutina_id )
        REFERENCES rutina ( id );

ALTER TABLE historial_ejercicios
    ADD CONSTRAINT historial_ejercicios_re_fk FOREIGN KEY ( registro_ejercicio_id )
        REFERENCES registro_ejercicio ( id );

ALTER TABLE registro_ejercicio
    ADD CONSTRAINT registro_ejercicio_e_fk FOREIGN KEY ( ejercicio_id )
        REFERENCES ejercicio ( id );

ALTER TABLE rutina
    ADD CONSTRAINT rutina_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( id );

ALTER TABLE suplemento
    ADD CONSTRAINT suplemento_ae_fk FOREIGN KEY ( articulo_extra_id )
        REFERENCES articulo_extra ( id );

ALTER TABLE suscripcion
    ADD CONSTRAINT suscripcion_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( id );