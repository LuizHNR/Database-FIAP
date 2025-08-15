--para ativar os prints, só uma vez por sessão, então tem q fazer sempre q sair da sessão se quiser
set serveroutput on

--DECLARE É PARA CRIAR AS VARIAVEIS

Declare

--Convenção eles criam as variaveis com o começo de V

-- : é o de atribuição no que é o +

--& para aparecer o uma caixa de dialogo, exemplo: &Mensagem ou &nome, aparece na caixa de dialogo o que vc colocar na frente do &

V_NOME varchar2(30) := '&NOME';
V_NUMERO NUMBER(9,2) :=&Numero;


--Obrigatorio begin para começar o pl/sql
Begin
    
--Codigo para dar print
    --Concatenação ||
    dbms_output.put_line(V_NOME || ' ' || v_numero);
    dbms_output.put_line(V_NUMERO);
    
--Obrigatorio end para finalizar o pl/sql    
end;