DROP DATABASE IF EXISTS academia;

CREATE DATABASE academia CHARSET = UTF8 COLLATE utf8_general_ci;

USE academia;

CREATE TABLE
  aluno (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    nascimento DATE NOT NULL,
    sexo CHAR NOT NULL,
    peso FLOAT (5, 2) NOT NULL
  );

CREATE TABLE
  telefone (
    id_aluno INT NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno (id) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE
  exercicio (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL,
    grupo_muscular VARCHAR(255) NOT NULL,
    aparelho VARCHAR(255) NOT NULL
  );

CREATE TABLE
  ficha (
    id_aluno INT NOT NULL,
    id_exercicio INT NOT NULL,
    dia_semana VARCHAR(255) NOT NULL,
    serie VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno (id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_exercicio) REFERENCES exercicio (id) ON UPDATE CASCADE ON DELETE CASCADE
  );

-- INSERT INTO
--   aluno
-- VALUES
--   (
--     null,
--     "Marcos de Souza Castro",
--     "2000-05-22",
--     "M",
--     65
--   ),
--   (
--     null,
--     "Ana Oliveira Oliveira",
--     "1990-09-23",
--     "F",
--     88
--   ),
--   (
--     null,
--     "Lúcia da Silva de Souza",
--     "1988-06-14",
--     "F",
--     45.5
--   ),
--   (
--     null,
--     "Ana de Souza de Oliveira",
--     "2002-07-13",
--     "M",
--     98
--   );
-- INSERT INTO
--   telefone
-- VALUES
--   (1, "(11)04023-4384"),
--   (1, "(19)03086-1102"),
--   (2, "(14)3288-8530"),
--   (3, "(21)74746-1126"),
--   (3, "(19)28260-0126"),
--   (4, "(14)64505-3435");
-- INSERT INTO
--   exercicio
-- VALUES
--   (
--     1,
--     "Segunda-feira",
--     "Supino Reto",
--     "Peito",
--     "prancha peito reto",
--     "4R decrescente 12 10 8 6"
--   );
-- DML (importação de dados  Windows)
LOAD DATA INFILE 'C:/isaac/github/BCD/aula005/exercicios/ex02_academia/csv/aluno.csv' INTO TABLE aluno FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/isaac/github/BCD/aula005/exercicios/ex02_academia/csv/telefone.csv' INTO TABLE telefone FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/isaac/github/BCD/aula005/exercicios/ex02_academia/csv/exercicio.csv' INTO TABLE exercicio FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/isaac/github/BCD/aula005/exercicios/ex02_academia/csv/ficha.csv' INTO TABLE ficha FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

--  iniciar o mysql com o comando "sudo mysql --local-infile=1 -u root -p" para rodar no linux
LOAD DATA LOCAL INFILE '/tmp/aluno.csv' INTO TABLE aluno FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\n" IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/tmp/telefone.csv' INTO TABLE telefone FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\n" IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/tmp/exercicio.csv' INTO TABLE exercicio FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\n" IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/tmp/ficha.csv' INTO TABLE ficha FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\n" IGNORE 1 ROWS;

-- Missão, ver uma tabela com os exercícios mais praticados (Relatório)
CREATE VIEW
  vw_exercicios_praticados AS
SELECT
  f.id_aluno,
  e.id,
  e.descricao,
  e.aparelho,
  COUNT(e.id) AS Qtdade
FROM
  exercicio e
  JOIN ficha f ON e.id = f.id_exercicio
GROUP BY
  e.id;

SELECT
  *
FROM
  vw_exercicios_praticados;