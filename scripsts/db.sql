CREATE DATABASE animeresena;

USE animeresena;

-- Tabla de Animes
CREATE TABLE IF NOT EXISTS Animes(
    ID_ANIMES INT NOT NULL AUTO_INCREMENT,
    TITULO VARCHAR(50) NOT NULL,
    DIRECTOR_ID INT NOT NULL,
    GENERO_ID INT NOT NULL,
    DURACION CHAR(5) NOT NULL,
    SINOPSIS VARCHAR(500) NOT NULL,
    PRIMARY KEY (ID_ANIMES)
);

-- Tabla de Directores
CREATE TABLE IF NOT EXISTS Directores(
    ID_DIRECTOR INT NOT NULL AUTO_INCREMENT,
    NOMBRE VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID_DIRECTOR)
);

-- Tabla de Generos
CREATE TABLE IF NOT EXISTS Generos(
    ID_GENERO INT NOT NULL AUTO_INCREMENT,
    GENERO CHAR(15) NOT NULL,
    PRIMARY KEY (ID_GENERO)
);

-- Tabla de Usuarios
CREATE TABLE IF NOT EXISTS Usuarios(
    ID_USUARIO VARCHAR(20) NOT NULL,
    NombreUsuario VARCHAR(50) NOT NULL,
    CORREO_ELECTRONICO VARCHAR(50) NOT NULL,
    PASSWORD VARCHAR(16) NOT NULL,
    FECHA_DE_REGISTRO DATE NOT NULL,
    PRIMARY KEY (ID_USUARIO)
);

-- Tabla de Resenas
CREATE TABLE IF NOT EXISTS Resenas(
    ID_RESENAS INT NOT NULL AUTO_INCREMENT,
    ID_USUARIO VARCHAR(20) NOT NULL,
    ID_ANIMES INT NOT NULL,
    TEXTO VARCHAR(255) NOT NULL,
    FECHA DATE NOT NULL,
    PRIMARY KEY (ID_RESENAS),
    FOREIGN KEY (ID_USUARIO) REFERENCES Usuarios(ID_USUARIO) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ID_ANIMES) REFERENCES Animes(ID_ANIMES) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla de Calificaciones
CREATE TABLE IF NOT EXISTS Calificaciones(
    ID_CALIFICACIONES INT NOT NULL AUTO_INCREMENT,
    ID_USUARIO VARCHAR(20) NOT NULL,
    ID_ANIMES INT NOT NULL,
    VALOR DECIMAL(3,1) NOT NULL,
    PRIMARY KEY (ID_CALIFICACIONES),
    FOREIGN KEY (ID_USUARIO) REFERENCES Usuarios(ID_USUARIO) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ID_ANIMES) REFERENCES Animes(ID_ANIMES) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Insertar datos en la tabla de Directores
INSERT INTO Directores (NOMBRE) VALUES
('Hajime Isayama'),
('Kohei Horikoshi'),
('Tsugumi Ohba'),
('Reki Kawahara'),
('Sui Ishida'),
('Hiromu Arakawa');

-- Insertar datos en la tabla de Generos
INSERT INTO Generos (GENERO) VALUES
('Acción'),
('Suspenso'),
('Aventura'),
('Terror');

-- Insertar datos en la tabla de Animes
INSERT INTO Animes (TITULO, DIRECTOR_ID, GENERO_ID, DURACION, SINOPSIS) VALUES
('Attack on Titan', 1, 1, '24min', 'En un mundo donde la humanidad reside en ciudades rodeadas de enormes muros, un joven lucha contra los Titanes'),
('My Hero Academia', 2, 1, '24min', 'Un chico sin poderes sueña con convertirse en héroe'),
('Death Note', 3, 2, '23min', 'Un estudiante de secundaria encuentra un cuaderno con el que puede matar a cualquiera simplemente escribiendo su nombre'),
('Sword Art Online', 4, 3, '23min', 'Jugadores de un juego de realidad virtual están atrapados y deben completarlo para escapar'),
('Tokyo Ghoul', 5, 4, '24min', 'Un estudiante se convierte en mitad ghoul y debe lidiar con su nueva vida'),
('Fullmetal Alchemist: Brotherhood', 6, 3, '24min', 'Dos hermanos usan la alquimia para buscar la piedra filosofal');

-- Insertar datos en la tabla de Usuarios
INSERT INTO Usuarios (ID_USUARIO, NombreUsuario, CORREO_ELECTRONICO, PASSWORD, FECHA_DE_REGISTRO) VALUES
('user001', 'Ana Pérez', 'anaperez@mail.com', 'password104', '2023-07-07'),
('user002', 'Juan Díaz', 'juandiaz@mail.com', 'password105', '2023-08-08'),
('user003', 'Sofia Martín', 'sofiamartin@mail.com', 'password789', '2023-03-03'),
('user004', 'Carlos Ruiz', 'carlosruiz@mail.com', 'password101', '2023-04-04'),
('user005', 'Lara Campos', 'laracampos@mail.com', 'password102', '2023-05-05'),
('user006', 'Mateo Alonso', 'mateoalonso@mail.com', 'password103', '2023-06-06');

-- Insertar datos en la tabla de Resenas
INSERT INTO Resenas (ID_USUARIO, ID_ANIMES, TEXTO, FECHA) VALUES
('user003', 3, 'Impresionante concepto, te atrapa desde el principio.', '2023-04-22'),
('user004', 4, 'Interesante pero con fallas en la trama.', '2023-04-23'),
('user005', 5, 'Oscura y emocionante, buena animación.', '2023-04-24'),
('user006', 6, 'Obra maestra, excelentemente bien hecha.', '2023-04-25'),
('user001', 4, 'Al principio es interesante, pero pierde ritmo.', '2023-04-26'),
('user002', 3, 'Buena trama pero predecible.', '2023-04-27');

-- Insertar datos en la tabla de Calificaciones
INSERT INTO Calificaciones (ID_USUARIO, ID_ANIMES, VALOR) VALUES
('user003', 3, 10.0),
('user004', 4, 6.0),
('user005', 5, 8.0),
('user006', 6, 10.0),
('user001', 5, 7.0),
('user002', 4, 6.0),
('user003', 1, 9.0),
('user004', 2, 8.0);

-- Consultas de prueba
SELECT * FROM Animes;
SELECT * FROM Usuarios;
SELECT * FROM Resenas;
SELECT * FROM Calificaciones;

-- Consultas más avanzadas
SELECT r.ID_RESENAS, u.NombreUsuario, a.TITULO, r.TEXTO, r.FECHA
FROM Resenas r
JOIN Usuarios u ON r.ID_USUARIO = u.ID_USUARIO
JOIN Animes a ON r.ID_ANIMES = a.ID_ANIMES
WHERE a.TITULO = 'Death Note';

SELECT c.ID_CALIFICACIONES, u.NombreUsuario, a.TITULO, c.VALOR
FROM Calificaciones c
JOIN Usuarios u ON c.ID_USUARIO = u.ID_USUARIO
JOIN Animes a ON c.ID_ANIMES = a.ID_ANIMES
WHERE a.TITULO = 'My Hero Academia';

SELECT c.ID_CALIFICACIONES, u.NombreUsuario, a.TITULO, c.VALOR
FROM Calificaciones c
JOIN Usuarios u ON c.ID_USUARIO = u.ID_USUARIO
JOIN Animes a ON c.ID_ANIMES = a.ID_ANIMES;

SELECT a.TITULO, d.NOMBRE AS DIRECTOR, g.GENERO, a.DURACION, AVG(c.VALOR) AS CalificacionPromedio
FROM Animes a
LEFT JOIN Calificaciones c ON a.ID_ANIMES = c.ID_ANIMES
JOIN Directores d ON a.DIRECTOR_ID = d.ID_DIRECTOR
JOIN Generos g ON a.GENERO_ID = g.ID_GENERO
GROUP BY a.ID_ANIMES, a.TITULO, d.NOMBRE, g.GENERO, a.DURACION;

SELECT u.NombreUsuario, COUNT(r.ID_RESENAS) AS NumeroResenas
FROM Usuarios u
LEFT JOIN Resenas r ON u.ID_USUARIO = r.ID_USUARIO
GROUP BY u.ID_USUARIO, u.NombreUsuario;

SELECT DISTINCT a.TITULO
FROM Animes a
JOIN Calificaciones c ON a.ID_ANIMES = c.ID_ANIMES
WHERE c.VALOR > 8.0;

SELECT DISTINCT u.NombreUsuario
FROM Usuarios u
JOIN Resenas r ON u.ID_USUARIO = r.ID_USUARIO
JOIN Animes a ON r.ID_ANIMES = a.ID_ANIMES
WHERE a.GENERO_ID = (SELECT ID_GENERO FROM Generos WHERE GENERO = 'Acción');

SELECT a.TITULO, AVG(c.VALOR) AS CalificacionPromedio
FROM Animes a
JOIN Calificaciones c ON a.ID_ANIMES = c.ID_ANIMES
GROUP BY a.ID_ANIMES, a.TITULO
ORDER BY CalificacionPromedio DESC
LIMIT 1;

SELECT a.TITULO, u.NombreUsuario, r.TEXTO, r.FECHA
FROM Resenas r
JOIN Animes a ON r.ID_ANIMES = a.ID_ANIMES
JOIN Usuarios u ON r.ID_USUARIO = u.ID_USUARIO
ORDER BY r.FECHA DESC;

SELECT a.TITULO, COUNT(r.ID_RESENAS) AS NumeroResenas
FROM Animes a
JOIN Resenas r ON a.ID_ANIMES = r.ID_ANIMES
GROUP BY a.ID_ANIMES, a.TITULO
ORDER BY NumeroResenas DESC
LIMIT 1;