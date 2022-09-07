create table pacientes(id_pacientes int generated always as identity PRIMARY KEY,
nome varchar (48) not null,
sexo varchar (1),
obito boolean,
insertedAt TIMESTAMP NOT NULL DEFAULT NOW ());

create table if not exists profissionais(id_profissionais int generated always as identity PRIMARY KEY, nome varchar (50));

create table if not exists especialidades(id_especialidades int generated always as identity PRIMARY KEY, nome varchar (50));

create table if not exists consultas(id_consultas int generated always as identity PRIMARY KEY,id_especialidades integer,id_pacientes integer,id_profissionais integer);

create table if not exists obitos(id_obitos int generated always as identity PRIMARY KEY,obs text);


ALTER TABLE consultas
ADD CONSTRAINT FKEspecialidadeDaConsulta FOREIGN KEY
(id_especialidades)
REFERENCES
especialidades (id_especialidades);

insert into especialidades (nome) values ('urologista');
insert into especialidades (nome) values ('ginecologista');
insert into especialidades (nome) values ('clinica geral');

select * from especialidades;

insert into profissionais (nome) values ('DrFeelGoodUro');
insert into profissionais (nome) values ('DrJekllGineco');
insert into profissionais (nome) values ('DrRay');

select * from profissionais;


insert into pacientes (nome, sexo) values ('Ada LoveLace', 'F');
insert into pacientes (nome, sexo) values ('Donald Knuth', 'M');
insert into pacientes (nome, sexo) values ('Grace Hopper', 'F');
insert into pacientes (nome, sexo) values ('Dennis Ritchie', 'M');

select * from pacientes;

insert into consultas (id_especialidades, id_pacientes, id_profissionais) values ('1', '1', '1');

select * from consultas;




CREATE OR REPLACE FUNCTION trgValidaDadosConsulta()
RETURNS trigger AS $$
BEGIN RAISE NOTICE 'NOSSA TRIGGER RODOU!!!!!';RETURN NEW;
END
$$ LANGUAGE plpgsql;


CREATE TRIGGER ValidaDadosConsulta
AFTER INSERT OR UPDATE ON consultas
FOR EACH ROW --FOR EACH STATEMENT
EXECUTE PROCEDURE trgValidaDadosConsulta();

Drop TABLE consultas;
DROP TABLE especialidades;
Drop TABLE profissionais;
Drop TABLE pacientes;
drop table obitos;





