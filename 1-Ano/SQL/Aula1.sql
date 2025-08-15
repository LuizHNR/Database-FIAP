Aula 1 - 19/08/24

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
                                  
obs: constaint é opcional, nem todas as colunas tem

Exibindo a estrutura de uma tabela

sintaxe: desc table_name;

desc funcionario;

criando a tabela funcionário:


create table funcionario (mat_fun Number(4) Primary key,
                          nm_fun  varchar(30) Not null,
                          dt_adm  Date Not null,
                          salario Number(10,2),
                          sexo    Char(1) not null);

desc funcionario_2024;   

create table funcionario_2024
(mat_fun Number(4) constraint func_mat_pk Primary key,
 nm_fun  varchar(30) constraint func_nm_nn Not null,
 dt_adm  Date constraint func_dt_nn Not null,
 salario Number(10,2),
 sexo    Char(1) constraint func_sx_nn not null);
 
Relacionamentos: 1 - N - criando a FK

Tabela: cargo - cd_cargo - N - 4 - PK
                nm_cargo - A - 25 - Nn, Uk
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
 
 Aula 2 - 02/09/24
 
 Aula 2 - criando relacionamento 1 - 1
 
 Create table pessoa1 (cod_pess1 number(3) primary key,
                        nm_pess1 varchar(30) not null);
                        
Create table pessoa2 (cod_pess2 number(3) primary key,
                        nm_pess2 varchar(30) not null,
                        fk_pess number(3) unique references pessoa1);
                        
DML - Alteração de estrutura - tabela

sintaxe: alter table table_name.....
variações: incluir coluna: add column_name
            incluir constraint: add constraint constraint_name
            modifiar tipo de dados: modify
            modificar tamanho: modify
            apagar coluna: drop column column_name
            apagar constraint: drop constraint constraint_name
            renomear coluna: rename column
            
create table teste (nome number (4));

-incluir na tabela teste a coluna codigo de tipo numerica com 4 posições.
desc teste;

alter table teste add codigo number(4);
desc teste;

- incluir na coluna código da tabela teste a pk
alter table teste add constraint teste_cd_pk primary key (codigo);
ou
alter table teste add primary key (codigo);
desc teste;

- alterar o tipo de dados da coluna nome para alfanumérico com 30 posições
alter table teste modify nome varchar(30);
desc teste;

- alterar o tamanho da coluna nome para 45 posições
alter table teste modify nome varchar(45);
desc teste;

- apagar a pk da coluna codigo
alter table teste drop constraint teste_cd_pk;
desc teste;

- apagar a coluna na codigo da tabela teste.
alter table teste drop column codigo;
desc teste;

- renomear a coluna nome para nome_cliente
alter table teste rename column nome to nome_cliente;
desc teste;

alter table teste modify nome_cliente not null;
desc teste;

usando nulo = null
dados não numéricos precisam de ''

exemplificar

desc cargo
insert into cargo values (1, 'prog. JAVA', 1000);
-- visualizando dados
select * from cargo;
insert into cargo values (2, 'DBA', 12500.80);

insert into cargo values(3, 'CEO', 25000);
insert into cargo values(4, 'ADM REDES', 8500);
insert into cargo values(5, 'ESTAGIO', 33000);
select * from cargo;

6 - Adm. Seg - null
select * from cargo;
desc cargo
versão 1: insert into cargo values (6, 'Adm. Seg', null);
versão 2: insert into cargo (cd_cargo, nm_cargo) values (7, 'Adm Seg');
validando os dados
commit;
