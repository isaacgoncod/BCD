-- banco de dados produtos versão 1.0

DROP DATABASE IF EXISTS compras_01;

CREATE DATABASE compras_01 CHARSET=UTF8 COLLATE utf8_general_ci;
USE compras_01;

CREATE TABLE clientes(
  id INT NOT NULL ,
  cpf INT NOT NULL,
  nome VARCHAR(50) NOT NULL,
  cep INT NOT NULL,
  num_casa INT NOT NULL,
  complemento TEXT,
  PRIMARY KEY(cpf)
);
CREATE TABLE compras(
  id INT NOT NULL,
  num_compra INT NOT NULL AUTO_INCREMENT,
  data_compra DATE NOT NULL,
  data_vencimento DATE NOT NULL,
  valor FLOAT NOT NULL,
  cpf_cliente INT NOT NULL,
  PRIMARY KEY(num_compra),
  FOREIGN KEY(cpf_cliente) REFERENCES clientes(cpf) ON DELETE CASCADE ON UPDATE CASCADE
);
