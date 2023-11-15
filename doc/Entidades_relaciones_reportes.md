## Entidades

### Entidades fundamentales

* **Cliente**: ID del cliente (entero), nombre (cadena), fecha de nacimiento (fecha), género (cadena), ciudad (cadena), peso en libras (decimal), altura en cm (entero), porcentaje de descuento (decimal), es estudiante (booleano)
* **Artículo Extra**:  ID del artículo (entero), ID del cliente (entero) nombre del artículo (cadena), precio (decimal), link de la imagen (cadena), marca (cadena), stock (entero)
	* **Suplemento:** Dosis en gramos (decimal)
	* **Accesorio:** Talla (cadena)
* **Rutina de entrenamiento:** ID de la rutina (entero), ID del cliente (entero), duración en segundos (entero), nombre (cadena), fecha de creación (fecha), dificultad (cadena)
* **Ejercicio**: ID del ejercicio (entero), nombre del ejercicio (cadena), descripción (cadena), link de la imagen (cadena), link del tutorial (cadena)
* **Grupo muscular**: ID del grupo muscular (entero), nombre del grupo muscular (cadena).
1. **Registro de Ejercicio:** ID del registro (entero), ID del ejercicio (entero).
	1. **Ejercicio de pesas:** ID del ejercicio de pesas (entero), peso_lbs (decimal), repeticiones (número)
	2. **Ejercicio de cardio:** ID del ejercicio de cardio (entero),  duración en segundos (decimal), calorías quemadas (entero) 

### Entidad débil

* **Suscripción**: ID del cliente (entero), fecha de inicio (fecha), fecha de finalización (fecha), precio base (decimal).

### Entidad secundaria

* **Historial de Ejercicios**: ID del ejercicio (entero), ID del cliente (entero), ID de la rutina (entero), fecha de registro (fecha), record personal (booleano)
* **Ejercicio por Grupo:** ID del ejercicio (entero), ID del grupo muscular (entero)

## Relaciones

### Binarias

1. **Ejercicio a GrupoMuscular: (N-N)** Dado que un grupo muscular puede ser entrenado con varios ejercicios, y que un ejercicio puede trabajar varios grupos musculares a la vez, se crea una relación de muchos a muchos entre estas 2 mediante una tabla de unión.
2. **Cliente a Suscripción (1-1):** Como un cliente solo puede tener una suscripción activa, y cada suscripción solo puede tener a un cliente asignado, se tiene una relación de 1 a 1 donde el cliente es obligatorio.
3. **Suscripción a artículo extra (1-N):** En una suscripción activa, se pueden adquirir 0 o más artículos extra.
4. **Cliente a rutina:** Un cliente puede tener varias rutinas, y una rutina solo puede ser creada por un cliente.

### Grado 3 o más

1. **Historial de Ejercicios hacia cliente, rutina y registro de ejercicio: (Ternaria)** relación ternaria que muestra en la tabla de historial de ejercicios: qué cliente, con qué rutina y qué ejercicio hizo.

### Arcos

1. **Artículo Extra:** Este puede ser un suplemento o un accesorio deportivo, donde el suplemento tiene dosis y el accesorio talla, solo puede ser uno a la vez.
2. **Registro de Ejercicio:** Un registro de ejercicio puede ser de un ejercicio de pesas o de cardio, la diferencia es que uno mide calorías quemadas y duración en segundos, mientras que el otro mide series y repeticiones.

# Reportes de interés

- Se quiere saber para un determinado ejercicio, cuál ha sido el rendimiento en un intervalo de tiempo dado.
- Se quiere consultar rutinas de entrenamiento que incluyan ejercicios para un determinado grupo muscular.
- Se quiere calcular el valor de la factura para un cliente dada su suscripción.