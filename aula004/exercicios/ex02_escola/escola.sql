DROP DATABASE IF EXISTS escola;

CREATE DATABASE escola CHARSET=UTF8 COLLATE utf8_general_ci;
USE escola;

CREATE TABLE aluno(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  nascimento DATE NOT NULL,
  sexo CHAR NOT NULL,
  peso FLOAT NOT NULL
);
CREATE TABLE telefone(
  id_aluno INT NOT NULL AUTO_INCREMENT,
  telefone VARCHAR(20) NOT NULL,
  FOREIGN KEY (id_aluno) REFERENCES aluno(id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE exercicio(
  id_aluno INT NOT NULL AUTO_INCREMENT,
  dia_semana VARCHAR(20) NOT NULL,
  descricao VARCHAR(50) NOT NULL, 
  grupo_muscular VARCHAR(50) NOT NULL,
  aparelho VARCHAR(50) NOT NULL,
  serie VARCHAR(50) NOT NULL,
  FOREIGN KEY (id_aluno) REFERENCES aluno(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO aluno VALUES
(null, "Marcos de Souza Castro", "2000-05-22", "M", 65),
(null, "Ana Oliveira Oliveira", "1990-09-23", "F", 88),
(null, "Lúcia da Silva de Souza", "1988-06-14", "F", 45.5),
(null, "Ana de Souza de Oliveira", "2002-07-13", "M", 98);

INSERT INTO telefone VALUES
(1, "(11)04023-4384"),
(1, "(19)03086-1102"),
(2, "(14)3288-8530"),
(3, "(21)74746-1126"),
(3, "(19)28260-0126"),
(4, "(14)64505-3435");

INSERT INTO exercicio VALUES
(1, "Segunda-feira", "Supino Reto", "Peito", "prancha peito reto", "4R decrescente 12 10 8 6");
