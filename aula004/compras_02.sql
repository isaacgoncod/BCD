-- banco de dados produtos versão 2.0

DROP DATABASE IF EXISTS compras_02;

CREATE DATABASE compras_02 CHARSET=UTF8 COLLATE utf8_general_ci;
USE compras_02;

CREATE TABLE cliente(
  id INT NOT NULL ,
  cpf VARCHAR(20) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  cep INT NOT NULL,
  num_casa INT NOT NULL,
  complemento TEXT,
  PRIMARY KEY(cpf)
);
CREATE TABLE produto(
  id INT NOT NULL,
  num_compra INT NOT NULL AUTO_INCREMENT,
  data_compra DATE NOT NULL,
  data_vencimento DATE NOT NULL,
  valor FLOAT NOT NULL,
  PRIMARY KEY(num_compra)
);
CREATE TABLE compra(
  id INT NOT NULL PRIMARY KEY,
  num_compra INT NOT NULL AUTO_INCREMENT,   
  cpf_cliente VARCHAR(20) NOT NULL,
  pagamento DATE NOT NULL,
  status_compra TEXT NOT NULL,
  FOREIGN KEY(num_compra) REFERENCES produto(num_compra) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(cpf_cliente) REFERENCES cliente(cpf) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO cliente VALUES
(1, "12345678910", "Gustavo", 13912453, 1203, "Casa"),
(2, "12345123456", "Isaac", 13912574, 1567, "Casa");

INSERT INTO produto VALUES
(1, 010203, "2023-02-01", "2023-02-09", 675.87);

INSERT INTO compra  VALUES
(1, 010203, "12345123456", "2023-02-09", "Em Dia");
