Aula 6 - 14/10/24 - Relatórios

Recriando nosso sistema

operadores de banco de dados

----------------------------------------------Aula-----------------------------------------------------------------

Criar um relatório que exiba todos os dados dos clientes de código 100 até 600(inclusive)
Tradicional: SELECT * FROM CLIENTE WHERE COD_CLIE >= 100 and cod_clie <= 600;
Op. de Bd: BETWEEN -- BETWEEN = Entre
SELECT * FROM CLIENTE WHERE COD_CLIE BETWEEN 100 and 600;

-------------------------------------------Atividade----------------------------------------------------------------

Crie um relatório que exiba o nome dos clientes que estejam no intervalo de 'A' até 'p'
-- SELECT NOME_CLIE from CLIENTE WHERE NOME_CLIE >= 'A' and NOME_CLIE <= 'Q'
SELECT NOME_CLIE from CLIENTE WHERE NOME_CLIE BETWEEN 'A' and 'Q';

----------------------------------------------Aula--------------------------------------------------------------------

Gerar um relatório que mostre o nome do CLIENTE, o estado onde mora, desde que seja do estado: SP, RJ, MG
Tradicional: SELECT * from CLIENTE WHERE uf = 'SP' or uf = 'RJ' or uf = 'MG';
Oo. de Bd: in(list) -- Em lista, Na lista
SELECT * from CLIENTE WHERE uf in('SP','RJ','MG');

------------------------------------------Atividade------------------------------------------------------------------

Crie um relatorio que mostre os clientes de codigo: 870,110,830,157.
SELECT * FROM CLIENTE WHERE COD_CLIE in(870,110,830,157) ORDER BY 1;

Criar um relatório que mostre os clientes no intervalo de codigo entre 100 e 300 e 500 e 700;
SELECT * from cliente WHERE COD_CLIE BETWEEN 100 and 300 or COD_CLIE BETWEEN 500 and 750;

Quem são os produtos com unidade de medida: kg, M?
SELECT * from PRODUTO WHERE UNIDADE in('KG','M');

quais pedidos possuem codigo entre 50 e 150 e são dos vendedores de codigo 209, 101
SELECT * from PEDIDO WHERE NUM_PEDIDO BETWEEN 50 and 150 and COD_VEN in(209,101);

---------------------------------------------------Aula--------------------------------------------------------------

Negação: NOT
not BETWEEN, not IN

Quem são os produtos que não tenham unidade de medida: KG, M?
SELECT * from produto WHERE unidade not in ('KG','M');

Criar um relatório que exiba todos os dados dos clientes que não pertencem ao intervalo de codigo 100 até 600
SELECT * FROM CLIENTE WHERE COD_CLIE not BETWEEN 100 and 600;

----------------------------------------------------Aula-------------------------------------------------------------

Quem são os clientes que possuem em seu nome a letra 'A'?
SELECT NOME_CLIE from CLIENTE WHERE NOME_CLIE LIKE '%a%' or NOME_CLIE LIKE'%A%'

Quem são os clientes que possuem em seu nome a letra 'A' no final?
SELECT NOME_CLIE from CLIENTE WHERE NOME_CLIE LIKE '%a'

Quem são os clientes que possuem em seu nome a letra 'A' no inicio?
SELECT NOME_CLIE from CLIENTE WHERE NOME_CLIE LIKE 'A%'

Quem são os clientes que possuem 5 letras em seu nome?
SELECT NOME_CLIE from CLIENTE WHERE NOME_CLIE LIKE '_____';

Quem são os clientes que possuem na penultima posição do seu nome a letra 'a'?
SELECT NOME_CLIE from CLIENTE WHERE NOME_CLIE LIKE '%a_';

not like = Negaçãoquem

Quem são os clientes que não possuim a letra 'a' em seu namo?
SELECT NOME_CLIE from CLIENTE WHERE NOME_CLIE not LIKE '%a_';

------------------------------------------------------Atividade----------------------------------------------------

Mostre o nome dos lientes que possuem a letra 'i' ou a letra 'o' em seu nome
SELECT NOME_CLIE from CLIENTE WHERE NOME_CLIE LIKE'%i%' and NOME_CLIE not LIKE'%o%' or NOME_CLIE like'%o%' and NOME_CLIE not LIKE'%i%';

------------------------------------------------------Aula----------------------------------------------------------

Operadores matemaricos de grupo

Mostre quantos clientes existem na tabela cliente.
SELECT * FROM CLIENTE;
SELECT COD_CLIE from CLIENTE;
SELECT COUNT(COD_CLIE) from CLIENTE;

COUNT - contator, opções * ou coluna

SELECT COUNT(*) from CLIENTE; -- Retorna a coluna com maior resultado
SELECT COUNT(*), count(cep) from CLIENTE;

-------------------------------------------------------Atividade----------------------------------------------------

Quantos clientes são do estado de são paulo

SELECT COUNT(COD_CLIE) FROM CLIENTE where uf in 'SP';

----------------------------------------------------Aula------------------------------------------------------------

SELECT max(SALARIO_FIXO) "Maior Valor", 
min(SALARIO_FIXO) "Menor Valor", 
avg(SALARIO_FIXO) "Media salarial",
sum(SALARIO_FIXO) "Somatória"
FROM VENDEDOR;


-----------------------------------------------------Aula--------------------------------------------------------------

Aula 6 - 14/10/24 - Relatórios´

Criar um relatório que exiba quantos clientes existem por estado

select uf from cliente order by 1;

usando agrupamento

select uf, count(uf) from cliente group by uf order by 1;

Quantos vendedores existem por comissão?

select comissao, count(COMISSAO) from VENDEDOR group BY COMISSAO;

quantos pedidos existem por VENDEDOR?

SELECT COD_VEN, count(NUM_PEDIDO) from PEDIDO group by COD_VEN order by 1;

select * from pedido where cod_ven = 11;
