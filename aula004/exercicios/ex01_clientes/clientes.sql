DROP DATABASE IF EXISTS clientes;

CREATE DATABASE clientes CHARSET=UTF8 COLLATE utf8_general_ci;
USE clientes;

CREATE TABLE cliente(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  nascimento DATE NOT NULL,
  sexo CHAR NOT NULL,
  peso FLOAT NOT NULL
);
CREATE TABLE telefone(
  id_cliente INT NOT NULL AUTO_INCREMENT,
  telefone VARCHAR(20) NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO cliente VALUES 
(null, "Ana de Souza de Oliveira", "2000-05-22", "F", 65), 
(null, "Ana Oliveira", "1990-08-23", "F", 88),
(null, "Lúcia da Silva de Souza", "1988-06-14", "F", 45.5),
(null, "Marcos de Souza Castro", "2002-07-13", "M", 98),
(null, "Maria Oliveira Castro", "2005-08-14", "F", 101),  
(null, "Jurema de Souza Castro", "2007-06-15", "F", 80);

INSERT INTO telefone VALUES
(1, "(11)4023-4384"),
(1, "(14)3288-8530"),
(2, "(21)74746-1126"),
(2, "(14)64505-3435"),
(2, "(19)03086-1102"),
(3, "(14)64500-3435"),
(4, "(19)28260-0126"),
(5, "(21)34757-1544"),
(6, "(19)3030-4465"),
(6, "(19)93030-4460");
