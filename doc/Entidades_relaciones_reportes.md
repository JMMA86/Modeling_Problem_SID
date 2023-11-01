# Entidades fundamentales


* **Artículo Extra**:  ID del artículo (número), nombre del artículo (cadena), precio (número)
	* **Plan de Entrenamiento**: atributos - duración (número en semanas), objetivo (cadena)
	* **Mercancía:** marca (cadena) 
		* **Suplemento:** Cantidad (número)
		* **Accesorio:** Talla (cadena)
* **Cliente**: atributos - ID del cliente (número), nombre (cadena), fecha de nacimiento (fecha), género (cadena).
	* **Estudiante:** institución (cadena), porcentaje de descuento (decimal)
* **Rutina de entrenamiento:** atributos - ID de la rutina (número), duración (número), nombre (cadena), 
* **Ejercicio**: atributos - ID del ejercicio (número), nombre del ejercicio (cadena), descripción (cadena).
* **Ejercicio de cardio:** id_cardio, duración (decimal) 
* **Ejercicio de pesas:** id_pesas, repeticiones (número)

## Entidad débil

* **Suscripción**: atributos - ID de cliente (número), fecha de inicio (fecha), fecha de finalización (fecha), precio base (número). Esta entidad es débil ya que depende del cliente. 

**Entidad secundaria (dominio)**:

* **Grupo muscular**: atributos - ID del grupo muscular (número), nombre del grupo muscular (cadena).
* **Historial de Ejercicios**: atributos - ID del ejercicio (número), ID del cliente, ID de la rutina (número), peso levantado (número)

## Relaciones

* **Cliente-Plan de Entrenamiento:** relación binaria con cardinalidad N…N, un cliente puede tener varios planes de entrenamiento y un plan de entrenamiento puede ser asignado a varios clientes.
* **Plan de Entrenamiento-Ejercicio:** relación binaria con cardinalidad 1…N, un plan de entrenamiento puede tener varios ejercicios pero un ejercicio pertenece a un solo plan de entrenamiento.
* **Cliente-Rutina-Historial de Ejercicios:** relación ternaria que muestra en un ejercicio registrado, que cliente lo hizo y qué rutina se encontraba haciendo.

**Supertipo y subtipos**: Los clientes y artículos tienen atributos adicionales según los subtipos.

**Arco**: En el historial de ejercicios, se puede tener una relación de exclusión entre los que se basan en repeticiones y los que se miden por duración en segundos.

## Reportes de interés

- Se quiere saber para un determinado ejercicio, cuál ha sido el rendimiento en un intervalo de tiempo dado.
- Se quiere consultar rutinas de entrenamiento que incluyan ejercicios para un determinado grupo muscular.
- Se quiere calcular el valor de la factura para un cliente dada su suscripción.