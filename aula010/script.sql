DROP DATABASE IF EXISTS locacao_veiculo;

CREATE DATABASE locacao_veiculo CHARSET = UTF8 COLLATE utf8_general_ci;

USE locacao_veiculo;

CREATE TABLE
  cliente (
    cpf VARCHAR(255) NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    rua VARCHAR(255) NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    uf CHAR(2) NOT NULL
  );

CREATE TABLE
  telefone (
    cliente_cpf VARCHAR(255) NOT NULL,
    numero VARCHAR(255) NOT NULL,
    FOREIGN KEY (cliente_cpf) REFERENCES cliente (cpf) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE
  veiculo (
    placa VARCHAR(255) NOT NULL PRIMARY KEY,
    modelo VARCHAR(255) NOT NULL,
    marca VARCHAR(255) NOT NULL,
    ano VARCHAR(255) NOT NULL
  );

CREATE TABLE
  aluguel (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    diaria FLOAT (5, 2) NOT NULL,
    aluguel DATE NOT NULL,
    devolucao DATE,
    valor FLOAT (5, 2),
    observacao VARCHAR(255),
    cliente_cpf VARCHAR(255) NOT NULL,
    veiculo_placa VARCHAR(255) NOT NULL,
    FOREIGN KEY (cliente_cpf) REFERENCES cliente (cpf) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (veiculo_placa) REFERENCES veiculo (placa) ON UPDATE CASCADE ON DELETE CASCADE
  );

LOAD DATA INFILE 'E:/isaac/github/BCD/aula010/csv/cliente.csv' INTO TABLE cliente FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/isaac/github/BCD/aula010/csv/telefone.csv' INTO TABLE telefone FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/isaac/github/BCD/aula010/csv/veiculo.csv' INTO TABLE veiculo FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/isaac/github/BCD/aula010/csv/aluguel.csv' INTO TABLE aluguel FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

SELECT
  *
FROM
  cliente;

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
  aluguel;