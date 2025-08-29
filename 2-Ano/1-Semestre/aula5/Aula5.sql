DECLARE 
    v_maior emp.sal%TYPE := 0;
    v_emo emp.emp%TYPE := 0;
    v_cont number := 1;
    v_deptno emp.deptno%Type := &numero;
BEGIN
    select max(sal), max(empno) into v_maior, v_emp from emp;
    
    if v_maior > 3000 then 
        while v_cont < 5 loop
            insert into EMP (EMPNO,SAL) values (v_emp + v_cont, v_maior);
            v_cont := v_cont + 1;
        end loop;
/*        
        for i in 1..4 loop
            insert into EMP (EMPNO,SAL) values (v_emp + i, v_maior);
        end loop; 
*/    
/*        
        case v_deptno
            when 10 then BMS_OUTPUT.PUT_LINE('Você escolheu 10');
            when 10 then BMS_OUTPUT.PUT_LINE('Você escolheu 20');
            when 10 then BMS_OUTPUT.PUT_LINE('Você escolheu 30');
            when 10 then BMS_OUTPUT.PUT_LINE('Você escolheu 40');
            when 10 then BMS_OUTPUT.PUT_LINE('Você escolheu 50');
            else BMS_OUTPUT.PUT_LINE('Tentar novamente');
        end loop; 
*/  
    end if;
END;