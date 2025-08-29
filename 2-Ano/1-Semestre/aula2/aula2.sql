-- Aula2 21/02/2025

SET SERVEROUTPUT ON

Declare

--  Pegando o tipo direto da tabela sem ter que ficar dizendo qual é
    v_nome emp.ename%TYPE := 'Presunto';
    v_sal emp.sal%TYPE := 1000.72;
    v_hoje DATE := SYSDATE;
    v_hoje v_hoje%TYPE := SYSDATE + 1;
    
BEGIN

--  L é o $ quando printar vai mostrar o $*****,**
    DBMS_OUTPUT.PUT_LINE(v_nome || ' recebe ' || to_char(v_sal,'L9999.00') || v_hoje);
    
--  Jeito errado  
--  select ename from emp where sal > 3000

--  Fazendo uma consulta de dois valores
    select ename, sal into v_name, v_sal from emp where sal > 3000;

    v_hoje := v_hoje +1;
    
    DBMS_OUTPUT.PUT_LINE(v_nome || v_sal || v_hoje);
    
END;
