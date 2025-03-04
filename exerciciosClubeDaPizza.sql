-- COMO MODIFICAR UM BANCO


-- 1 – Insira um novo atendente
SELECT * FROM atendentes;
DESCRIBE atendentes;
INSERT INTO atendentes (idatendentes, nomeatendente, codigo) VALUES
	(9, 'Marcia', 'J87');
    
-- 2 – Insira uma nova pizza
SELECT * FROM pizzas;
INSERT INTO pizzas (idpizzas, sabor, preco, quantidade, quantidade_critica) VALUES
		(15, 'Palmito', '100', '2', '1');
        
-- 3 – Com a pizza inserida na questão anterior altere a quantidade crítica
-- para 5 e o preço para 50,00        

UPDATE pizzas
	SET
    quantidade_critica = 5,
    preco = 50
WHERE idpizzas = 15;

-- 4 – Mostre as pizzas ordenadas pelo preço
SELECT * FROM pizzas
	ORDER BY preco ASC;
        
 -- 5 – Mostre os pedidos ordenados por valor total do maior para o menor
 SELECT * FROM pedidos
	ORDER BY valor_total DESC;
        
-- 6 – Apague a pizza inserida na questão 2
DELETE FROM pizzas
WHERE idpizzas = 15;

-- 7 – Mostre o valor médio das pizzas
SELECT * FROM pizzas;
SELECT 
	AVG(preco) as media
FROM pizzas;
        
-- 8 – Mostre o menor valor total de pedido
 SELECT 
	MIN(valor_total)
FROM pedidos;

-- 9 – Mostre o total de pedidos realizados
SELECT * FROM pedidos;
SELECT
	COUNT(idpedidos),
    MAX(idpedidos)
FROM pedidos;
-- 10 – Mostre as datas que tiveram pedidos sem repetição
SELECT DISTINCT datapedido
FROM pedidos;

-- 11 – Mostre a quantidade de pizzas com preço acima de 50 reais
SELECT * FROM pizzas
WHERE preco > 50;

-- 12 – Mostre as pizzas cuja quantidade crítica é 5 pizzas de diferença em
-- relação a quantidade em estoque.
SELECT * FROM pizzas;
SELECT * FROM pizzas
WHERE quantidade_critica = 5;

-- 13 - Insira um novo pedido
SELECT * FROM pedidos;
INSERT INTO pedidos (idpedidos, idatendentes, idsocios, datapedido, valor_total) VALUES
	(84, 1, 1, '2025-02-02', '100');
    
SELECT * 
FROM pedidos
WHERE idpedidos = 84;
    
-- 14 - Insira itens para este pedido
INSERT INTO  itens 
	(idpedidos, idpizzas, quantidade, tipo) 
	VALUES
    ('84', '1', '3', '3' );
    

-- 15 - Modifique o preço da pizza CALABRESA para 30 reais
UPDATE pizzas
	SET 
    preco = '30'
WHERE idpizzas = 2;
    
-- 16 - Modifique os dados do atendente da questão 1 para seus dados
SELECT * FROM atendentes;

UPDATE atendentes
	SET
    nomeatendente = 'Bruna',
    codigo = 'BT2'
WHERE idatendentes = 1;

-- Parte 3- Para o banco CLINICA dado a seguir, resolva as seguintes
-- questões:
-- 1 – Adicione um novo paciente com seu nome
SELECT * FROM pacientes;
INSERT INTO pacientes
	(idpacientes, nome, sexo, idade, doenca_inicial)
VALUES
    ('39', 'Bruna', 'F', '1', 'Amar demais');

-- 2 – Adicione uma nova doença 
SELECT * FROM doencas;
INSERT INTO doencas
	(iddoencas, descricao)
VALUES
	('16', 'Preguiça');

-- 3 – Adicione um novo ambulatório
SELECT * FROM ambulatorios;
INSERT INTO ambulatorios
	(idambulatorios, numero, andar, capacidade)
VALUES
	('14', '007', '50', '2');

-- 4 – Altere o nome que você colocou na questão um para seu nome completo com idade de 30 anos
SELECT * FROM pacientes;
UPDATE pacientes SET 
	nome = 'Bruna',
    idade = '30'
WHERE idpacientes = 39;

-- 5 – Apague a doença inserida na questão 2
SELECT * FROM doencas;
DELETE 
FROM doencas
WHERE iddoencas = 16;

-- 6 – Adicione um novo funcionário. Deu certo? Se não deu certo, o que faltou?
SELECT * FROM funcionarios;
SELECT * FROM ambulatorios;
INSERT INTO funcionarios
	(idfuncionarios, idambulatorios, nome, idade, sexo, salario, cidade)
VALUES
	('20', '1', 'Bruna', '30', 'F', '7000', 'Goiânia');

-- 7 – Insira uma nova especialidade
SELECT * FROM especialidades;
INSERT INTO especialidades
	(idespecialidades, descricao)
VALUES
	('15', 'Amor');
    
-- 8 – Insira um novo médico
SELECT * FROM medicos;
INSERT INTO medicos
	(idmedicos, idambulatorios, nome, crm, salario, idade, idespecialidades)
VALUES
	('15', '1', 'Brunna Nascimento', '777', '7000', '30', '15');

-- 9 – De um aumento para 10.000 reais para o médico inserido na questão 8
UPDATE medicos SET
	salario = '17000'
WHERE idmedicos = 15;

-- 10 – Altere a capacidade do ambulatório 2 para 50
SELECT * FROM ambulatorios;
UPDATE ambulatorios SET
	capacidade = '50'
WHERE idambulatorios = 2;

-- 11 – Insira um novo paciente
SELECT * FROM pacientes;
INSERT INTO pacientes
	(idpacientes, nome, sexo, idade, doenca_inicial)
VALUES
	('40', 'Danillo', 'M', '36', 'Lindeza');








        
        


