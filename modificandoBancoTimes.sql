-- INSERT, DELETE, UPDATE 
-- INSERT - ADICIONAR UM REGISTRO

USE bancotimes;
SELECT * FROM times;
SELECT * FROM jogadores;
DESCRIBE times;
DESCRIBE jogadores;

INSERT INTO times 
	(nome, valor, anodefundacao)
	VALUES 
	('Vasco', 50000000, 1891), 
	('Benfica', 400000, 1910), 
	('Barcelona', 100000, 1899);
    
SELECT * 
FROM times;

-- CHAVE ESTRANGEIRA (Chaves estrangeiras geram
-- uma relação de dependência.)

-- Em outras palavras, você está tentando inserir um jogador, cujo valor de
-- chave estrangeira se refere a um time que não existe. Não podemos inserir
-- um jogador, sem que ele pertença a algum time, já cadastrado. Sendo assim,
-- muito cuidado com tabelas que possuem chaves estrangeiras
INSERT INTO jogadores
	(nome, salario, datanascimento, idtimes)
    VALUES
    ('Captu', 10000, '1999-01-10', 18);

-- DELETE (excluir registro, dados de um registro ou um conjunto de registros)
-- exclusao pela chave primeira - boa prática
-- você não pode excluir um registro que ainda tem
-- pessoas associados a ele por chave estrangeira

DELETE FROM times
WHERE idtimes = 7;
SELECT * 
FROM times;

-- UPDATE - atualizar dados, linha ou regristro - modificar
UPDATE times
	SET 
    nome='Novo Bahia',
    valor=100000000
WHERE idtimes = 1;
SELECT * FROM times;

-- 
-- 
DELETE FROM times
WHERE idtimes = 1;

-- 1. Insira um novo time com dados a sua escolha
INSERT INTO times
	(nome, valor, anodefundacao)
	VALUES
    ('Cativeiro', 2, 0001);
    
SELECT * FROM times;

 -- 2. Insira um novo jogador no Flamengo
 SELECT * FROM jogadores;
 SELECT * FROM times;
 INSERT INTO jogadores
	(nome, salario, datanascimento, idtimes)
    VALUES
    ('Cicatriz', 80000000, '2000-01-31', 2);
    
-- 3. Insira um novo jogador no Vasco
INSERT INTO jogadores
	(nome, salario,datanascimento, idtimes)
    VALUES
    ('Mijôncio', 895210, '8000-01-31', 5);

-- Atualize o valor do Vasco para 100000
UPDATE times
	SET
    valor = 100000
WHERE idtimes = 5;
SELECT * FROM times;

-- Atualize o nome atual do Bahia para EC Bahia
UPDATE times
	SET
    nome = 'EC Bahia'
WHERE idtimes = 1;
-- Remova o time inserido na questão 1
DELETE FROM times
WHERE idtimes = 8;
-- Remova o jogador inserido na questão 3
SELECT * FROM jogadores;
SELECT * FROM times;
DELETE FROM jogadores
WHERE idjogadores = 15;

-- 8. Remova o jogador KAKA
DELETE FROM jogadores
WHERE idjogadores = 7;






-- verifique quantos jogadores são do time Novo Bahia:
SELECT jogadores.nome, times.nome AS nome_time
FROM jogadores
INNER JOIN times ON jogadores.idtimes = times.idtimes;


-- verifique quantos jogadores há em cada time
SELECT COUNT(jogadores.nome), times.nome AS nome_time
FROM jogadores
INNER JOIN times ON jogadores.idtimes = times.idtimes
GROUP BY times.nome;
	





