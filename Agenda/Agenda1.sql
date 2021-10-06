create database dbagendadaniel;
use dbagendadaniel;

-- verificar tabelas existentes
show tables;


-- criando uma tabela
-- toda tabela precisa ter uma chave primaria (pk)
-- int (tipo de dados numeros inteiros)
-- primary key  --> transforma este campo em chave primaria
-- auto_increment --> numeraçao automatica
-- varchar (tipo de dados equivalente a String)
-- (50) numero max que e aceitado
-- not null --> preenchimento obrigatorio
-- unique --> nao permite valores duplicados na tabela
create table contatos(
id int primary key auto_increment,
 nome varchar(50) not null,
 fone varchar(15) not null,
 email varchar(50) unique
);
show tables;

-- descriçao da tabela
describe contatos;


-- alterar o nome de um campo na tabela
alter table contatos change contato nome varchar(50) not null;


-- adicionar um novo campo a tabela 
alter table contatos add column obs varchar(250);

-- adicionar um novo campo/coluna em lugar especifico
alter table contatos add column fone2 varchar(15) after fone;


-- modificar tipo de dados e/ou validacao na coluna
alter table contatos modify column fone2 int;
alter table contatos modify column email varchar(100) not null;


-- excluir uma coluna
alter table contatos drop column obs;

-- excluir a tabela
drop table contatos;

-- CRUD (create read update delete)
-- operaçoes basicas do banco de dados

-- crud create
insert into contatos(nome,fone,email)
values('Daniel dias','99999-1111','dias@email.com');
insert into contatos(nome,fone,email)
values('Lionel messi','9000-1234','leo@messi.com');
insert into contatos(nome,fone,email)
values('brian','9002-6768','brian@lala.com');
insert into contatos(nome,fone,email)
values('japa','9002-0200','japa@japao.com');
insert into contatos(nome,fone)
values('gaybriel','9002-2469');

-- crud read
-- selecionar todos os dados dos registros
select * from contatos;

-- selecionar colunas na tabalea
select nome,fone from contatos;

-- selecionar colunas em ordem crescente e decrescente
select * from contatos order by nome;
select id,nome from contatos order by id desc;

-- uso de filtros
select * from contatos where id= 1;
select * from contatos where nome = 'Lionel messi';
select * from contatos where nome like 'd%';


-- crud delete
delete from contatos where id=4;


-- crud update
update contatos set nome='gabriel' where id=6;
update contatos set email='gabriel@gmail.com' where id=6;
update contatos set nome='serieC' where id=8;
update contatos set fone='9002-0000' where id=6;
update contatos set email='naovaisubir@gmail.com' where id=8;
update contatos set nome='melhor do mundo',fone='1010-1010',email='messi@omelhor.com' where id=5;