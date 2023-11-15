-- Obtener en orden de cantidad comprada, los nombres y cantidades compradas de los productos m�s demandados del gimnasio.

SELECT ae.nombre, SUM(c.cantidad) AS cantidad_comprada
FROM ARTICULO_EXTRA ae
INNER JOIN COMPRAS c ON ae.id = c.ARTICULO_EXTRA_id
GROUP BY ae.nombre
ORDER BY cantidad_comprada DESC;

-- Obtener el nombre de las rutinas de nivel intermedio y dif�cil que fueron probadas por al menos un cliente en orden alfab�tico.

SELECT r.nombre AS nombre_rutina
FROM rutina r
JOIN historial_ejercicios he ON r.id = he.rutina_id
WHERE r.dificultad IN ('Intermedia', 'Dif�cil')
GROUP BY r.id, r.nombre
HAVING COUNT(DISTINCT he.cliente_id) >= 1
ORDER BY nombre_rutina ASC;
