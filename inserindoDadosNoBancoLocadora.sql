-- PARTE B - INSERÇÃO DE DADOS - LOCADORA - (FAZER NA ORDEM ESTABELECIDA)
-- 1. Insira 10 carros com todos os atributos.
INSERT INTO carros
	(placa, YEAR, cor)
    VALUES
    ('KUT4578', '2000', 'vermelho'),
    ('KIT8512', '2007', 'verde'),
    ('POI9658', '2001', 'azul'),
    ('FER2541', '1992', 'branco'),
    ('ASD3214', '1993', 'cinza'),
    ('POE5284', '2015', 'prata'),
    ('AKO8514', '2011', 'rosa'),
    ('POQ3517', '2013', 'amarelo'),
    ('PEF5478', '2008', 'verdeesmeralda'),
    ('VFR4512', '2010', 'preto');

-- 2. Insira 6 clientes
INSERT INTO clientes
	(nome, CPF, datadenascimento, cnh, ddd)
    VALUES
    ('Bianca', '45815342681', '2004-03-15', '456123851', '12'),
    ('Sara', '45815342682', '2002-03-16', '456123852', '98'),
    ('Maria', '45815342683', '1997-03-17', '456123853', '17'),
    ('Elena', '45815342684', '1992-03-18', '456123854', '11'),
    ('Tais', '45815342685', '2003-03-19', '456123855', '63'),
    ('Rosa', '45815342686', '1996-03-20', '456123856', '14');

-- 3. Insira 2 telefones para cada cliente cadastrado.
INSERT INTO telefones
	(numero, idcliente)
    VALUES
    ('985412356, 965234512', '1'),
    ('985421254, 962258541', '2'),
    ('963256325, 985544541', '3'),
    ('963365236, 987874545', '4'),
    ('921255412, 965658541', '5');

-- 4. Insira 10 aluguéis de carros por clientes (tabela aluguel).
INSERT INTO aluguel
	(idcarro, idcliente, dataaluguel, datafinal, valor)
    VALUES
    ('1' ,'1', '2025-02-01', '2025-03-01', '100');

-- 5. Remova o último telefone informado.
DELETE FROM telefones
WHERE idtelefone = 5;

-- 6. Altere a data do penúltimo aluguel registrado para 30/06/2021.
UPDATE aluguel SET
	datafinal = '2021-06-30'
WHERE idcarro = 1;

-- 7. Altere os dados do terceiro cliente para o nome de um dos seus avós.
UPDATE clientes SET
	nome = 'Marlene'
WHERE idcliente = 3;

-- 8 . Insira um aluguel para o primeiro carro cadastrado e o último cliente com a data de hoje.
SELECT * FROM aluguel;
INSERT INTO aluguel
	(idcarro, idcliente, dataaluguel, datafinal, valor)
    VALUES
    ('1', '6', '2025-03-03', '2025-04-03', '100');

-- 9. Remova o primeiro telefone cadastrado.
DELETE FROM telefones
WHERE idtelefone = 1;

-- 10 Insira 2 novos clientes.
INSERT INTO clientes
	(nome, CPF, datadenascimento, cnh, ddd)
    VALUES
    ('Tereza', '65236514525', '1998-01-09', '895562125', '97'),
    ('Roberta', '65845225478', '1992-08-28', '256852145', '81');
    
    
    
-- PARTE C - SELEÇÃO DE DADOS PARA O BANCO
-- LOCADORA
-- 1. Mostre os dados dos clientes ordenados pelo nome.
-- 2. Mostre o total dos carros agrupados pela cor.
3. Mostre o total de alugueis por clientes.
4. Mostre os clientes que nunca alugaram carros.
5. Mostre os 3 clientes mais velhos.
6. Mostre os clientes cujo nome em alguma parte tenha a letra "o".
7. Mostre o valor total de aluguel por carro.
8. Mostre o valor total de aluguel por data do aluguel.

