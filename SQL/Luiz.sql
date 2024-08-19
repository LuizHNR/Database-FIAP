Aula 1 - 19/08/24

-- comentarios de linhas
/* comentarios varias linhas */

Parte 1 - comandos DDL - estrutura

Data Definition Language

Create - cria tabelas
alter - altera estrutura pronta
drop - apaga tabelas

Tabela - Funcionario
     /* N = NUMBER
        A = VARCHAR
        D = DATA NOT NULL
        C = CHAR */
        mat_fun - N - 4 - Pk
        nm_fun - A - 30 - Nn
        dt_adm - D - Nn
        salario - N - 8,12
        sexo - C - 1 - Nn
        
Criando tabelas:
Sintaxe: creat table table_name ( column_name1 datatype(size) [constraint], 
                                column_name1 datatype(size) [constraint],
                                ..................);

obs: constaint é opcional, nem todas as colunas tem

Exibindo a estrutura de uma tabela

sintaxe: desc table_name;

desc funcionario;

criando tabela funcionario:

create table funcionario (mat_fun Number(4) Primary key,
                        nm_fun varchar(30) Not null,
                        dt_adm Date Not null,
                        salario Number(10,2),
                        sexo Char(1) not null
                        );
                        
desc funcionario_2024;

create table funcionario_2024 (
mat_fun Number(4) constraint func_mat_pk Primary key,
nm_fun varchar(30) constraint func_nm_nn Not null,
dt_adm Date constraint func_dt_nn Not null,
salario Number(10,2),
sexo char(1) constraint func_sx_nn not null
);

Relacionamentos: 1 -N - criando a FK

Tabela: cargo - cd_cargo - N - 4 - PK
                -- Uk = Unique --
                nm_cargo - A - 25 - Nn, Uk
                salario - N - 8,2
                
create table cargo(
cd_cargo number(4) constraint cargo_cd_pk Primary key,
nm_cargo varchar(25) constraint cargo_nm_nn not null
                    constraint cargo_nm_uk unique,
salario number(10,2)
);
                
Tabela: Funcionario, já existe???? vamos apagar

Apagando uma tabela sem relacionamento

sintaxe: drop table table_name;

drop table funcionario_2024;

create table funcionario_2024 (
mat_fun Number(4) constraint func_mat_pk Primary key,
nm_fun varchar(30) constraint func_nm_nn Not null,
dt_adm Date constraint func_dt_nn Not null,
salario Number(10,2),
sexo char(1) constraint func_sx_nn not null,
fk_cargo  Number(4) constraint func_cargo_fk references cargo
);

obs fk: column_name datatype(syze) [constraint] references table_name

references é a criação da foreign key (fk) ou a chave estrangeira

Tabela: peca - id_peca - N - 6 - PK
                nm_peca - A - 50 - Nn, Uk
                qte - N - 6,2 - Nn
                preco - N - 8,2
                

create table Peca (
id_peca Number(6) constraint peca_id Primary key,
nm_peca varchar constraint peca_nm_nn Not null
                constraint peca_nm_uk,
qte Number(6,2) constraint peca_qte_nn Not null,
preco Number(8,2)
);

create table Venda(
n_venda Number(6) constraint num_venda_pk Primary key,
dt_venda Date constraint dat_venda_nn Not null,
total_venda Number(10,2) constraint tt_venda_nn Not null
);
                        