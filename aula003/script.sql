-- Banco de dados de Estoque de materiais elétricos
-- versão: 1.0

DROP DATABASE IF EXISTS estoque;
CREATE DATABASE estoque CHARSET=UTF8 COLLATE utf8_general_ci;
USE estoque;
CREATE TABLE produtos(
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  descricao TEXT,
  PRIMARY KEY (id)
);
CREATE TABLE funcionarios(
  matricula INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  PRIMARY KEY(matricula)
);
CREATE TABLE acoes_funcionarios_produtos(
  id INT NOT NULL AUTO_INCREMENT,
  matricula_funcionario INT NOT NULL,
  id_produto INT NOT NULL,
  qtd_produto INT NOT NULL,
  data_acao DATE,
  acao VARCHAR(10),
  FOREIGN KEY(matricula_funcionario) REFERENCES funcionarios(matricula) ON UPDATE CASCADE AND ON DELETE CASCADE,
  FOREIGN KEY(id_produto) REFERENCES
  produtos(id) ON DELETE CASCADE AND ON UPDATE CASCADE
);

-- DML(Data Manipulation Language)
INSERT INTO produtos(nome , descricao)
VALUES
  ("Tomada", "Tomada 10A"),
  ("Interruptor", "Interruptor simples"),
 ("Interruptor", "Interruptor complexo");

INSERT INTO funcionarios VALUES
(1001, "Denner"),
(null, "Levi"),
(default, "Ivo"),
("", "Isaac");

INSERT INTO acoes_funcionarios_produtos VALUES
(1, 1001, "2023-02-01", "Compra", 5),
(1, 1003, "2023-02-01", "utiliza", 1);
(2, 1002, "2023-02-01", "Compra", 10);
(2, 1003, "2023-02-01", "utiliza", 2);

-- Funções
SELECT CURDATE();
SELECT CURTIME();
SELECT RAND();

-- WHERE(ONDE == filtro )
SELECT * FROM produtos WHERE id = 1;
SELECT * FROM funcionarios WHERE matricula = 1;
SELECT * FROM acoes_funcionarios_produtos WHERE data_acao = "2023-02-01";
SELECT * FROM acoes_funcionarios_produtos WHERE id = CURDATE;

-- Alteracoes
UPDATE funcionarios SET nome = "Isaac"
WHERE matricula = 1003;

UPDATE produtos SET id=101 WHERE id=1;
UPDATE produtos SET id=102 WHERE id=2;
UPDATE produtos SET id=103 WHERE id=3;

UPDATE funcionarios SET matricula = 2001 WHERE matricula=2000;
UPDATE funcionarios SET matricula = 1010 WHERE matricula=1001;

-- Exclusões
DELETE FROM funcionarios WHERE matricula = 1001;
DELETE FROM produtos WHERE id = 103;

SELECT * FROM produtos;
