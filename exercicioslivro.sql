SELECT * FROM times;
SELECT * FROM jogadores;

-- 1. Mostre nome e ano de fundação dos times, ordenados pelo nome
SELECT 
	nome, anodefundacao 
FROM times
ORDER BY nome;

-- 2. Mostre o valor médio dos times
SELECT 
	AVG(valor) AS 'MÉDIA DO VALOR DO TIME'
FROM times;

-- 3. Mostre o nome, salário e data de nascimento de jogadores do mais
-- velho para o mais novo
SELECT
	nome, salario, datanascimento
FROM jogadores
ORDER BY datanascimento ASC;

-- 4. Mostre o nome e salário de jogadores que ganham mais de 2000
SELECT
	nome, salario
FROM jogadores
WHERE salario > 2000;

-- 5. Mostre o valor total dos times
SELECT 
	SUM(valor) AS 'SOMA DOS VALORES'
FROM times;
	
-- 6. Mostre o nome dos jogadores ordenados por nome decrescente:
SELECT nome
FROM jogadores
ORDER BY nome DESC;

-- 7. Mostre o valor mais baixo de um time:
SELECT
	MIN(valor) AS 'MENOR VALOR'
FROM times;

-- 8. Mostre nome e data de nascimento para jogadores nascidos a partir do
-- ano 2000;
SELECT nome, datanascimento
FROM jogadores
WHERE datanascimento >= '2000-01-01';

-- 9. Mostre o total de jogadores que ganham menos de 3000;
SELECT nome, salario
FROM jogadores
WHERE salario < 3000;

-- 10. Mostre o maior valor de times
SELECT 
	-- nome, 
    MAX(valor) AS 'MAIOR VALOR'
FROM times;







