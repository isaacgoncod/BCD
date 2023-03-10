DROP DATABASE IF EXISTS onibus;

CREATE DATABASE onibus CHARSET = UTF8 COLLATE utf8_general_ci;

USE onibus;

CREATE TABLE
  motorista (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cpf VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL
  );

CREATE TABLE
  telefone (
    id_motorista INT NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_motorista) REFERENCES motorista (id) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE
  linha (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    descricao_linha VARCHAR(255) NOT NULL,
  );

CREATE TABLE
  dirige (
    id_motorista INT NOT NULL,
    id_linha VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_motorista) REFERENCES motorista (id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_linha) REFERENCES linha (id) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE
  linha_horario (
    id_linha VARCHAR(255) NOT NULL,
    horario_partida VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_linha) REFERENCES linha (id) ON UPDATE CASCADE ON DELETE CASCADE
  );