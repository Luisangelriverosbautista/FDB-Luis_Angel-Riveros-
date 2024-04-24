create database animeresena;

use animeresena;

CREATE TABLE IF NOT EXISTS animes(
    ID_ANIMES INT NOT NULL AUTO_INCREMENT,
    TITULO VARCHAR(50),
    DIRECTOR VARCHAR(25),
    GENERO CHAR(15),
    DURACION CHAR(5),
    SINOPSIS VARCHAR(500),
    PRIMARY KEY (ID_ANIMES)
); 
CREATE TABLE IF NOT EXISTS Usuarios(
    ID_USUARIO VARCHAR(20) NOT NULL,
    NombreUsuario VARCHAR(50) NOT NULL,
    CORREO_ELECTRONICO VARCHAR(50) NOT NULL,
    CONTRASEÑA VARCHAR(16) NOT NULL,
    FECHA_DE_REGISTRO CHAR(8) NOT NULL,
    PRIMARY KEY (ID_USUARIO)
);

CREATE TABLE IF NOT EXISTS Resenas(
    ID_RESENAS INT NOT NULL AUTO_INCREMENT,
    ID_USUARIO VARCHAR(20) NOT NULL,
    ID_ANIMES INT NOT NULL,
    TEXTO VARCHAR(255) NOT NULL,
    FECHA CHAR(8) NOT NULL,
    PRIMARY KEY (ID_RESENAS),
    FOREIGN KEY (ID_USUARIO) REFERENCES Usuarios(ID_USUARIO) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ID_ANIMES) REFERENCES Animes(ID_ANIMES) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Calificaciones(
    ID_CALIFICACIONES INT NOT NULL AUTO_INCREMENT,
    ID_USUARIO VARCHAR(20) NOT NULL,
    ID_ANIMES INT NOT NULL,
    VALOR CHAR(8) NOT NULL,
    PRIMARY KEY (ID_CALIFICACIONES),
    FOREIGN KEY (ID_USUARIO) REFERENCES Usuarios(ID_USUARIO) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ID_ANIMES) REFERENCES Animes(ID_ANIMES) ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO Animes (TITULO, DIRECTOR, GENERO, DURACION, SINOPSIS) VALUES
('Attack on Titan', 'Hajime Isayama', 'Acción', '24min', 'En un mundo donde la humanidad reside en ciudades rodeadas de enormes muros, un joven lucha contra los Titanes'),
('My Hero Academia', 'Kohei Horikoshi', 'Acción', '24min', 'Un chico sin poderes sueña con convertirse en héroe'),
('Death Note', 'Tsugumi Ohba', 'Suspenso', '23min', 'Un estudiante de secundaria encuentra un cuaderno con el que puede matar a cualquiera simplemente escribiendo su nombre'),
('Sword Art Online', 'Reki Kawahara', 'Aventura', '23min', 'Jugadores de un juego de realidad virtual están atrapados y deben completarlo para escapar'),
('Tokyo Ghoul', 'Sui Ishida', 'Terror', '24min', 'Un estudiante se convierte en mitad ghoul y debe lidiar con su nueva vida'),
('Fullmetal Alchemist: Brotherhood', 'Hiromu Arakawa', 'Aventura', '24min', 'Dos hermanos usan la alquimia para buscar la piedra filosofal');



INSERT INTO Usuarios (ID_USUARIO, NombreUsuario, CORREO_ELECTRONICO, CONTRASEÑA, FECHA_DE_REGISTRO) VALUES
('user001', 'Ana Pérez', 'anaperez@mail.com', 'password104', '20230707'),
('user002', 'Juan Díaz', 'juandiaz@mail.com', 'password105', '20230808'),
('user003', 'Sofia Martín', 'sofiamartin@mail.com', 'password789', '20230303'),
('user004', 'Carlos Ruiz', 'carlosruiz@mail.com', 'password101', '20230404'),
('user005', 'Lara Campos', 'laracampos@mail.com', 'password102', '20230505'),
('user006', 'Mateo Alonso', 'mateoalonso@mail.com', 'password103', '20230606');


INSERT INTO Resenas (ID_USUARIO, ID_ANIMES, TEXTO, FECHA) VALUES
('user003', 3, 'Impresionante concepto, te atrapa desde el principio.', '20230422'),
('user004', 4, 'Interesante pero con fallas en la trama.', '20230423'),
('user005', 5, 'Oscura y emocionante, buena animación.', '20230424'),
('user006', 6, 'Obra maestra, excelentemente bien hecha.', '20230425'),
('user001', 4, 'Al principio es interesante, pero pierde ritmo.', '20230426'),
('user002', 3, 'Buena trama pero predecible.', '20230427');

INSERT INTO Calificaciones (ID_USUARIO, ID_ANIMES, VALOR) VALUES
('user003', 3, '10/10'),
('user004', 4, '6/10'),
('user005', 5, '8/10'),
('user006', 6, '10/10'),
('user001', 5, '7/10'),
('user002', 4, '6/10'),
('user003', 1, '9/10'),
('user004', 2, '8/10');