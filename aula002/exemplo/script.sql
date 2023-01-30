-- banco de dados ex002/aula001 OS 1.0
CREATE DATABASE ordens_servico;
USE ordens_servico;
CREATE TABLE os(
  id INT NOT NULL AUTO_INCREMENT,
  funcionario VARCHAR(100) NOT NULL,
  descricao TEXT NOT NULL,
  data_abertura DATE NOT NULL,
  hora_abertura TIME NOT NULL,
  data_fim DATE,
  hora_fim TIME,
  PRIMARY KEY (id)
);

ALTER TABLE os DROP funcionario,
-- banco de dados ex002/aula001 OS 2.0
CREATE DATABASE ordens_servico_2;
USE ordens_servico_2;
CREATE TABLE funcionarios(
  matricula INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  cargo VARCHAR(20) NOT NULL,
  PRIMARY KEY (matricula)
);
CREATE TABLE os(
  id INT NOT NULL AUTO_INCREMENT,
  func_abertura INT NOT NULL,
  func_executor INT NOT NULL,
  descricao TEXT NOT NULL,
  data_abertura DATE NOT NULL,
  hora_abertura TIME NOT NULL,
  data_fim DATE,
  hora_fim TIME,
  PRIMARY KEY (id),
  FOREIGN KEY(func_abertura) REFERENCES funcionarios(matricula),
  FOREIGN KEY(func_executor) REFERENCES funcionarios(matricula)
);
