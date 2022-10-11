CREATE TABLE clientes (
  id INTEGER NOT NULL,
  nome VARCHAR(50),
  telefone VARCHAR(15),
  email VARCHAR(100),
  senha VARCHAR(50),
  CONSTRAINT clienteid_pk PRIMARY key (id)
);

create table barbeiro (
  id INTEGER NOT NULL,
  nome VARCHAR(50),
  cpf BIGINT,
  telefone VARCHAR(15),
  email VARCHAR(100),
  senha VARCHAR(50),
  CONSTRAINT barbeiroid_pk PRIMARY key (id)
);


create table endereco (
  id INTEGER NOT NULL,
  cep INTEGER,
  rua varchar(50),
  complemento varchar(50),
  numero integer,
  bairro varchar(50),
  referencia varchar(50),
  cidade varchar(50),
  estado varchar(2),
  CONSTRAINT enderecoid_pk PRIMARY key (id)
);

create table barbearia (
  id INTEGER NOT NULL,
  nome_barbearia varchar(50),
  descricao VARCHAR(400),
  telefone VARCHAR(15),
  email VARCHAR(100),
  logo VARCHAR(200),
  id_endereco INTEGER not NULL,
  id_barbeiro INTEGER NOT NULL,
  CONSTRAINT barbeariaid_pk PRIMARY key (id),
  CONSTRAINT fk_endereco
  FOREIGN KEY (id_endereco) REFERENCES endereco(id),
  CONSTRAINT fk_barbeiro
  FOREIGN key (id_barbeiro) REFERENCES barbeiro(id)
);

create table categorias (
  id INTEGER NOT NULL,
  nome VARCHAR(50),
  CONSTRAINT categoriaid_pk PRIMARY key (id)
);

create table servicos (
  id integer NOT NULL,
  nome VARCHAR(50),
  preco FLOAT,
  tempo INTEGER,
  id_categoria INTEGER,
  CONSTRAINT servicoid_pk PRIMARY key (id),
  CONSTRAINT fk_categoria
  FOREIGN key (id_categoria) REFERENCES categorias(id)
);

create table agendamento (
  id INTEGER NOT NULL,
  id_cliente integer NOT NULL,
  id_barbearia integer NOT NULL,
  datahora TIMESTAMP,
  CONSTRAINT agendamentoid_pk PRIMARY key (id),
  CONSTRAINT fk_cliente
  FOREIGN key (id_cliente) REFERENCES clientes(id),
  CONSTRAINT fk_barbearia
  FOREIGN key (id_barbearia) REFERENCES barbearia(id)
);

CREATE TABLE servicos_agendados (
  id INTEGER NOT NULL,
  id_agendamento INTEGER NOT NULL,
  id_servico INTEGER NOT NULL,
  CONSTRAINT servicoagendadoid_pk PRIMARY key (id),
  CONSTRAINT fk_agendado foreign key (id_agendamento) REFERENCES agendamento(id),
  CONSTRAINT fk_servico foreign key (id_servico) REFERENCES servicos(id)
);