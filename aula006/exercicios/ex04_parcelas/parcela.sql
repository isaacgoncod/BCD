DROP DATABASE IF EXISTS parcelas;

CREATE DATABASE parcelas CHARSET = UTF8 COLLATE utf8_general_ci;

USE parcelas;

CREATE TABLE
  cliente (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    rua VARCHAR(255) NOT NULL,
    num_residencia VARCHAR(255) NOT NULL,
    complemento VARCHAR(255),
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    UF VARCHAR(255) NOT NULL
  );

CREATE TABLE
  tel_cliente (
    id_cliente INT NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    celular VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE
  parcela (
    id_cliente INT NOT NULL,
    num_dupli INT NOT NULL PRIMARY KEY,
    data_compra DATE NOT NULL,
    vencimento DATE NOT NULL,
    pagamento DATE,
    valor FLOAT NOT NULL,
    direfenca FLOAT,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id) ON UPDATE CASCADE ON DELETE CASCADE
  );