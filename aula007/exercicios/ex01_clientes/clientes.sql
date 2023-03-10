DROP DATABASE IF EXISTS cliente;

CREATE DATABASE cliente CHARSET = UTF8 COLLATE utf8_general_ci;

USE cliente;

CREATE TABLE
  cliente (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    nascimento DATE NOT NULL,
    sexo CHAR NOT NULL,
    peso FLOAT (5, 2) NOT NULL
  );

CREATE TABLE
  telefone (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    telefone VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id) ON UPDATE CASCADE ON DELETE CASCADE
  );

INSERT INTO
  cliente
VALUES
  (
    null,
    "Ana de Souza de Oliveira",
    "2000-05-22",
    "F",
    65
  ),
  (null, "Ana Oliveira", "1990-08-23", "F", 88),
  (
    null,
    "Lúcia da Silva de Souza",
    "1988-06-14",
    "F",
    45.5
  ),
  (
    null,
    "Marcos de Souza Castro",
    "2002-07-13",
    "M",
    98
  ),
  (
    null,
    "Maria Oliveira Castro",
    "2005-08-14",
    "F",
    101
  ),
  (
    null,
    "Jurema de Souza Castro",
    "2007-06-15",
    "F",
    80
  );

INSERT INTO
  telefone
VALUES
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
  cliente
  JOIN telefone;

SELECT
  *
FROM
  cliente
  JOIN telefone ON cliente.id = telefone.id_cliente;

SELECT
  *
FROM
  cliente
  LEFT JOIN telefone ON cliente.id = telefone.id_cliente;

SELECT
  cliente.id,
  cliente.nome,
  cliente.nascimento,
  cliente.sexo,
  cliente.peso,
  telefone.telefone
FROM
  cliente
  LEFT JOIN telefone ON cliente.id = telefone.id_cliente;

-- Criando um relatório salvando a consulta em uma "VIEW"
CREATE VIEW
  vw_clientes AS
SELECT
  c.id,
  c.nome,
  c.nascimento,
  c.sexo,
  c.peso,
  t.telefone
FROM
  cliente c
  LEFT JOIN telefone t ON c.id = t.id_cliente;

SHOW TABLES;

-- Ver o relatório com todos os dados
SELECT
  *
FROM
  vw_clientes;

-- Ver o relatório com somente os 5 primeiros
SELECT
  *
FROM
  vw_clientes
LIMIT
  5;

-- Ver o relatório intervalo do 5 ao 10
SELECT
  *
FROM
  vw_clientes
LIMIT
  5, 10;

-- Ver os três ultimos resultados
SELECT
  *
FROM
  vw_clientes
ORDER BY
  id DESC
LIMIT
  3;

-- Criando um índice que melhora o desempenho de consultas
CREATE INDEX i_nome ON cliente (nome);

-- O desempenho de consutas exatas é melhorado pelo índice
SELECT
  *
FROM
  vw_clientes
WHERE
  nome = 'Marcos de Souza Castro';

-- Consulta aproximada
-- Iniciados com "Marcos"
SELECT
  *
FROM
  vw_clientes
WHERE
  nome LIKE 'Marcos%';

-- Que possuem "Souza" no nome
SELECT
  *
FROM
  vw_clientes
WHERE
  nome LIKE '%Souza%';

-- Que Terminam em "Souza"
SELECT
  *
FROM
  vw_clientes
WHERE
  nome LIKE '%Souza';

-- Exportar para CSV
-- SELECT
--   *
-- FROM
--   vw_exercicios_praticados INTO OUTFILE 'D:/senai2023/2des/03-bcd/aula06/02.projeto_academia/rel_exercicio.csv' FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n';
