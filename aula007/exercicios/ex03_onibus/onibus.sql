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
LOAD DATA INFILE 'E:/isaac/github/BCD/aula007/exercicios/ex03_onibus/csv/motorista.csv' INTO TABLE motorista FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/isaac/github/BCD/aula007/exercicios/ex03_onibus/csv/telefone.csv' INTO TABLE telefone FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/isaac/github/BCD/aula007/exercicios/ex03_onibus/csv/linha.csv' INTO TABLE linha FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/isaac/github/BCD/aula007/exercicios/ex03_onibus/csv/dirige.csv' INTO TABLE dirige FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/isaac/github/BCD/aula007/exercicios/ex03_onibus/csv/horario.csv' INTO TABLE linha_horario FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\r\n" IGNORE 1 ROWS;

--  ativar  o local_ infile 'SET GLOBAL local_infile=1;' e depois iniciar o mysql com o comando "sudo mysql --local-infile=1 -u root -p" para rodar no linux
LOAD DATA LOCAL INFILE '/tmp/motorista.csv' INTO TABLE motorista FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\n" IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/tmp/telefone.csv' INTO TABLE telefone FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\n" IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/tmp/linha.csv' INTO TABLE linha FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\n" IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/tmp/dirige.csv' INTO TABLE dirige FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\n" IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/tmp/horario.csv' INTO TABLE linha_horario FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY "\n" IGNORE 1 ROWS;

INSERT INTO
  motorista VALUE (6, "435.789.546-80", "Isaac Gonçalves");

-- 1.Criar uma consulta que mostre os motoristas e telefones
-- Detalhe: mesmo que o motorista não possua telefone deve aparecer na consulta
SELECT
  *
FROM
  motorista
  LEFT JOIN telefone ON id = telefone.id_motorista;

-- 2. Criar uma consulta que mostre o "nome do motorista" e o "id da linha"
-- Detalhe: Caso o motorista não possua nenhuma linha deve aparecer
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

-- Inserir uma linha ainda sem motorista
INSERT INTO
  linha VALUE ("linha6", "Pedreira x Arcadas");

-- Detalhe: Caso a linha não possua motorista deve aparecer
SELECT
  m.nome,
  l.id
FROM
  motorista m
  JOIN dirige d ON m.id = d.id_motorista
  RIGHT JOIN linha l ON d.id_linha = l.id;

-- Detalhe: A consulta deve mostrar tanto motoristas com ou sem linha e linhas sem motoristas
-- A admnistração da empresa de onibus, percebeu qe existe uma linha sem motorista e um motorista sem linha
-- Registre esta linha para este motorista.
INSERT INTO
  dirige VALUE (6, "linha6");

-- Geradas as conultas necessárias, salva como VISÕES
-- Motoristas com seus telefones
CREATE VIEW
  vw_motorista AS
SELECT
  m.id,
  m.nome,
  t.telefone AS telefone
FROM
  motorista m
  LEFT JOIN telefone t ON m.id = t.id_motorista;

-- Nomes dos motoristas e linhas que dirige
CREATE VIEW
  vw_moto_x_linha AS
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

-- testar as visões
SELECT
  *
FROM
  vw_motorista;

SELECT
  *
FROM
  vw_moto_x_linha;

--Mostre o nome, os telefone e id_linha do motorista ou motoristas da linha1
SELECT
  m.nome,
  t.telefone,
  d.id_linha
FROM
  motorista m
  JOIN dirige d ON m.id = d.id_motorista
  JOIN telefone t ON m.id = t.id_motorista
WHERE
  d.id_linha = 'linha1';

-- Mostre os horários da linha1
SELECT
  *
FROM
  linha_horario
WHERE
  id_linha = 'Linha1';

--  Mostre o id_linha das linhas que tenham horário as 11:00hs.
SELECT
  id_linha
FROM
  linha_horario
WHERE
  horario_partida = '11:00';

-- Mostre os nomes, telefones, id_linha, descricao e horários orenado por id_linha
SELECT
  m.nome,
  t.telefone,
  l.id,
  l.descricao_linha,
  lh.horario_partida
FROM
  motorista m
  JOIN dirige d ON m.id = d.id_motorista
  JOIN telefone t ON m.id = t.id_motorista
  JOIN linha l ON d.id_linha = l.id
  JOIN linha_horario lh ON l.id = lh.id_linha
ORDER BY
  l.id;

--  Mostre uma consulta que mostre os nomes dos motoristas e quantas linhas este dirige
SELECT
  m.nome,
  COUNT(d.id_linha) AS qtd_linhas
FROM
  motorista m
  LEFT JOIN dirige d ON m.id = d.id_motorista
GROUP BY
  m.id;

--Mostre o id_linha, a descrição e quantos motoristas esta possui
SELECT
  l.id,
  l.descricao_linha,
  COUNT(d.id_motorista) AS qtd_motoristas
FROM
  linha l
  LEFT JOIN dirige d ON l.id = d.id_linha
GROUP BY
  l.id;