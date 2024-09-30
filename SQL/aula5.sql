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