PRAGMA foreign_keys = ON; --precisa ser a primeira coisa a ser usada no SQLite
--SQLite por padrão não tem o suporte as chaves estrangeiras ativado
--caso tenha criado tabelas, é preciso apagar e cria-las novamente

CREATE TABLE tb_paciente(
  id_paciente INTEGER PRIMARY KEY AUTOINCREMENT, --para usar autoincrement (explicitamente) no SQLITE primary key precisa estar aqui
  cpf CHAR(11),
  nome VARCHAR(100) NOT NULL,
  data_nascimento DATE,
  endereco VARCHAR(300),
  telefone CHAR(11)
);

CREATE TABLE tb_especialidade(
 id_especialidade INTEGER PRIMARY KEY AUTOINCREMENT,
 nome_especialidade VARCHAR(100) NOT NULL
);

CREATE TABLE tb_medico(
  crm CHAR(10),
  id_especialidade INTEGER,
  nome VARCHAR(100) NOT NULL,
  PRIMARY KEY (crm),
  FOREIGN KEY (id_especialidade) REFERENCES tb_especialidade(id_especialidade)
);

CREATE TABLE tb_consulta(
  id_consulta INTEGER PRIMARY KEY AUTOINCREMENT, --precisa de NOT NULL? Ver faq do SQLite
  id_paciente INTEGER,
  crm CHAR(10),
  data_horario DATETIME NOT NULL,
  custo_consulta FLOAT(10,2) NOT NULL,
  FOREIGN KEY (id_paciente) REFERENCES tb_paciente(id_paciente),
  FOREIGN KEY (crm) REFERENCES tb_medico(crm)
);

CREATE TABLE tb_tipo_exame(
  id_tipo_exame INTEGER PRIMARY KEY AUTOINCREMENT,
  nome_exame VARCHAR(100) NOT NULL
);

CREATE TABLE tb_exame(
  id_exame INTEGER PRIMARY KEY AUTOINCREMENT,
  id_consulta INTEGER,
  id_tipo_exame INTEGER,
  descricao VARCHAR(500),
  data_horario DATETIME NOT NULL,
  custo_exame FLOAT(10,2) NOT NULL,
  laboratorio VARCHAR(100),
  FOREIGN KEY (id_consulta) REFERENCES tb_consulta(id_consulta),
  FOREIGN KEY (id_tipo_exame) REFERENCES tb_tipo_exame(id_tipo_exame)
);

CREATE TABLE tb_receita(
  id_receita INTEGER PRIMARY KEY AUTOINCREMENT, 
  id_consulta INTEGER,
  medicamento VARCHAR(100) NOT NULL,
  descricao VARCHAR(500),
  FOREIGN KEY (id_consulta) REFERENCES tb_consulta(id_consulta)
);
