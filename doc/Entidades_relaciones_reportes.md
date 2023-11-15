## Entidades

### Entidades fundamentales

* **Cliente**: ID del cliente (entero), nombre (cadena), fecha de nacimiento (fecha), género (cadena), ciudad (cadena), peso en libras (decimal), altura en cm (entero), porcentaje de descuento (decimal), es estudiante (booleano)
* **Artículo Extra**:  ID del artículo (entero), ID del cliente (entero) nombre del artículo (cadena), precio (decimal), link de la imagen (cadena), marca (cadena), stock (entero)
	* **Suplemento:** Dosis en gramos (decimal)
	* **Accesorio:** Talla (cadena)
* **Rutina de entrenamiento:** ID de la rutina (entero), ID del cliente (entero), duración en segundos (entero), nombre (cadena), fecha de creación (fecha), dificultad (cadena)
* **Ejercicio**: ID del ejercicio (entero), nombre del ejercicio (cadena), descripción (cadena), link de la imagen (cadena), link del tutorial (cadena)
* **Grupo muscular**: ID del grupo muscular (entero), nombre del grupo muscular (cadena).
* **Registro de Ejercicio:** ID del registro (entero), ID del ejercicio (entero).
	* **Ejercicio de pesas:** ID del ejercicio de pesas (entero), peso_lbs (decimal), repeticiones (número)
	* **Ejercicio de cardio:** ID del ejercicio de cardio (entero),  duración en segundos (decimal), calorías quemadas (entero) 

### Entidad débil

* **Suscripción**: ID del cliente (entero), fecha de inicio (fecha), fecha de finalización (fecha), precio base (decimal).

### Entidad secundaria

* **Historial de Ejercicios**: ID del ejercicio (entero), ID del cliente (entero), ID de la rutina (entero), fecha de registro (fecha), record personal (booleano)
* **Ejercicio por Grupo:** ID del ejercicio (entero), ID del grupo muscular (entero)

## Relaciones

### Binarias

1. **Compras a Artículo Extra (N-N):** Una compra puede contener varios artículos extras, y un artículo extra puede estar presente en varias compras.

2. **Compras a Cliente (N-1):** Muchas compras pueden estar asociadas a un cliente, pero un cliente tiene muchas compras.

3. **Ejercicio de Cardio a Registro de Ejercicio (1-1):** Un registro de ejercicio puede ser referente a uno de cardio.

4. **Ejercicio de Pesas a Registro de Ejercicio (1-1):** Un registro de ejercicio puede ser referente a uno de pesas.

5. **Ejercicio por Grupo a Ejercicio (N-1):** Muchos ejercicios pueden estar asociados a un grupo muscular, pero un ejercicio pertenece a un solo grupo muscular.

6. **Ejercicio por Grupo a Grupo Muscular (N-1):** Muchos ejercicios pueden estar asociados a un grupo muscular, pero un grupo muscular puede tener muchos ejercicios.

7. **Registro de ejercicio a Ejercicio (N-1):** Muchos registros de ejercicio pueden estar asociados a un ejercicio, pero un ejercicio puede tener muchos registros de ejercicio.

8. **Rutina a Cliente (N-1):** Muchas rutinas pueden estar asociadas a un cliente, pero un cliente tiene muchas rutinas.

9. **Suplemento a Artículo Extra (1-1):** Un artículo extra puede ser un suplemento.

10. **Accesorio Deportivo a Artículo Extra (1-N):** Un artículo extra puede ser un accesorio deportivo.

11. **Suscripción a Cliente (1-1):** Solo una suscripción puede estar asociada a un cliente y viceversa.

### Grado 3 o más

1. **Historial de Ejercicios hacia cliente, rutina y registro de ejercicio (Ternaria):** Relación ternaria que muestra en la tabla de historial de ejercicios qué cliente, con qué rutina y qué ejercicio se hizo en diversas fechas.

### Relación con atributos

1. **Cliente a historial de ejercicios**: Se desea que al registrar un nuevo historial se sepa si este fue un nuevo record de parte del cliente o no. Es por esto que tras añadir este atributo, terminó siendo parte de la tabla del historial.

### Arcos

1. **Artículo Extra:** Este puede ser un suplemento o un accesorio deportivo, donde el suplemento tiene dosis y el accesorio talla, solo puede ser uno a la vez.
2. **Registro de Ejercicio:** Un registro de ejercicio puede ser de un ejercicio de pesas o de cardio, la diferencia es que uno mide calorías quemadas y duración en segundos, mientras que el otro mide series y repeticiones.

# Reportes de interés

- Obtener en orden de cantidad comprada, los nombres y cantidades compradas de los productos más demandados del gimnasio.
- Obtener el nombre de las rutinas de nivel intermedio y difícil que fueron probadas por al menos un cliente en orden alfabético.
- Obtener el nombre, peso y altura de los 15 clientes que más records personales han hecho desde marzo de 2023 (si no ha roto ningun record, llenar con 0).
- Seleccionar el nombre de los grupos musculares preferidos para entrenar en el gimnasio, que hayan sido entrenados por al menos un cliente.