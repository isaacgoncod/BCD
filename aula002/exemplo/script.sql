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

ALTER TABLE os DROP funcionario;
ALTER TABLE os ADD func_abertura VARCHAR(30) NOT NULL AFTER id;
ALTER TABLE os ADD func_executor VARCHAR(30) NOT NULL AFTER func_abertura;

INSERT INTO os VALUES
(null,"Reenye", "Levi", "Torneira da pia da cozinha pingando", "2023-02-01", "11:00:00" , "2023-02-01", "12:00:00"),
(null,"Paraguassu", "Levi", "Torneira da pia da cozinha pingando", "2023-02-01", "13:00:00" , "2023-02-02", "13:00:00");


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

INSERT INTO funcionarios VALUES
(null, "Levi", "Manutenção"),
(null, "Denner", "Manutenção"),
(null, "Reenye", "Professor"),
(null, "Welliington", "Professor"),
(null, "Ivo", "Professor"),
(null, "Paraguassu", "Coordenador"),
(null, "Tati", "Qualidade");

INSERT INTO os VALUES
(null, 3, 1, "Torneira da pia da cozinha pingando", "2023-02-01", "11:00:00" , "2023-02-01", "12:00:00"),
(null, 6, 1, "Torneira da pia da cozinha pingando", "2023-02-01", "13:00:00" , "2023-02-02", "13:00:00");




