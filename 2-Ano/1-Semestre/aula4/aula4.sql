-- Aula4
-- 20 de Fevereiro de 2025

SET SERVEROUTPUT ON

------------------------parte 1----------------------------

DECLARE
    v_media number (9,2) :=0;
    v_conta number (5) :=0;
BEGIN 
    select AVG(sal) INTO v_media FROM emp;
    update emp set sal = sal * 1.10 where sal < v_media;
-- Retorna a quantidade de linhas afetadas
    v_conta := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE(v_conta || ' linhas atualizadas ');
END;

-- retorna para o ultimo commit
rollback;

------------------------parte 2----------------------------

DECLARE
    v_maior number (9,2) :=0;
BEGIN
    select max(sal) into v_maior from emp;
    insert into emp (EMPNO, sal) values (4000, v_maior + 1000);
END;

select * from EMP where empno = 4000;
rollback;

------------------------parte 3----------------------------


select * from dd;
truncate table dd;
rollback;

------------------------Explicação aula----------------------------

avg = media de algo 
max = o maximo de algo

SQL%ROWCOUNT = Retorna a quantidade de linhas afetadas
truncate apaga tudo de uma vez

rollback ele retorna para o ultimo commit
