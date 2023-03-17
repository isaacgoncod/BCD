DROP DATABASE IF EXISTS estacionamento;

CREATE DATABASE estacionamento CHARSET = UTF8 COLLATE utf8_general_ci;

USE estacionamento;

CREATE TABLE
  veiculo (
    placa VARCHAR(255) NOT NULL PRIMARY KEY,
    modelo VARCHAR(255) NOT NULL,
    marca VARCHAR(255) NOT NULL,
    cor VARCHAR(255) NOT NULL
  );

CREATE TABLE
  cliente (
    cpf VARCHAR(255) NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    rua VARCHAR(255) NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    uf VARCHAR(255) NOT NULL,
    veiculo_placa VARCHAR(255) NOT NULL,
    FOREIGN KEY (veiculo_placa) REFERENCES veiculo (placa) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE
  telefone (
    cpf_cliente VARCHAR(255) NOT NULL,
    numero VARCHAR(255) NOT NULL,
    FOREIGN KEY (cpf_cliente) REFERENCES cliente (cpf) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE
  vaga (
    id INT NOT NULL PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor FLOAT (5, 2) NOT NULL
  );

CREATE TABLE
  estacionamento (
    id INT NOT NULL PRIMARY KEY,
    entrada DATETIME NOT NULL,
    saida DATETIME NOT NULL,
    valor FLOAT (5, 2) NOT NULL,
    cliente_cpf VARCHAR(255) NOT NULL,
    vaga_id INT NOT NULL,
    FOREIGN KEY (cliente_cpf) REFERENCES cliente (cpf) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (vaga_id) REFERENCES vaga (id) ON UPDATE CASCADE ON DELETE CASCADE
  );

LOAD DATA INFILE 'E:/isaac/github/BCD/aula008/csv2/veiculo.csv' INTO TABLE veiculo FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/isaac/github/BCD/aula008/csv2/cliente.csv' INTO TABLE cliente FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/isaac/github/BCD/aula008/csv2/telefone.csv' INTO TABLE telefone FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/isaac/github/BCD/aula008/csv2/vaga.csv' INTO TABLE vaga FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/isaac/github/BCD/aula008/csv2/estacionamento.csv' INTO TABLE estacionamento FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

SELECT
  *
FROM
  veiculo;

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
  vaga;

SELECT
  *
FROM
  estacionamento;

CREATE VIEW
  vw_cliente AS
SELECT
  c.cpf,
  c.nome,
  c.bairro,
  c.cidade,
  c.uf,
  t.numero as telefone
FROM
  cliente c
  LEFT JOIN telefone t ON c.cpf = t.cpf_cliente;




