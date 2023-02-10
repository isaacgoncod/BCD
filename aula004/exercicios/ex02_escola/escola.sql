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
  dia_semana VARCHAR(20) NOT NULL PRIMARY KEY,
  id_aluno INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(50) NOT NULL,
  grupo_muscular VARCHAR(50) NOT NULL,
  aparelho VARCHAR(50) NOT NULL,
  serie VARCHAR(50) NOT NULL,
  FOREIGN KEY (id_aluno) REFERENCES aluno(id) ON UPDATE CASCADE ON DELETE CASCADE
);