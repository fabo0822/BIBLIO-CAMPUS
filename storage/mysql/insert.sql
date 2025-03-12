-- Insertar datos en la tabla Libro
INSERT INTO libro (titulo, genero, isbn, disponible) VALUES
('Cien años de soledad', 'Realismo mágico', '9780307474728', 'DISPONIBLE');

-- Insertar datos en la tabla Autor
INSERT INTO autor (nombre, apellido, nacionalidad, fecha_nacimiento) VALUES
('Gabriel', 'García Márquez', 'Colombiana', '1927-03-06');



INSERT INTO librosAutor (libro_id, autor_id) VALUES
(1, 1);


INSERT INTO publicacion (libro_id, fecha_publicacion, edicion) VALUES
(1, '1967-05-30', 1);

INSERT INTO editorial (nombre) VALUES ('random house');





INSERT INTO miembro (nombre, apellido, email, telefono, fecha_registro) VALUES
('Ana', 'Gómez', 'ana.gomez@email.com', '555-1234', '2022-01-15');


INSERT INTO transaccion (libro_id, miembro_id, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real) VALUES
(1, 1, '2023-01-05', '2023-01-19', '2023-01-18');
