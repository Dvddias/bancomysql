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



--  timestamp default current_timestamp (data e hora automatica)
-- date (tipo de dados data) YYYY/MM/DD
create table estoque (
 codigo int primary key auto_increment,
 barcode varchar(50) unique,
 produto varchar(100) not null,
 fabricante varchar(100) not null,
 datacad timestamp default current_timestamp,
 dataval date not null,
 quantidade int not null,
 estoquemin int not null,
 medida varchar(50) not null,
 valor decimal(10,2),
 loc varchar(100)
  );
  
  describe estoque;
  
  
  insert into estoque (produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
  values ('Caneta','Bic',20221005,100,10,'CX',28.55,'setor A p2');
  
  insert into estoque (produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
  values ('Garrafa Agua','Crystal',20221231,200,2,'PCT',3,'setor L andar 3');
  
  insert into estoque (produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
  values ('Bolacha','trakinas',20191003,200,20,'CX',2.50,'setor B andar 4');
  
  insert into estoque (produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
  values ('Lapis','Faber-castel',20221020,300,20,'CX',3,'setor A andar 3');
  
  insert into estoque (produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
  values ('Queijo','Tirolez',20190312,100,15,'CX',4,'setor L andar 2');
  
  insert into estoque (produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
  values ('Bacon','Sadia',20220304,10,15,'PCT',10,'setor P andar 2');
  
  insert into estoque (produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
  values ('Leite','italac',20221023,12,30,'CX',4.50,'setor L andar 3');
  
  
  
  select * from estoque;
  
  
  -- Inventario de estoque (total)
  select sum(valor * quantidade) as total from estoque;
  
  -- Relatorio de reposiçao do estoque
  select * from estoque where quantidade < estoquemin;
  
  -- Relatorio de reposiçao do estoque 2 
  -- date_format() -- Formatar a exibiçao da data
  -- %d (dia) %m (mes) %y (2 digitos) %Y (ano 4 digitos)
  select codigo as código,produto,date_format(dataval,'%d/%m/%Y') as data_validade,quantidade,estoquemin
  as estoque_min from estoque where quantidade < estoquemin;
  
  -- Relatorio de validade 1 
  select codigo as código,produto,date_format(dataval,'%d/%m/%Y') as data_validade from estoque;
  
  
  -- Relatorio de validade 2
  -- datediff() retorna a diferença em dias de duas datas
  -- curdate() data atual
  select codigo as codigo,produto,date_format(dataval,'%d/%m/%Y') as data_validade,datediff(dataval,curdate()) as dias_restantes from estoque;
  
  -- Crud update
  update estoque set quantidade = 200 where id=2;
  update estoque set produto = 'Leite desnatado',fabricante = 'Mococa',dataval = 20220906,quantidade = 25,estoquemin = 35, medida = 'CX',valor = 6, loc = 'Setor L, andar4' where codigo=7;

-- crud delete
delete from estoque where codigo=4;



