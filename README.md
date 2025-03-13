# Consultas SQL para bibliotecaCampus

## Listar todos los libros disponibles
```sql
SELECT * FROM libro WHERE disponible = TRUE ;
```

## Buscar libros por género
```sql
SELECT * FROM libro WHERE genero = 'magia';
```

## Obtener información de un libro por ISBN
```sql
SELECT * FROM libro WHERE ISBN = '1235';
```

## Contar el número de libros en la biblioteca
```sql
SELECT COUNT(*) AS total_libros FROM libro;
```

## Listar todos los autores
```sql
SELECT * FROM autor ORDER BY apellido, nombre;
```

## Buscar autores por nombre
```sql
SELECT * FROM autor WHERE nombre LIKE '%kevinho%' OR apellido LIKE '%morfeo%';
```

## Obtener todos los libros de un autor específico
```sql
SELECT l.id, l.titulo, l.genero, l.isbn, l.disponible
FROM libro l
JOIN librosAutor la ON l.id = la.id
JOIN autor a ON la.id = a.id
WHERE a.nombre = 'isabela' AND a.apellido = 'hancok';
```

## Listar todas las ediciones de un libro
```sql
SELECT p.id,  p.fecha_publicacion, p.edicion
FROM publicacion p
JOIN libro l ON p.id = l.id
WHERE l.titulo = 'solo leveling'
ORDER BY p.edicion;
```

## Obtener la última edición de un libro
```sql
SELECT p.id, p.fecha_publicacion, p.edicion
FROM publicacion p
JOIN libro l ON p.id = l.id
WHERE l.titulo = 'one piece'
ORDER BY p.edicion DESC
LIMIT 1;
```

## Contar cuántas ediciones hay de un libro específico
```sql
SELECT COUNT(*) AS total_ediciones
FROM publicacion p
JOIN libro l ON p.id = l.id
WHERE l.titulo = 'one piece';
```

## Listar todas las transacciones de préstamo
```sql
SELECT t.id, l.titulo, CONCAT(m.nombre, ' ', m.apellido) AS miembro,
       t.fecha_prestamo, t.fecha_devolucion_esperada, t.fecha_devolucion_real
FROM transaccion t
JOIN libro l ON t.id = l.id
JOIN miembro m ON t.id = m.id
ORDER BY t.fecha_prestamo DESC;
```

## Obtener los libros prestados actualmente
```sql
SELECT l.id, l.titulo, l.isbn, CONCAT(m.nombre, ' ', m.apellido) AS miembro,
       t.fecha_prestamo, t.fecha_devolucion_esperada
FROM transaccion t
JOIN libro l ON t.id = l.id
JOIN miembro m ON t.id = m.id
WHERE t.fecha_devolucion_real IS NULL;
```

## Contar el número de transacciones de un miembro específico
```sql
SELECT COUNT(*) AS total_transacciones
FROM transaccion
WHERE id = (SELECT id FROM miembro WHERE nombre = 'fabian' AND apellido = 'ortega');
```

## Listar todos los miembros de la biblioteca
```sql
SELECT * FROM miembro ORDER BY apellido, nombre;
```

## Buscar un miembro por nombre
```sql
SELECT * FROM miembro WHERE nombre LIKE '%fabian%' OR apellido LIKE '%ortega%';
```

## Obtener las transacciones de un miembro específico
```sql
SELECT t.id, l.titulo, t.fecha_prestamo, t.fecha_devolucion_esperada, t.fecha_devolucion_real
FROM transaccion t
JOIN libro l ON t.id = l.id
WHERE t.id = (SELECT id FROM miembro WHERE nombre = 'fabian' AND apellido = 'ortega')
ORDER BY t.fecha_prestamo DESC;
```

## Listar todos los libros y sus autores
```sql
SELECT l.id, l.titulo, l.genero, l.isbn, 
       CONCAT(a.nombre, ' ', a.apellido) AS autor
FROM libro l
JOIN librosAutor la ON l.id = la.id
JOIN autor a ON la.id = a.id
ORDER BY l.titulo, a.apellido;
```

## Obtener el historial de préstamos de un libro específico
```sql
SELECT t.id, CONCAT(m.nombre, ' ', m.apellido) AS miembro,
       t.fecha_prestamo, t.fecha_devolucion_esperada, t.fecha_devolucion_real
FROM transaccion t
JOIN miembro m ON t.id = m.id
WHERE t.id = (SELECT id FROM libro WHERE titulo = 'solo leveling')
ORDER BY t.fecha_prestamo DESC;
```

## Contar cuántos libros han sido prestados en total
```sql
SELECT COUNT(DISTINCT libro_id) AS total_libros_prestados FROM transaccion;
```

## Listar todos los libros junto con su última edición y estado de disponibilidad
```sql
SELECT l.id, l.titulo, l.genero, l.isbn, l.disponible,
        p.fecha_publicacion, p.edicion
FROM libro l
LEFT JOIN (
    SELECT p1.id,  p1.fecha_publicacion, p1.edicion
    FROM publicacion p1
    INNER JOIN (
        SELECT id, MAX(edicion) AS max_edicion
        FROM publicacion
        GROUP BY id
    ) p2 ON p1.id = p2.id AND p1.edicion = p2.max_edicion
) p ON l.id = p.id
ORDER BY l.titulo;
```