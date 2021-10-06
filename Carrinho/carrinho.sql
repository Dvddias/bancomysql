/**
Carrinho de compras
@author Daniel dias
*/


create database dbacarrinho;
use dbacarrinho;
-- criar tabela
-- decimal (tipo de dado numerico nao inteiro 10,2 dez digitos com 2 casas decimais de precisao)
create table carrinhoCompras(
codigo int primary key auto_increment,
produto varchar(250),
quantidade int not null,
valor decimal(10,2) not null
);

-- descriçao da tabela
describe carrinhoCompras;

-- alteraçao da tabela
alter table carrinhoCompras modify column produto varchar(250) not null;
drop table carrinhoCompras;


-- crud create
insert into carrinhoCompras (produto,quantidade,valor)
values ('Caneta bic CX30',10,17.50);

insert into carrinhoCompras (produto,quantidade,valor)
values('Lapis',20,12.30);

insert into carrinhoCompras (produto,quantidade,valor)
values('borracha',2,2.45);

-- crud read
select * from carrinhoCompras;

select * from carrinhoCompras order by valor desc;
select * from carrinhoCompras order by valor asc;

select * from carrinhoCompras where produto = 'borracha';
select * from carrinhoCompras where codigo = 3;

-- crud update
update carrinhoCompras set quantidade = '4' where codigo = 3;

-- crud delete
delete from carrinhoCompras where codigo = 2;




-- operaçoes Matematica
select sum(valor * quantidade) as total from carrinhoCompras;

