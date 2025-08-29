Aula 1 dia 14/02/25

--Mostra o codigo de drop table de todas as tabelas que vc tem

select 'DROP TABLE' || table_name || 'cascade constraits ' ||'purge;' from user_tables;

create table turmaM(
    COL1 number
);

insert into turmaM values (1);

commit;
 
 select * from turmaM;
 
 drop table turmaM;
 
--Ver a lixeira 
 
 show RECYCLEBIN

--Ver a tabela apagada

select * from "BIN$LhmQnuz39OXgYxA8qMCQpQ==$0";


--Restaurar da lixeira

FLASHBACK table turmaM to before drop;

--Apagar definitivamente

Drop table turmaM purge;

