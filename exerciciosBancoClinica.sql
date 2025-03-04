SELECT * FROM ambulatorios;
SELECT * FROM consultas;
SELECT * FROM doencas;
SELECT * FROM especialidades;
SELECT * FROM funcionarios;
SELECT * FROM medicos;
SELECT * FROM pacientes;

-- 1. Mostre nome e sexo dos pacientes, ordenados pelo nome
SELECT nome, sexo
FROM pacientes
ORDER BY nome;

-- 2. Mostre o valor médio das idades de pacientes
SELECT 
	AVG(idade) AS ' VALOR MEDIO DAS IDADES'
FROM pacientes;

-- 3. Mostre dia e hora das consultas, ordenadas por dia
SELECT dia, hora
FROM consultas
ORDER BY dia;

-- 4. Mostre o nome e salário de médicos que ganham mais de 2000.
SELECT nome, salario
FROM medicos
WHERE salario > '2000';

-- 5. Mostre o valor total dos dos salários de médicos
SELECT SUM(salario) AS 'SALARIO TOTAL DOS MEDICOS'
FROM medicos;

-- 6. Mostre o nome dos pacientes ordenados por nome decrescente
SELECT nome AS 'Nome dos Pacientes'
FROM pacientes
ORDER BY nome DESC;

-- 7. Mostre o valor mais baixo de um salário de médico
SELECT MIN(salario) AS 'MENOR SALARIO DE UM DOS MÉDICOS'
FROM medicos;

-- 8. Mostre nome e idade e sexo de pacientes, que tem mais de 30 anos
SELECT nome, idade
FROM pacientes
WHERE idade > 30;

-- 9. Mostre o total de médicos que ganham menos de 3000
SELECT *
FROM medicos
WHERE salario < '3000' ;

-- 10. Mostre a maior idade de pacientes
SELECT 
	MAX(idade) AS 'MAIOR IDADE'
FROM pacientes;











