-- Aula3
-- 20 de Fevereiro de 2025


SET SERVEROUTPUT ON

DECLARE
    v_nome emp.ename%TYPE := '&TEXTO';
    v_valor NUMBER := 0;
    
-- Formatando a data    
--  v_niver DATE := TO_DATE('11/10/2005', 'DD/MM/YYYY');
    v_niver DATE := TO_DATE('&NASCIMENTO', 'DD/MM/YYYY');

BEGIN

/*
    Length para saber o tamanho de algo
    v_valor:= LENGTH(v_nome);
    
    DBMS_OUTPUT.PUT_LINE(v_nome || ' tem ' || v_valor || ' letras');
    DBMS_OUTPUT.PUT_LINE('Você nasceu dia ' || to_char(v_niver, 'DD'));
    DBMS_OUTPUT.PUT_LINE('Era uma: ' || to_char(v_niver, 'day'));
    DBMS_OUTPUT.PUT_LINE(v_niver);
    
    MONTHS_BETWEEN valor entre meses e Round é arredondar
    v_valor := Round(MONTHS_BETWEEN(SYSDATE, v_niver));
    DBMS_OUTPUT.PUT_LINE('Você viveu: ' || v_valor);
*/
    select ename, sal INTO v_nome, v_valor from emp where sal > 3000;
    
    DECLARE
        v_nome VARCHAR2(30) := 'Maria';
    BEGIN
        v_valor := v_valor + 1;
    END;
    
END;