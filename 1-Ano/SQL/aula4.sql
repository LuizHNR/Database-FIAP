Aula 1 - 20/08/24

-- coment�rios de linha
/* coment�rios v�rias linhas*/


Parte 1 - comandos DDL - estrutura

Data Definition Language

Create - cria tabelas
alter - altera estrutura pronta
drop - apaga tabelas

Tabela - Funcionario
         mat_fun - N - 4 - Pk
         nm_fun  - A - 30 - Nn
         dt_adm  - D - Nn
         salario - N - 8,2
         sexo    - C - 1 - Nn
         
Criando tabelas:
Sintaxe: create table table_name (column_name1 datatype(size) [constraint],
                                  column_name2 datatype(size) [constraint],
                                  ......................);
                                  
obs: constraint � opcional, nem todas as colunas tem

Exibindo a estrutura de uma tabela

sintaxe: desc table_name;

desc funcionario;

criando a tabela funcion�rio:


create table funcionario (mat_fun Number(4) Primary key,
                          nm_fun  varchar(30) Not null,
                          dt_adm  Date Not null,
                          salario Number(10,2),
                          sexo    Char(1) not null);

desc funcionario;

create table funcionario_2024
(mat_fun Number(4) constraint func_mat_pk Primary key,
 nm_fun  varchar(30) constraint func_nm_nn Not null,
 dt_adm  Date constraint func_dt_nn Not null,
 salario Number(10,2),
 sexo    Char(1) constraint func_sx_nn not null);
 
Relacionamentos: 1 - N - criando a FK

Tabela: cargo - cd_cargo - N - 4 - PK
                nm_cargo - A - 25 - Nn, Uk -- unique
                salario  - N - 8,2
                
create table cargo (cd_cargo number(4) constraint cargo_cd_pk1 primary key,
                    nm_cargo varchar(25) constraint cargo_nm_nn1 not null
                                         constraint cargo_nm_uk1 unique,
                    salario number(10,2));
                    
Tabela: Funcion�rio, j� existe???? vamos apagar

Apagando uma tabela sem relacionamento

sintaxe: drop table table_name;

drop table funcionario_2024;

create table funcionario_2024
(mat_fun Number(4) constraint func_mat_pk Primary key,
 nm_fun  varchar(30) constraint func_nm_nn Not null,
 dt_adm  Date constraint func_dt_nn Not null,
 salario Number(10,2),
 sexo    Char(1) constraint func_sx_nn not null,
 fk_cargo number(4) constraint func_cargo_fk references cargo);
 
 obs fk: column_name datatype(syze) [constraint] references table_name
 
 references � a cria��o da foreign key (fk) ou chave estrangeira
 
 Aula 2 - 02/09/24 - criando relacionamento 1 - 1
 
 Create table pessoa1 (cod_pess1 number(3) primary key,
                       nm_pess1 varchar(30) not null);
                       
 Create table pessoa2 (cod_pess2 number(3) primary key,
                       nm_pess2 varchar(30) not null,
                       fk_pess number(3) unique references pessoa1);
                       
 DML - Altera��o de estrutura - tabela
 
 sintaxe: alter table table_name.....
 varia��es: incluir coluna: add column_name
            incluir constraint: add constraint constraint_name
            modificar tipo de dados: modify
            modificar tamanho: modify
            apagar coluna: drop column column_name
            apagar constraint: drop constraint constraint_name
            renomear coluna: rename column
            
drop table teste cascade constraints;            
            
create table teste (nome number(4));            

- incluir na tabela teste a coluna c�digo de tipo num�rica com 4 posi��es.
desc teste;
alter table teste add codigo number(4);

- incuir na coluna c�digo da tabela teste a pk.
alter table teste add constraint teste_cd_pk primary key (codigo);
ou
alter table teste add primary key (codigo);

- alterar o tipo de dados da coluna nome para alfanum�rico com 30 posi��es
alter table teste modify nome varchar(30);

- alterar o tamanho da coluna nome para 45 posi��es
alter table teste modify nome varchar(45);

- apagar a pk da coluna c�digo
alter table teste drop constraint teste_cd_pk;

- apagar a coluna na c�digo da tabela teste.
alter table teste drop column codigo;

-renomear a coluna nome para nome_cliente.
alter table teste rename column nome to nome_cliente;

- incluir a regra not null na coluna nome_cliente.
alter table teste add constraint teste_nome_nn not null (nome_cliente);
- cuidado, existe uma pegadinha com not null
alter table teste modify nome_cliente varchar(45) 
constraint teste_nome_nn not null;

DML - Data Manipulation Language - Dados

Novas linhas 
sintaxe: insert into table_name values (value_column1,......, value_columnN);
         insert into table_name (name_column1,......., name_columnN)
         values (value_column1,......, value_columnN);

usando nulo = null
dados n�o num�ricos precisam de ''

Exemplificar;

desc cargo
insert into cargo values (1,'prog. JAVA', 10000);
-- visualizando dados
select * from cargo;
insert into cargo values (2,'DBA', 12500.80);

incluir os seguintes dados na tabela cargo
3 - CEO - 25000
4 - Adm Redes - 8500
5 - Est�gio - 33000

insert into cargo values (3,'CEO', 25000);
insert into cargo values (4,'Adm Redes', 8500);
insert into cargo values (5,'Est�gio', 33000);

caso n�o tenha dados para uma ou mais colunas?????

6 - Adm. Seg - null
select * from cargo;
desc cargo
vers�o 1: insert into cargo values (6,'Adm. Seg', null);
vers�o 2: insert into cargo (cd_cargo, nm_cargo) values(7,'Adm Seg');
validando os dados
commit;

Inserir 3 linhas de dados na tabela funcion�rio a seu crit�rio
desc funcionario_2024;
procurando pelo padr�o de data
select sysdate from dual; -- acha a data cadastrada
insert into funcionario_2024 values (1,'Marcel','10-jan-20', 70000,'M',2);
insert into funcionario_2024 values (2,'Joana','20-dec-22',50000,'F',1);
insert into funcionario_2024 values (3,'Ricardo',sysdate,null,'M',6);
commit;
select * from funcionario_2024;
cuidado com os valores de FK, s� recebe dados j� cadastrado na pk
insert into funcionario_2024 values (4,'Ricardo',sysdate,null,'M',8);

Aula - 16/09/24

Trabalhando a regra check - valida��o

Alterando a padr�o da data
ALTER SESSION SET NLS_DATE_FORMAT = 'dd-mm-yyyy'

Exemplo 1: criando tabela

create table vend_edor (id_ven number(2) primary key,
                       nm_vn varchar(20) not null,
                       area_atende char(2));
                       
alter table vend_edor add constraint vend_area_ck 
check (area_atende in ('SP','RJ'));

teste 1: verificando uf

insert into vend_edor values (1,'marcel','SP'); -- OK
insert into vend_edor values (2,'marcel','BA'); -- Erro


create table alu_nos (id_alu number(2) primary key,
                       nm_alu varchar(20) not null,
                       idade number(2));
                       
alter table ALU_NOS add constraint alu_idade_ck check (idade >= 18);

insert into alu_nos values(1, 'marcel', 15); -- Erro
insert into alu_nos values(2, 'marcel', 30); -- Ok

Atualiza��o de dados

Operadores aritm�ticos + - * / ()
Operadores relacionais > >= < <= = <> ou !=
Operadores l�gicos and or not

Update table_name set column_name where condi��o

Obs: update sem where provoca atualiza��o em todas as linhas de uma tabela

desc funcionario
select * from funcionario
insert into funcionario values(1, 'Adriano', sysdate, 10000, 'M');
insert into funcionario values(2, 'Samira', '09-10-2000', null, 'F');
insert into funcionario values(3, 'Glaucia', sysdate - 100, 12500, 'F');

Atualizar o salario do funcionario Adriano em 12500.
Update funcionario set salario = 12500 where mat_fun = 1;

Para os funcion�rios de c�digo 2 e 3 atualize o sal�rio para 10000
Update funcionario set salario = 10000 where mat_fun > 1;
ou
Update funcionario set salario = 10000 where mat_fun = 2 or mat_fun = 3;

Aumente em 10% o sal�rio de todos os funcion�rios
update funcionario set salario = salario * 1.1;

select * from funcionario;
Atualize o nome do funcion�rio Adriano para Adriano Mattos.
update funcionario set nm_fun = 'Adriano Mattos'
where mat_fun = 1;

Troque a data de admiss�o da funcion�ria Samira para Hoje.
update funcionario set dt_adm = sysdate where mat_fun = 2;

valida��o dos dados - migra��o da mem�ria RAM par HD

commit;

Apagar linhas

delete from table_name - apaga tudo
delete from table_name where condi��o - apaga de acordo com a condi��o

delete from funcionario where mat_fun = 2;
delete from funcionario;

desc cargo
select * from cargo
desc funcionario

Apagar a coluna salario da tabela funcionario e incluir o relacionamento de
1 - N  entre cargo(1) e funcion�rio(N)

alter table funcionario drop column salario;
alter table funcionario add fk_cargo references cargo;

Incluir os seguintes dados para a coluna fk

select * from cargo

1 - Marcel - 10-10-2000 - 'M' - 2
2 - Ana    - 04-03-1999 - 'F' - 3
3 - Victor - 12-12-2010 - 'M' - 3
4 - Vanessa - 07-07-2007 - 'F' - 1
5 - Marcos - 22-06-2020 - 'M' - 4
6 - Willian - Hoje - 'M' - 8

Aula 4 - 30/09/24

Nosso Sistema

drop table cliente cascade constraints;
drop table vendedor cascade constraints;
drop table produto cascade constraints;
drop table pedido cascade constraints;
drop table item_pedido cascade constraints;

create table cliente
(cod_clie number(4) constraint clie_cd_pk primary key,
nome_clie varchar2(20) constraint clie_no_nn not null,
endereco varchar2(30),cidade varchar2(15),
cep char(8),uf char(2),cnpj char(14),ie char(12));

create table vendedor
(cod_ven number(4) constraint ven_cod_pk primary key,
nome_ven varchar2(20) constraint ven_no_nn not null,
salario_fixo number(12,2),comissao char(1));

create table produto
(cod_prod number(4) constraint prod1_cod_pk primary key,
unidade varchar2(3),descricao varchar2(30),val_unit number(10,2));

create table pedido
(num_pedido number(4) constraint pedido_num_pk primary key,
pr_entrega number(3) constraint entrega_pr_nn not null,
cod_clie references cliente,cod_ven references vendedor);

create table item_pedido
(num_pedido references pedido,
cod_prod references produto,
quant number(10,2));

insert into cliente values(720,'Ana','Rua 17 n.19','Niteroi','24358310','RJ','12113231000134','2134');
insert into cliente values(870,'Flavio','Av. Pres. Vargas, 10','Sao Paulo','22763931','SP','2253412693879','4631');
insert into cliente values(110,'Jorge','Rua Caiapo, 13','Curitiba','30078500','PR','1451276498349',null);
insert into cliente values(222,'Lucia','Rua Itabira, 123','Belo Horizonte','22124391','MG','28315212393488','2985');
insert into cliente values(830,'Mauricio','Av. Paulista, 1236','Sao Paulo','3012683','SP','3281698574656','9343');
insert into cliente values(130,'Edmar','Rua da Praia, s/n','Salvador','30079300','BA','234632842349','7121');
insert into cliente values(410,'Rodolfo','Largo da Lapa, 27','Rio de Janeiro','30078900','RJ','1283512823469','743');
insert into cliente values(20,'Beth','Av. Climerio, 45','Sao Paulo','25679300','SP','3248512673268','9280');
insert into cliente values(157,'Paulo','Trav. Moraes, casa 3','Londrina',null,'PR','328482233242','1923');
insert into cliente values(180,'Livio','Av. Beira Mar, 1256','Florianopolis','30077500','SC','1273657123474','1111');
insert into cliente values(260,'Susana','Rua Lopes Mandes, 12','Niteroi','30046500','RJ','217635712329','2530');
insert into cliente values(290,'Renato','Rua Meireles, 123','Sao Paulo','30225900','SP','1327657112314','1820');
insert into cliente values(390,'Sebastiao','Rua da Igreja, 10','Uberaba','30438700','MG','321765472133','9071');
insert into cliente values(234,'Jose','Quadra 3, Bl. 3, sl. 1003','Brasilia','22841650','DF','2176357612323','2931');
commit;
insert into vendedor values(209,'Jose','1800','C');
insert into vendedor values(111,'Carlos','2490','A');
insert into vendedor values(11,'Joao','2780','C');
insert into vendedor values(240,'Antonio','9500','C');
insert into vendedor values(720,'Felipe','4600','A');
insert into vendedor values(213,'Jonas','2300','A');
insert into vendedor values(101,'Joao','2650','C');
insert into vendedor values(310,'Josias','870','B');
insert into vendedor values(250,'Mauricio','2930','B');
commit;
insert into produto values ('25','KG','Queijo',0.97);
insert into produto values ('31','BAR','Chocolate',0.87);
insert into produto values ('78','L','Vinho',2.00);
insert into produto values ('22','M','Linho',0.11);
insert into produto values ('30','SAC','Acucar',0.30);
insert into produto values ('53','M','Linha',1.80);
insert into produto values ('13','G','Ouro',6.18);
insert into produto values ('45','M','Madeira',0.25);
insert into produto values ('87','M','Cano',1.97);
insert into produto values ('77','M','Papel',1.05);
commit;
insert into pedido values ('121','20','410','209');
insert into pedido values ('97','20','720','101');
insert into pedido values ('101','15','720','101');
insert into pedido values ('137','20','720','720');
insert into pedido values ('148','20','720','101');
insert into pedido values ('189','15','870','213');
insert into pedido values ('104','30','110','101');
insert into pedido values ('203','30','830','250');
insert into pedido values ('98','20','410','209');
insert into pedido values ('143','30','20','11');
insert into pedido values ('105','30','180','240');
insert into pedido values ('111','15','260','240');
insert into pedido values ('103','20','260','11');
insert into pedido values ('91','20','260','11');
insert into pedido values ('138','20','260','11');
insert into pedido values ('108','15','290','310');
insert into pedido values ('119','30','390','250');
commit;
insert into item_pedido values ('121','25','10');
insert into item_pedido values ('121','31','35');
insert into item_pedido values ('97','77','20');
insert into item_pedido values ('101','31','9');
insert into item_pedido values ('101','78','18');
insert into item_pedido values ('101','13','5');
insert into item_pedido values ('98','77','5');
insert into item_pedido values ('148','45','8');
insert into item_pedido values ('148','31','7');
insert into item_pedido values ('148','77','3');
insert into item_pedido values ('148','25','10');
insert into item_pedido values ('148','78','30');
insert into item_pedido values ('104','53','32');
insert into item_pedido values ('203','31','6');
insert into item_pedido values ('189','78','45');
insert into item_pedido values ('143','31','20');
insert into item_pedido values ('143','78','10');
commit;

criando relatorios - DQL

Sintaxe: select * from table_name;
         select column_name1, column_name2,...., column_nameN
         from table_name;
         
Exemplos:
Select * from cliente;
select nome_clie, cidade from cliente;

Criar um relat�rio que exiba os dados dos vendedores.
select * from vendedor;
Mostre o nome do produto e seu pre�o.
select descricao, val_unit from produto;

Apelidando as colunas
 - colocar sempre ap�s o nome da coluna
 - para duas ou + palavras usa-se "
 
 Exemplo:
 select * from vendedor;
 select nome_ven "Nome", salario_fixo "sal�rio vendedor" from vendedor;
 
 Classificando a sa�da de dados
 Comando Order by column_name type
 Type - asc - crescente - default
      - desc - decrescente
      
 Exemplos:
 select * from vendedor order by nome_ven;
 select * from vendedor order by nome_ven desc;
 
 select * from cliente order by 2;
 select nome_clie, uf from cliente order by 2;
 select nome_clie, uf from cliente order by 2, 1;
 select nome_clie, uf from cliente order by 2, 1 desc;
 
 Filtrando linhas
 comando where = update e delete
 
 select * from cliente;
 
 Exemplos:
 Crie um relat�rio que exiba os clientes que moram no estado de S�o Paulo.
 select * from cliente where uf = 'SP';
 Crie um relat�rio que exiba os clientes que moram no estado de S�o Paulo, aten��o
 as letras maiusculas ou minisculas.
 select * from cliente where uf = 'SP' or uf = 'sp';
 
 Exerc�cios;
- Mostre os dados da tabela produto.
   select * from produto;
- Mostre os produtos que n�o custam mais de R$2,00.
   select * from produto where val_unit < 2;
   select * from produto where not val_unit > 2;
- Quem s�o os vendedores que ganham acima de R$3.500,00? Exiba nome e sal�rio
   classificados pelo sal�rio de forma decrescente.
   select nome_ven, salario_fixo from vendedor
   where salario_fixo > 3500
   order by 2 desc;
- Mostre os pedidos dos clientes de c�digo 130 at� 800.
   select * from pedido where cod_clie > 130 and cod_clie < 800;
- Quem s�o os clientes (nome, uf e ie) que n�o moram no estado do Rio de Janeiro
   e Minas Gerais e que a inscri��o estadual seja menor que 2000?
 select nome_clie, uf, ie from cliente
 where uf != 'RJ' and uf != 'MG' and ie < 2000;
 
 Quais vendedores ter�o sal�rio maior que R$5.000,00 com um aumento de 10% no sal�rio
 atual? Exiba nome, sal�rio atual e sal�rio rejustado.
 select nome_ven "Nome Vendedor", salario_fixo "Sal�rio Atual",
 salario_fixo * 1.1 "Sal�rio Reajustado"
 from vendedor
 where salario_fixo * 1.1 > 5000 and salario_fixo < 5000
 
 
 