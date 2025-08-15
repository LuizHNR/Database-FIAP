drop table produto;
drop table compra_prod_tem;
drop table tipo_prod;
drop table compra;

create table tipo_prod(
        cd_tipo number(4) constraint tipo_prod_cd primary key,
        nm_tipo varchar(40) constraint tipo_prod_nm_nn not null);

create table produto(
    cd_prod number(6) constraint prod_cd_pk primary key,
    nm_prod varchar(40) constraint prod_nm_nn not null,
    fk_tipo_prod_cd_tipo number(4) constraint fk_tipo_produto references tipo_prod);
    
create table comp_prod_tem(
        prod_prod_id number(4) constraint fk_prod_tem_id references compra,
        prod_prod_cd number(6) constraint fk_prod_tem_cd references produto );
        
create table compra(
        cd_compra number(4) constraint pk_cd_compra primary key,
        dt_compra date );