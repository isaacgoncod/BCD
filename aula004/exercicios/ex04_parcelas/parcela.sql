DROP DATABASE IF EXISTS parcelas;

CREATE DATABASE parcelas CHARSET=UTF8 COLLATE utf8_general_ci;
USE parcelas;

CREATE TABLE cliente(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  endereco VARCHAR(20) NOT NULL,
  num_residencia VARCHAR(10) NOT NULL,
  bairro VARCHAR(20) NOT NULL,
  cidade VARCHAR(20) NOT NULL,
  UF VARCHAR(2) NOT NULL
);
create TABLE tel_cliente(
  id_cliente INT NOT NULL AUTO_INCREMENT,
  telefone VARCHAR(20) NOT NULL,
  celular VARCHAR(20) NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE descricao_compra(
  id_cliente INT NOT NULL AUTO_INCREMENT,
  num_dupli INT NOT NULL PRIMARY KEY,
  data_compra DATE NOT NULL,
  vencimento DATE NOT NULL,
  pagamento DATE,
  valor FLOAT NOT NULL,
  direfenca FLOAT,
  v_final FLOAT,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON UPDATE CASCADE ON DELETE CASCADE
);