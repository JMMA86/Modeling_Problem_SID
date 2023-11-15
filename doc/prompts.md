## Prompts

Se usó la herramienta ChatGPT de OpenAI para generar datos de ejemplo en cada una de las tablas. Para ello, se generaron 5 inserts manualmente para cada registro, para que luego la IA genere los restantes.

En cada prompt se le especificó:
- La cantidad de inserts a realizar
- Ejemplos de insert
- El código de creación de la tabla
- Restricciones adicionales para las llaves foráneas
- Aclaraciones sobre la estructura de los arcos

**Nota:** En ocasiones la primera petición no resultaba en todos los inserts (se recibe como output un mensaje indicando que como modelo de lenguaje no puede generar inserts, una cantidad muy pequeña seguida de puntos suspensivos, etc). Ante esto, regenerar la respuesta o hacer modificaciones ligeras al prompt resultaba en una respuesta útil para las necesidades.

### Tabla cliente 

```sql
Genera manualmente 45 inserts adicionales como estos:

INSERT INTO cliente VALUES (1, 'Juan Perez', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'Masculino', 'Bogot ', 160, 175, 0, 'N');
INSERT INTO cliente VALUES (2, 'Maria Rodriguez', TO_DATE('1985-08-22', 'YYYY-MM-DD'), 'Femenino', 'Medell n', 140, 160, 0.15, 'S');
INSERT INTO cliente VALUES (3, 'Carlos Gomez', TO_DATE('1993-02-10', 'YYYY-MM-DD'), 'Masculino', 'Cali', 180, 185, 0, 'N');
INSERT INTO cliente VALUES (4, 'Ana Fernandez', TO_DATE('1988-11-30', 'YYYY-MM-DD'), 'Femenino', 'Barranquilla', 120, 155, 0.2, 'S');
INSERT INTO cliente VALUES (5, 'Luis Hernandez', TO_DATE('1995-07-18', 'YYYY-MM-DD'), 'Masculino', 'Cartagena', 200, 190, 0, 'N');

La tabla se crea de esta manera:

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
```

### Tabla Rutina

```sql
Genera manualmente 45 inserts adicionales como estos:

INSERT INTO rutina VALUES (1, 1800, 'Pesas: Upper Body', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Intermedia', 1);
INSERT INTO rutina VALUES (2, 1500, 'Cardio: Beginners Run', TO_DATE('2023-02-15', 'YYYY-MM-DD'), 'Fácil', 2);
INSERT INTO rutina VALUES (3, 2000, 'Crossfit: Intense Circuits', TO_DATE('2023-03-10', 'YYYY-MM-DD'), 'Avanzada', 3);
INSERT INTO rutina VALUES (4, 1200, 'Pesas: Lower Body', TO_DATE('2023-04-05', 'YYYY-MM-DD'), 'Fácil', 4);
INSERT INTO rutina VALUES (5, 2100, 'Cardio: HIIT Training', TO_DATE('2023-05-20', 'YYYY-MM-DD'), 'Intermedia', 5);

La tabla se crea de esta manera:

CREATE TABLE rutina (
    id                INTEGER NOT NULL,
    duracion_segundos INTEGER NOT NULL,
    nombre            VARCHAR2(50) NOT NULL,
    fecha_creacion    DATE NOT NULL,
    dificultad        VARCHAR2(20) NOT NULL,
    cliente_id        INTEGER NOT NULL
);

ALTER TABLE rutina ADD CONSTRAINT rutina_pk PRIMARY KEY ( id );

El id del cliente puede ir hasta 50
```

### Tabla Suscripción

```sql
Genera manualmente 35 inserts adicionales como estos:

INSERT INTO suscripcion VALUES (TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-04-01', 'YYYY-MM-DD'), 50000, 1);
INSERT INTO suscripcion VALUES (TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-05-01', 'YYYY-MM-DD'), 45000, 2);
INSERT INTO suscripcion VALUES (TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-06-01', 'YYYY-MM-DD'), 55000, 3);
INSERT INTO suscripcion VALUES (TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-07-01', 'YYYY-MM-DD'), 40000, 4);
INSERT INTO suscripcion VALUES (TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-08-01', 'YYYY-MM-DD'), 60000, 5);


La tabla se crea de esta manera:

CREATE TABLE suscripcion (
    fecha_inicio       DATE NOT NULL,
    fecha_finalizacion DATE NOT NULL,
    precio_base        NUMBER NOT NULL,
    cliente_id         INTEGER NOT NULL
);

ALTER TABLE suscripcion ADD CONSTRAINT suscripcion_pk PRIMARY KEY ( cliente_id );

El id del cliente puede ir hasta 50
```

## Grupo Muscular

```sql
Genera manualmente 20 inserts adicionales como estos:

INSERT INTO grupo_muscular (id, nombre) VALUES (1, 'Pectorales');
INSERT INTO grupo_muscular (id, nombre) VALUES (2, 'Piernas');
INSERT INTO grupo_muscular (id, nombre) VALUES (3, 'Deltoides Anterior');
INSERT INTO grupo_muscular (id, nombre) VALUES (4, 'Deltoides Medio');
INSERT INTO grupo_muscular (id, nombre) VALUES (5, 'Deltoides Posterior');

La tabla se crea de esta manera:

CREATE TABLE grupo_muscular (
    id     INTEGER NOT NULL,
    nombre VARCHAR2(30) NOT NULL
);

ALTER TABLE grupo_muscular ADD CONSTRAINT grupo_muscular_pk PRIMARY KEY ( id );
```

### Ejercicio

```sql
Genera manualmente 20 inserts adicionales como estos:

INSERT INTO ejercicio VALUES (1, 'Press de Banca', 'Ejercicio para pectorales', 'https://tutorial1.com', 'https://imagen1.com');
INSERT INTO ejercicio VALUES (2, 'Sentadillas', 'Ejercicio para piernas', 'https://tutorial2.com', 'https://imagen2.com');
INSERT INTO ejercicio VALUES (3, 'Pull-ups', 'Ejercicio para espalda', 'https://tutorial3.com', 'https://imagen3.com');
INSERT INTO ejercicio VALUES (4, 'Crunches', 'Ejercicio para abdominales', 'https://tutorial4.com', 'https://imagen4.com');
INSERT INTO ejercicio VALUES (5, 'Burpees', 'Ejercicio de cardio', 'https://tutorial5.com', 'https://imagen5.com');


La tabla se crea de esta manera:

CREATE TABLE grupo_muscular (
    id     INTEGER NOT NULL,
    nombre VARCHAR2(30) NOT NULL
);

ALTER TABLE grupo_muscular ADD CONSTRAINT grupo_muscular_pk PRIMARY KEY ( id );
```

### Ejercicio por Grupo Muscular

```sql
Genera manualmente 45 inserts adicionales como estos:

INSERT INTO ejercicio_por_grupo VALUES (1, 1);  -- Press de Banca (Pectorales)
INSERT INTO ejercicio_por_grupo VALUES (1, 7);   -- Press de Banca (Tríceps)
INSERT INTO ejercicio_por_grupo VALUES (1, 15);  -- Press de Banca (Flexores de cadera)
INSERT INTO ejercicio_por_grupo VALUES (2, 2);   -- Sentadillas (Piernas)
INSERT INTO ejercicio_por_grupo VALUES (2, 11);  -- Sentadillas (Isquiotibiales)

La tabla se crea de esta manera:

CREATE TABLE ejercicio_por_grupo (
    ejercicio_id      INTEGER NOT NULL,
    grupo_muscular_id INTEGER NOT NULL
);
ALTER TABLE ejercicio_por_grupo
    ADD CONSTRAINT ejercicio_por_grupo_e_fk FOREIGN KEY ( ejercicio_id )
        REFERENCES ejercicio ( id );

ALTER TABLE ejercicio_por_grupo
    ADD CONSTRAINT ejercicio_por_grupo_gm_fk FOREIGN KEY ( grupo_muscular_id )
        REFERENCES grupo_muscular ( id );

El id de ejercicio va hasta 50 y de grupo muscular hasta 24
```

### Suplemento y Accesorio deportivo

```sql
Genera manualmente 45 inserts adicionales como estos:

INSERT INTO articulo_extra VALUES (1, 'Prote�na en Polvo', 29.99, 'imagen_proteina.jpg', 'Optimum Nutrition', 50);
INSERT INTO articulo_extra VALUES (5, 'BCAA en Tabletas', 24.99, 'imagen_bcaa_tabletas.jpg', 'MusclePharm', 60);
INSERT INTO suplemento VALUES (30, 1);
INSERT INTO suplemento VALUES (10, 5);
INSERT INTO accesorio_deportivo VALUES ('Ajustable', 2);
INSERT INTO accesorio_deportivo VALUES ('Standard', 3);
INSERT INTO articulo_extra VALUES (2, 'Banda de Resistencia', 12.99, 'imagen_banda_resistencia.jpg', 'Fit Simplify', 100);
INSERT INTO articulo_extra VALUES (3, 'Cuerda para Saltar', 9.99, 'imagen_cuerda_saltar.jpg', 'Rogue Fitness', 75);


Las tablas se crean de esta manera:

CREATE TABLE articulo_extra (
    id          NUMBER NOT NULL,
    nombre      VARCHAR2(30) NOT NULL,
    precio      NUMBER NOT NULL,
    link_imagen VARCHAR2(255) NOT NULL,
    marca       VARCHAR2(20) NOT NULL,
    stock       INTEGER NOT NULL
);

ALTER TABLE articulo_extra ADD CONSTRAINT articulo_extra_pk PRIMARY KEY ( id );

CREATE TABLE accesorio_deportivo (
    talla             VARCHAR2(20),
    articulo_extra_id NUMBER NOT NULL
);

ALTER TABLE accesorio_deportivo ADD CONSTRAINT accesorio_deportivo_pk PRIMARY KEY ( articulo_extra_id );

CREATE TABLE suplemento (
    dosis_gramos      INTEGER NOT NULL,
    articulo_extra_id NUMBER NOT NULL
);

ALTER TABLE suplemento ADD CONSTRAINT suplemento_pk PRIMARY KEY ( articulo_extra_id );

Articulo extra es el supertipo, que tiene 2 subtipos: suplemento y accesorio deportivo
```

### Compras

```sql
Genera manualmente 45 inserts adicionales como estos:

INSERT INTO compras VALUES (1, 3, 25, 2);
INSERT INTO compras VALUES (2, 1, 11, 5);
INSERT INTO compras VALUES (3, 2, 8, 10);
INSERT INTO compras VALUES (4, 1, 37, 14);
INSERT INTO compras VALUES (5, 4, 2, 16);

La tabla se crea de esta manera:

CREATE TABLE compras (
    id                 INTEGER NOT NULL,
    cantidad           INTEGER,
    cliente_id         INTEGER NOT NULL,
    articulo_extra_id NUMBER NOT NULL
);

ALTER TABLE compras ADD CONSTRAINT compras_pk PRIMARY KEY ( id );

ALTER TABLE compras
    ADD CONSTRAINT compras_articulo_extra_fk FOREIGN KEY ( articulo_extra_id )
        REFERENCES articulo_extra ( id );

ALTER TABLE compras
    ADD CONSTRAINT compras_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( id );

El id del cliente va hasta 50 y de grupo muscular hasta 50
```

### Registro ejercicio cardio y pesas

```sql
Genera manualmente 95 inserts adicionales como estos:

INSERT INTO registro_ejercicio VALUES (1, 5); 
INSERT INTO registro_ejercicio VALUES (2, 13); 
INSERT INTO registro_ejercicio VALUES (3, 18); 
INSERT INTO ejercicio_cardio VALUES (1, 300, 200, 5);
INSERT INTO ejercicio_cardio VALUES (2, 420, 300, 13);
INSERT INTO ejercicio_cardio VALUES (3, 180, 150, 18);
INSERT INTO registro_ejercicio VALUES(51, 1); 
INSERT INTO registro_ejercicio VALUES(52, 2); 
INSERT INTO registro_ejercicio VALUES(53, 3); 
INSERT INTO ejercicio_pesas VALUES (51, 185, 10, 1);
INSERT INTO ejercicio_pesas VALUES (52, 225, 8, 2);
INSERT INTO ejercicio_pesas VALUES (53, 135, 12, 3);

Las tablas se crean de esta manera:

CREATE TABLE registro_ejercicio (
    id           INTEGER NOT NULL,
    ejercicio_id INTEGER NOT NULL
);

ALTER TABLE registro_ejercicio ADD CONSTRAINT registro_ejercicio_pk PRIMARY KEY ( id );

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

ALTER TABLE registro_ejercicio
    ADD CONSTRAINT registro_ejercicio_e_fk FOREIGN KEY ( ejercicio_id )
        REFERENCES ejercicio ( id );

ALTER TABLE ejercicio_cardio
    ADD CONSTRAINT ejercicio_cardio_re_fk FOREIGN KEY ( id )
        REFERENCES registro_ejercicio ( id );

ALTER TABLE ejercicio_pesas
    ADD CONSTRAINT ejercicio_pesas_re_fk FOREIGN KEY ( id )
        REFERENCES registro_ejercicio ( id );

Registro ejercicio es el supertipo. Ejercicio cardio y ejercicio pesas son los subtipos. El id de ejercicio va hasta 50
```

### Historial Ejercicios

```sql
Genera manualmente 45 inserts como estos:

INSERT INTO historial_ejercicios VALUES (TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Y', 1, 1, 1);
INSERT INTO historial_ejercicios VALUES (TO_DATE('2023-02-15', 'YYYY-MM-DD'), 'N', 2, 1, 2);
INSERT INTO historial_ejercicios VALUES (TO_DATE('2023-03-10', 'YYYY-MM-DD'), 'N', 3, 2, 3);
INSERT INTO historial_ejercicios VALUES (TO_DATE('2023-04-05', 'YYYY-MM-DD'), 'Y', 4, 2, 4);
INSERT INTO historial_ejercicios VALUES (TO_DATE('2023-05-20', 'YYYY-MM-DD'), 'N', 5, 3, 5);

La tabla se crea de esta manera:

CREATE TABLE historial_ejercicios (
    fecha                 DATE NOT NULL,
    record_personal       CHAR(1),
    registro_ejercicio_id INTEGER NOT NULL,
    rutina_id             INTEGER NOT NULL,
    cliente_id            INTEGER NOT NULL
);

ALTER TABLE historial_ejercicios
    ADD CONSTRAINT historial_ejercicios_c_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( id );

ALTER TABLE historial_ejercicios
    ADD CONSTRAINT historial_ejercicios_r_fk FOREIGN KEY ( rutina_id )
        REFERENCES rutina ( id );

ALTER TABLE historial_ejercicios
    ADD CONSTRAINT historial_ejercicios_re_fk FOREIGN KEY ( registro_ejercicio_id )
        REFERENCES registro_ejercicio ( id );

El id de cliente va hasta 50, el id de rutina va hasta 50, el id de registro ejercicio va hasta 100 
```