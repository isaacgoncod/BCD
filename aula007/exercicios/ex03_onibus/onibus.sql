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
    descricao_linha VARCHAR(255) NOT NULL
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

-- DML (importação de dados  Windows)
LOAD DATA INFILE 'C:/isaac/github/BCD/aula007/exercicios/ex03_onibus/csv/motorista.csv' INTO TABLE motorista FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/isaac/github/BCD/aula007/exercicios/ex03_onibus/csv/telefone.csv' INTO TABLE telefone FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/isaac/github/BCD/aula007/exercicios/ex03_onibus/csv/linha.csv' INTO TABLE linha FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/isaac/github/BCD/aula007/exercicios/ex03_onibus/csv/dirige.csv' INTO TABLE dirige FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/isaac/github/BCD/aula007/exercicios/ex03_onibus/csv/horario.csv' INTO TABLE linha_horario FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

INSERT INTO
  motorista VALUE (6, "435.789.546-80", "Isaac Gonçalves");

SELECT
  *
FROM
  motorista
  LEFT JOIN telefone ON id = telefone.id_motorista;

SELECT
  m.nome,
  d.id_linha
FROM
  motorista m
  INNER JOIN dirige d ON m.id = d.id_motorista;

SELECT
  m.nome,
  d.id_linha
FROM
  motorista m
  LEFT JOIN dirige d ON m.id = d.id_motorista;

INSERT INTO
  linha VALUE ("linha6", "Pedreira x Arcadas");

SELECT
  m.nome,
  l.id
FROM
  motorista m
  JOIN dirige d ON m.id = d.id_motorista
  RIGHT JOIN linha l ON d.id_linha = l.id;

CREATE VIEW
  vw_motorista_linha AS
SELECT
  m.nome,
  d.id_linha
FROM
  motorista m
  LEFT JOIN dirige d ON m.id = d.id_motorista
UNION
SELECT
  m.nome,
  l.id
FROM
  motorista m
  JOIN dirige d ON m.id = d.id_motorista
  RIGHT JOIN linha l ON d.id_linha = l.id;

INSERT INTO
  dirige VALUE (6, "linha6");