create database animeresena;
CREATE TABLE IF NOT EXISTS animeresena.animes(
ID_ANIMES int not null auto_increment,
TITULO VARCHAR(50),
DIRECTOR VARCHAR(25),
GENERO CHAR(15),
DURACION CHAR(5),
SINOPSIS VARCHAR(100),
primary key(ID_ANIMES)
);
CREATE TABLE IF NOT EXISTS animeresena.Usuarios(
ID_USUARIO varchar(20)not null,
NombreUsuario VARCHAR(50) not null,
CORREO_ELECTRONICO VARCHAR(50)not null,
CONTRASEÑA VARCHAR(16) not null,
FECHA_DE_REGISTRO CHAR(8) not null,

primary key(ID_USUARIO)
);
CREATE TABLE IF NOT EXISTS animeresena.Resenas(
ID_RESENAS int not null auto_increment,
ID_USUARIOS varchar(20)not null,
ID_ANIMES int not null,
TEXTO VARCHAR(16) not null,
FECHA CHAR(8) not null,

primary key(ID_RESENAS)
);
CREATE TABLE IF NOT EXISTS animeresena.Calificaciones(
ID_CALIFICACIONES int not null auto_increment,
ID_USUARIOS varchar(20)not null,
ID_ANIMES int not null,
VALOR CHAR(8) not null,

primary key(ID_CALIFICACIONES)
);

alter table animeresena.Resenas add foreign key (ID_USUARIO) references animeresena.usuarios(ID_RESENAS) ON UPDATE CASCADE  ON DELETE CASCADE;

alter table animeresena.Usuarios add foreign key (ID_CALIFICACIONES) references animeresena.Calificaciones(ID_CALIFICACIONES) ON UPDATE CASCADE  ON DELETE CASCADE;

alter table animeresena.animes add foreign key (ID_RESENAS) references animeresena.Resenas(ID_RESENAS) ON UPDATE CASCADE  ON DELETE CASCADE;

alter table animeresena.animes add foreign key (ID_CALIFICACIONES) references animeresena.Calificaciones(ID_CALIFICACIONES) ON UPDATE CASCADE  ON DELETE CASCADE;