DROP DATABASE IF EXISTS pizzaria;

CREATE DATABASE pizzaria CHARSET = UTF8 COLLATE utf8_general_ci;

USE pizzaria;

CREATE TABLE
  cliente (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    telefone VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    logradouro VARCHAR(255) NOT NULL,
    numero FLOAT (5, 0) NOT NULL,
    complemento VARCHAR(255),
    bairro VARCHAR(255) NOT NULL,
    referencia VARCHAR(255)
  );

CREATE TABLE
  pizza (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor FLOAT (4, 2) NOT NULL
  );

CREATE TABLE
  pedido (
    id INT NOT NULl PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    data DATE NOT NULl,
    valor FLOAT (5, 2),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id)
  );

CREATE TABLE
  item_pedido (
    id_pedido INT NOT NULL,
    id_pizza INT NOT NULL,
    quantidade FLOAT (2, 0),
    valor FLOAT (5, 2),
    FOREIGN KEY (id_pedido) REFERENCES pedido (id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_pizza) REFERENCES pizza (id) ON UPDATE CASCADE ON DELETE CASCADE
  );