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
 
 INSERT INTO funcionario(nome, salario, gerente, departamento) VALUES('Maria', 
 
 DELETE FROM departamento WHERE codigo = 4;
 
 UPDATE departamento SET codigo = 5 WHERE codigo = 6 --comentario
 
DROP TABLE departamento;
DROP TABLE funcionario;