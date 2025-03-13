-- Insertar datos en la tabla Libro
INSERT INTO libro (titulo, genero, isbn, disponible) VALUES
('solo leveling', 'magia', '1234', TRUE),
('one piece', 'aventura', '1235', TRUE);

-- Insertar datos en la tabla Autor
INSERT INTO autor (nombre, apellido, nacionalidad, fecha_nacimiento) VALUES
('kevinho', 'morfeo', 'olimpo', '1980-04-08'),
('isabela', 'hancok', 'colombiana', '2003-05-05');



INSERT INTO librosAutor (libro_id, autor_id) VALUES
(1, 1),
(2, 2);


INSERT INTO publicacion (libro_id, fecha_publicacion, edicion) VALUES
(1, '1967-05-30', 1),
(1, '1998-05-08', 1);

INSERT INTO editorial (nombre) VALUES 
('olympus anime'),
('isanime');



INSERT INTO miembro (nombre, apellido, email, telefono, fecha_registro) VALUES
('fabian', 'ortega', 'fabo1936@email.com', '3173203118', '2022-01-15'),
('joiner', 'alexis', 'alexis123@gmail.com', '3243243242','2023-01-16');



INSERT INTO transaccion (libro_id, miembro_id, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real) VALUES
(1, 1, '2023-01-05', '2023-01-19', '2023-01-18'),
(2, 2, '2023-05-02','2023-05-19', '2023-05-17');


