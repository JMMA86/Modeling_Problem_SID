## Enunciado del problema

Recientemente, el gimnasio X ha tenido problemas con la gestión de sus clientes y suscripciones, pues hasta el momento llevaba el registro de los clientes y sus cuentas en papel, lo que hacía del proceso de entrada y salida algo muy ineficiente. Por otro lado, debido al aumento de clientes de las últimas semanas, el personal que se tiene contratado (entrenadores) no pueden atender correctamente a los clientes, ya que las rutinas que se asignan son confusas y no se les hace el seguimiento adecuado, lo que está llevando a quejas por parte de los usuarios.

Ante esto, se ha propuesto una solución de software que consta de una plataforma para gestionar los servicios del gimnasio X, de modo que el personal del gimnasio no pierda tiempo con las actividades de registro y seguimiento, y que los usuarios puedan conocer en cualquier momento el estado de sus suscripciones, sus compras en el establecimiento y su progreso en el gimnasio.

En este caso, el análisis se va a enfocar únicamente en la parte del usuario del gimnasio, es decir, el cliente, del cual se registrará un identificador único, el nombre, fecha de nacimiento, género, ciudad, peso en libras, altura en cm. Además, se registra si es estudiante y su respectivo porcentaje de descuento.

Un usuario puede adquirir servicios o artículos adicionales, de los que se registrará un identificador único, el nombre del artículo, precio en dólares, link de la imagen, la marca y las unidades disponibles o stock. Los artículos extra pueden ser suplementos o accesorios, de los suplementos se guarda la dosis en gramos y de los accesorios la talla.

Cuando un usuario adquiere un artículo extra, esta compra se guarda en un historial que incluye un identificador de la compra realizada, el identificador del cliente que adquirió el artículo, el identificador del artículo extra, la cantidad comprada.

Cada usuario tiene una suscripción al gimnasio, un usuario solo puede tener una suscipción activa y cada suscripción pertenece solo a un usuario. De la suscripción se guarda el identificador del cliente asociado, la fecha de inicio, la fecha de finalización y el precio base.

Los clientes pueden crear sus propias rutinas, estas son públicas para todo el gimnasio. De las rutinas se registra un identificador único, la duración final en segundos, el nombre de la rutina, la fecha de creación y la dificultad (Fácil, Intermedia, Difícil o Avanzada).

Para el entrenamiento de los usuarios se tiene un banco de ejercicios enfocados en distintos grupos musculares. Un ejercicio puede trabajar varios grupos musculares y un grupo muscular puede ser trabajado por varios ejercicios. De los ejercicios se guarda un identificador único, el nombre del ejercicio, la descripción, el link de la imagen asignada y el link del tutorial en video. De los grupos musculares se guarda un identificador único y el nombre del grupo muscular.

Se pretende llevar un registro de ejercicios, que es importante para que los usuarios puedan medir su progreso en cada uno. Por ello, cuando un cliente realiza un ejercicio se registra un identificador único para el registro y el identificador del ejercicio. Estos pueden ser de pesas o de cardio, de los primeros se registra el peso levantado en libras y el número de repeticiones realizadas, de los segundos la duración en segundos y las calorías quemadas. Los registros de ejercicio se guardan en un historial que incluye el identificador del cliente, del registro de ejercicio y de la rutina realizada.  De este modo, el cliente puede medir su progreso a lo largo del tiempo. 