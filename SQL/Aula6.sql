Aula 6 - 14/10/24 - Relatórios

Recriando nosso sistema

operadores de banco de dados

--------------------------------------------------------------------------------------------------------------------
Criar um relatório que exiba todos os dados dos clientes de código 100 até 600(inclusive)
Tradicional: SELECT * FROM CLIENTE WHERE COD_CLIE >= 100 and cod_clie <= 600;
Op. de Bd: BETWEEN -- BETWEEN = Entre
SELECT * FROM CLIENTE WHERE COD_CLIE BETWEEN 100 and 600;

-------------------------------------------Atividade----------------------------------------------------------------
Crie um relatório que exiba o nome dos clientes que estejam no intervalo de 'A' até 'p'
-- SELECT NOME_CLIE from CLIENTE WHERE NOME_CLIE >= 'A' and NOME_CLIE <= 'Q'
SELECT NOME_CLIE from CLIENTE WHERE NOME_CLIE BETWEEN 'A' and 'Q';

----------------------------------------------------------------------------------------------------------------------
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