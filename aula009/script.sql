DROP DATABASE IF EXISTS oficina;

CREATE DATABASE oficina CHARSET = UTF8 COLLATE utf8_general_ci;

USE oficina;

CREATE TABLE
  funcionario (
    matricula INT NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
  );

CREATE TABLE
  telefone (
    matricula_func INT NOT NULL,
    numero VARCHAR(255) NOT NULL,
    FOREIGN KEY (matricula_func) REFERENCES funcionario (matricula) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE
  veiculo (
    placa VARCHAR(255) NOT NULL PRIMARY KEY,
    modelo VARCHAR(255) NOT NULL,
    marca VARCHAR(255) NOT NULL,
    ano VARCHAR(255) NOT NULL
  );

CREATE TABLE
  manutencao (
    id INT NOT NULL,
    inicio_manutencao DATE NOT NULL,
    fim_manutencao DATE NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    matricula_func INT NOT NULL,
    placa_veiculo VARCHAR(255) NOT NULL,
    FOREIGN KEY (matricula_func) REFERENCES funcionario (matricula) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (placa_veiculo) REFERENCES veiculo (placa) ON UPDATE CASCADE ON DELETE CASCADE
  );

LOAD DATA INFILE 'E:/isaac/github/BCD/aula009/csv/funcionario.csv' INTO TABLE funcionario FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/isaac/github/BCD/aula009/csv/telefone.csv' INTO TABLE telefone FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/isaac/github/BCD/aula009/csv/veiculo.csv' INTO TABLE veiculo FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/isaac/github/BCD/aula009/csv/manutencao.csv' INTO TABLE manutencao FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

SELECT
  *
FROM
  funcionario;

SELECT
  *
FROM
  telefone;

SELECT
  *
FROM
  veiculo;

SELECT
  *
FROM
  manutencao;