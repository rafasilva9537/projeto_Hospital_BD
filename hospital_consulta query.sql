PRAGMA foreign_keys = ON; --precisa ser a primeira coisa a ser usada no SQLite
--SQLite por padrão não tem o suporte as chaves estrangeiras ativado
--caso tenha criado tabelas, é preciso apagar e cria-las novamente

-- DDL
CREATE TABLE departamento (
  codigo INTEGER PRIMARY KEY AUTOINCREMENT,
  nome varchar(100) NOT NULL);
  
CREATE TABLE funcionario(
  matricula INTEGER PRIMARY KEY AUTOINCREMENT,
  nome VARCHAR(100) NOT NULL,
  salario NUMERIC(10,2) NOT NULL, --10 inteiros e 2 decimais
  gerente INTEGER, --REFERENCES funcionario(matricula),
  departamento INTEGER NOT NULL, --REFERENCES departamento(codigo)
  FOREIGN KEY (gerente) REFERENCES funcionario(matricula),
  FOREIGN KEY (departamento) REFERENCES departamento(codigo)
);
  
 -- DQL
 SELECT * FROM departamento;
 SELECT * FROM funcionario;
 
 -- DML
 INSERT INTO departamento(nome) VALUES('FINANCEIRO');
 INSERT INTO departamento(nome) VALUES('RH');
 INSERT INTO departamento(nome) VALUES('TI');
 
 INSERT INTO funcionario(nome, salario, departamento) VALUES('JOSE', 1000, 3);
 INSERT INTO funcionario(nome, salario, gerente, departamentO) VALUES('MARIA', 1000, 1, 3);
 
 DELETE FROM departamento WHERE codigo = 4;
 DELETE FROM funcionario;

 
 UPDATE departamento SET codigo = 5 WHERE codigo = 6 --comentario
 
DROP TABLE departamento;
DROP TABLE funcionario;


--ATIVIDADE 2
CREATE TABLE pessoa(
  id INTEGER NOT NULL,
  nome VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE endereco(
  id_pessoa INTEGER NOT NULL,
  logradouro VARCHAR(100),
  numero INTEGER DEFAULT 0,
  cep CHAR(8) NOT NULL,
  cidade VARCHAR(30),
  uf CHAR(2) NOT NULL,
  PRIMARY KEY (id_pessoa),
  FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);

CREATE pessoa_fisica(
  id_pessoa INT NOT NULL,
  sexo CHAR(1),
  cpf CHAR(11) NOT NULL,
  PRIMARY KEY (id_pessoa),
  FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);

INSERT INTO pessoa VALUES (100, 'JOSE'), (101, 'MARIA'), (102, 'PEDRO'), (103, 'MARCOS');
INSERT INTO endereco VALUES

SELECT * FROM pessoa;
SELECT * FROM endereco;

DROP TABLE endereco;
DROP TABLE pessoa;
--incompleta


--ATIVIDADE 3
CREATE TABLE paciente(
  cpf CHAR(11) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  primary KEY (cpf)
);

CREATE TABLE telefone(
  cpf CHAR(11) not NULL,
  telefone char(11) NOT NULL,
  PRIMARY KEY (cpf, telefone),
  FOREIGN KEY (cpf) REFERENCES paciente(cpf)
);

CREATE TABLE medico(
  crm CHAR(10) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  especialidade VARCHAR(30),
  PRIMARY KEY (crm)
);

CREATE TABLE consulta(
  id_consulta INTEGER NOT NULL,
  cpf CHAR(11) NOT NULL,
  crm CHAR(10) NOT NULL,
  data DATE NOT NULL,
  PRIMARY KEY (id_consulta),
  FOREIGN KEY (cpf) REFERENCES paciente(cpf),
  FOREIGN KEY (crm) REFERENCES medico(crm)
);