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
WHERE r.dificultad IN ('Intermedia', 'Difícil')
GROUP BY r.id, r.nombre
HAVING COUNT(DISTINCT he.cliente_id) >= 1
ORDER BY nombre_rutina ASC;

-- Obtener el nombre, peso y altura de los 15 clientes que más records personales han hecho desde marzo de 2023 (si no ha roto ningun record, llenar con 0)

SELECT * FROM (
    SELECT c.nombre, c.peso_lb, c.altura_cm, COALESCE(h.cnt, 0) AS cnt
    FROM cliente c
    LEFT JOIN (
        SELECT cliente_id, COUNT(cliente_id) AS cnt
        FROM historial_ejercicios
        WHERE record_personal = 'Y' AND fecha >= to_date('2023-03-01', 'YYYY-MM-DD')
        GROUP BY cliente_id
    ) h ON h.cliente_id = c.id
    ORDER BY COALESCE(h.cnt, 0) DESC
) WHERE ROWNUM <= 15;


-- Seleccionar el nombre de los grupos musculares preferidos para entrenar en el gimnasio, que hayan sido entrenados por al menos un cliente

SELECT m.nombre, COUNT(m.nombre) AS cnt
FROM registro_ejercicio r
INNER JOIN ejercicio_por_grupo g
ON g.ejercicio_id = r.ejercicio_id
INNER JOIN grupo_muscular m
ON g.grupo_muscular_id = m.id
GROUP BY m.nombre
ORDER BY cnt DESC;
