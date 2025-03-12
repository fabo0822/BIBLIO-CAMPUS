CREATE DATABASE IF NOT EXISTS bibliotecaCampus;

use bibliotecaCampus;

CREATE TABLE libro(
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    genero VARCHAR(20),
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    disponible VARCHAR(20) NOT NULL
    
);

CREATE TABLE autor(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    nacionalidad VARCHAR (20),
    fecha_nacimiento DATE
);

CREATE TABLE librosAutor(
    id INT PRIMARY KEY AUTO_INCREMENT,
    libro_id INT,
    autor_id INT,
    FOREIGN KEY (libro_id) REFERENCES libro(id),
    FOREIGN KEY (autor_id) REFERENCES autor (id)
);

CREATE TABLE editorial(
    id INT PRIMARY key AUTO_INCREMENT,
    nombre VARCHAR(50)  NOT NULL
);

CREATE TABLE publicacion(
    id INT PRIMARY KEY AUTO_INCREMENT,
    libro_id INT,
    editorial_id INT,
    fecha_publicacion DATE NOT NULL,
    edicion int  NOT NULL,
    FOREIGN KEY (libro_id) REFERENCES libro(id),
    FOREIGN key (editorial_id) REFERENCES editorial(id)
);

CREATE TABLE miembro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(59) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    fecha_registro DATE NOT NULL
);

CREATE TABLE transaccion(
    id INT PRIMARY KEY AUTO_INCREMENT,
    libro_id INT,
    miembro_id INT,
    fecha_prestamo DATE,
    fecha_devolucion_esperada DATE,
    fecha_devolucion_real DATE,
    FOREIGN KEY (libro_id) REFERENCES libro(id),
    FOREIGN KEY (miembro_id) REFERENCES miembro(id)
);