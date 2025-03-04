-- INSERINDO DADOS NO BANCO DE VENDAS E EXERCICIOS

-- Parte 2 - Exercícios para o Banco Vendas:
-- 1. Insira 4 clientes
INSERT INTO cliente
	(nome, endereco, complemento, cep, genero, telefone, UF)
    VALUES
    ('Eduardo','Rua Sabão', 'Pertinho', '74786002', 'M', '00000000001', 'TO'),
    ('Arthur', 'Rua Lama', 'Bem ali', '74786001', 'M', '00000000002', 'GO'),
    ('Zenir', 'Rua Algodão', 'Logo ali', '74786001', 'F', '00000000003', 'MA'),
    ('Bruna', 'Rua Lisa', 'Chegou', '74786001', 'F', '00000000004', 'PA');
    
TRUNCATE TABLE cliente; -- (O comando TRUNCATE não pode ser usado em tabelas que estão sendo referenciadas por chaves estrangeiras, pois o TRUNCATE remove todos os registros da tabela de forma rápida e sem a possibilidade de reversão. Isso pode causar problemas de integridade referencial se a tabela cliente estiver vinculada a outra tabela (no caso, fatura) por meio de uma chave estrangeira.)
SET FOREIGN_KEY_CHECKS = 0; -- Você pode desabilitar a restrição de chave estrangeira temporariamente, para então executar o comando TRUNCATE na tabela cliente.

-- 2. Insira 3 vendedores
INSERT INTO vendedor
	(nomevendedor, datacontratacao, salario, comissao)
	VALUES
    ('Moacir', '2010-02-18', '2500', '4'),
    ('Inercio', '2006-10-21', '2000', '2'),
    ('Jaime', '2004-09-13', '2500', '4');

-- 3. Exclua o último cliente inserido
DELETE FROM vendedor
WHERE idvendedor = 3;

-- 4. Insira uma nova fatura com o primeiro vendedor inserido, e o segundo cliente
INSERT INTO fatura
	(datafatura, idcliente, idvendedor, valor, cpf)
    VALUES
    ('2025-03-03', '2', '1', '5000', '00000000001');

-- 5. Modifique os dados do segundo vendedor
SELECT * FROM vendedor;
UPDATE vendedor
	SET
    nomevendedor = 'Mateus',
    datacontratacao = '2025-01-01',
    salario = '5000',
    comissao = '2.5'
WHERE idvendedor = 2;

-- 6. Dê um aumento de 20% a todos os vendedores
UPDATE vendedor
	SET 
    salario = salario * 1.20; 
    -- obs: Não consegui alterar o salario de todos os registros pois apareceu ...
-- O erro "Error Code: 1175. You are using safe update mode..." ocorre porque o MySQL está em "Safe Mode" (Modo Seguro). Esse modo impede a execução de um UPDATE ou DELETE sem um WHERE que utilize uma chave primária ou índice para evitar a modificação acidental de todos os registros da tabela.
-- Se você realmente deseja atualizar todos os registros da tabela, pode desativar o modo seguro apenas para essa sessão usando:
	SET SQL_SAFE_UPDATES = 0;
-- Por fim, reabilite o modo seguro para evitar alterações indesejadas no futuro:
	SET SQL_SAFE_UPDATES = 1;

-- 7. Insira uma nova fatura com o segundo vendedor e o primeiro cliente
INSERT INTO fatura
	(datafatura, idcliente, idvendedor, valor, CPF)
    VALUES
    ('2040-05-25', '1', '2', ' 1000.50', '25812345625');

-- 8. Mostre os vendedores(clientes) do sexo feminino
SELECT *
FROM cliente
WHERE genero = 'F';

-- 9.Mostre os valores das faturas do mais alto para o mais baixo
SELECT * FROM fatura
ORDER BY valor ASC;

-- 10. Mostre as cidades (UF) dos clientes em ordem alfabética
SELECT * FROM cliente
ORDER BY UF ASC;

-- 11. Mostre o valor total em faturas
SELECT 
	SUM(valor) AS 'TOTAL FATURAS'
FROM fatura;

-- 12. Mostre o menor salário de vendedor
SELECT
	MIN(salario) AS 'MENOR SALARIO'
FROM vendedor;

-- 13. Mostre as faturas emitidas entre o ano de 2000 e 2010.
SELECT * FROM fatura
WHERE datafatura BETWEEN '2000-01-01' AND '2100-01-01'; -- datas devem estar entre aspas e sempre do menor para o maior

-- Questões Práticas
-- Parte 1 - Exercícios de Fixação para o Banco Vendas

-- 1. Liste as tabelas do banco VENDAS, exibido neste capítulo.
SHOW TABLES;

-- 2. Descreva cada uma das tabelas
DESCRIBE cliente; 
DESCRIBE vendedor;
DESCRIBE fatura;

-- 3. Adicione o atributo telefone para clientes
ALTER TABLE cliente ADD telefone VARCHAR(13);

-- 4. Modifique o atributo cep para varchar(10)
ALTER TABLE cliente MODIFY cep VARCHAR(10);

-- 5. Adicione o atributo sexo para vendedores do tipo ENUM com os valores ‘F’ ou ‘M’
ALTER TABLE cliente CHANGE sexo genero ENUM('M', 'F');

-- 6. Adicione o atributo hora na tabela fatura. O formato de hora é ‘HH:mm’
ALTER TABLE fatura ADD hora TIME;

-- 7. Remova o atributo inserido na questão anterior
ALTER TABLE fatura DROP hora;

-- 8. Adicione o atributo valor do tipo Double na tabela faturas
ALTER TABLE fatura ADD valor DOUBLE;

-- 9. Renomeie o atributo nome (tabela vendedor) para “nomevendedor”
ALTER TABLE vendedor CHANGE nome nomevendedor VARCHAR(50);

-- 10. Modifique o endereço para varchar(200)
ALTER TABLE cliente MODIFY endereco VARCHAR(200);

-- 11. Adicione um atributo UF com dois caracteres na tabela clientes.
ALTER TABLE cliente ADD UF CHAR(2);

-- 13. Adicione o atributo CPF na tabela Faturas
ALTER TABLE fatura ADD CPF VARCHAR(11);

-- 14. Remova o atributo CPF da tabela Faturas
ALTER TABLE fatura DROP CPF;

-- 15.Altere a comissão na tabela VENDEDORES para Double
ALTER TABLE vendedor MODIFY comissao DOUBLE;

-- 16. Modifique o atributo cep para varchar(10)
ALTER TABLE cliente MODIFY cep VARCHAR(10);


