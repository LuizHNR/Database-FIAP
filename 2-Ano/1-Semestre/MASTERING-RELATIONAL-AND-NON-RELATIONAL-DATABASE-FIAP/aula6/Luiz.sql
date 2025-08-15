set SERVEROUTPUT on 
create or replace function taxa (p_value in number)
    return number is
BEGIN
    RETURN (p_value * 0.08);
END taxa;

SELECT empno, ename, sal, taxa(sal) from emp where deptno = 10;

---------------------------------------- Outro Exemplo ------------------------------------------

SET SERVEROUTPUT ON CREATE OR REPLACE FUNCTION f (
    p_parameter_1 in number DEFAULT 1,
    p_parameter_5 in number DEFAULT 5)
return number is v_var number;

BEGIN
    v_var := p_parameter_1 + (p_parameter_5 * 2);
    return v_var;
End f;

-- => é atribuir algo

SELECT f(p_parameter_5 => 10) from dual;