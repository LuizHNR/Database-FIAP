Aula 1 - 20/08/24

-- comentários de linha
/* comentários várias linhas*/


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
                                  
obs: constraint é opcional, nem todas as colunas tem

Exibindo a estrutura de uma tabela

sintaxe: desc table_name;

desc funcionario;

criando a tabela funcionário:


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
                    
Tabela: Funcionário, já existe???? vamos apagar

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
 
 references é a criação da foreign key (fk) ou chave estrangeira
 
 Aula 2 - criando 1 - 1
 
 Create table pessoa1 (cod_pess1 number(3) primary key,
                       nm_pess1 varchar(30) not null);
                       
 Create table pessoa2 (cod_pess2 number(3) primary key,
                       nm_pess2 varchar(30) not null,
                       fk_pess number(3) unique references pessoa1);
                       
 DML - Alteração de estrutura - tabela
 
 sintaxe: alter table table_name.....
 variações: incluir coluna: add column_name
            incluir constraint: add constraint constraint_name
            modificar tipo de dados: modify
            modificar tamanho: modify
            apagar coluna: drop column column_name
            apagar constraint: drop constraint constraint_name
            renomear coluna: rename column
            
drop table teste cascade constraints;            
            
create table teste (nome number(4));            

- incluir na tabela teste a coluna código de tipo numérica com 4 posições.
desc teste;
alter table teste add codigo number(4);

- incuir na coluna código da tabela teste a pk.
alter table teste add constraint teste_cd_pk primary key (codigo);
ou
alter table teste add primary key (codigo);

- alterar o tipo de dados da coluna nome para alfanumérico com 30 posições
alter table teste modify nome varchar(30);

- alterar o tamanho da coluna nome para 45 posições
alter table teste modify nome varchar(45);

- apagar a pk da coluna código
alter table teste drop constraint teste_cd_pk;

- apagar a coluna na código da tabela teste.
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
dados não numéricos precisam de ''

Exemplificar;

desc cargo
insert into cargo values (1,'prog. JAVA', 10000);
-- visualizando dados
select * from cargo;
insert into cargo values (2,'DBA', 12500.80);

incluir os seguintes dados na tabela cargo
3 - CEO - 25000
4 - Adm Redes - 8500
5 - Estágio - 33000

insert into cargo values (3,'CEO', 25000);
insert into cargo values (4,'Adm Redes', 8500);
insert into cargo values (5,'Estágio', 33000);

caso não tenha dados para uma ou mais colunas?????

6 - Adm. Seg - null
select * from cargo;
desc cargo
versão 1: insert into cargo values (6,'Adm. Seg', null);
versão 2: insert into cargo (cd_cargo, nm_cargo) values(7,'Adm Seg');
validando os dados
commit;

Inserir 3 linhas de dados na tabela funcionário a seu critério
desc funcionario_2024;
procurando pelo padrão de data
select sysdate from dual; -- acha a data cadastrada
insert into funcionario_2024 values (1,'Marcel','10-jan-20', 70000,'M',2);
insert into funcionario_2024 values (2,'Joana','20-dec-22',50000,'F',1);
insert into funcionario_2024 values (3,'Ricardo',sysdate,null,'M',6);
commit;
select * from funcionario_2024;
cuidado com os valores de FK, só recebe dados já cadastrado na pk
insert into funcionario_2024 values (4,'Ricardo',sysdate,null,'M',8);

Operadores aritméticos + - * / ()
           relacionais > >= < <= = <> ou !=
           lógicos and or not
           
DML - Atualização de dados




