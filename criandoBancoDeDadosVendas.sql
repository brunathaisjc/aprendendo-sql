-- CRIANDO BANCO DE DADOS
-- CRIANDO TABELAS E ATRIBUTOS

CREATE DATABASE vendas;
USE vendas;
SHOW TABLES;

CREATE TABLE vendedor(
idvendedor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (50) NOT NULL,
datacontratacao DATE, 
salario FLOAT DEFAULT 7000,
comissao FLOAT 
);

CREATE TABLE cliente(
idcliente INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
endereco VARCHAR(50) NOT NULL,
complemento VARCHAR (100),
cep VARCHAR(8) NOT NULL
);

CREATE TABLE fatura(
idfatura INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
datafatura DATE,
idcliente INT UNSIGNED NOT NULL, 
FOREIGN KEY(idcliente) REFERENCES cliente(idcliente),
idvendedor INT UNSIGNED NOT NULL,
FOREIGN KEY(idvendedor) REFERENCES vendedor(idvendedor)
);

-- MODIFICANDO ATRIBUTOS/ESTRUTURA DE TABELAS (alterar parte da estrutura)
ALTER TABLE cliente ADD telefone VARCHAR (13); -- adicionando o atributo 'telefone', na tabela cliente
ALTER TABLE cliente DROP telefone; -- removendo o atributo 'telefone', da tabela cliente
ALTER TABLE cliente MODIFY endereco TEXT; -- modificando o tipo do atributo 'endereco' para TEXT, da tabela cliente (altera o tipo de dado e domínio)
ALTER TABLE cliente CHANGE endereco municipio VARCHAR(100); -- renomeando o atributo 'endereco' para 'municipio' juntamente com o tipo, na tabela cliente
-- (o CHANGE modifica o nome e o tipo do atributo)

DROP DATABASE vendas; -- apagar banco de dados
DROP TABLE vendas; -- apagar a estrutura de uma tabela 
TRUNCATE TABLE vendas; -- limpar dados de uma tabela

sexo ENUM('m', 'f'); -- o tipo ENUM(enumeração) serve para predefinir uma lista de valores
ALTER TABLE cliente ADD sexo ENUM('M', 'F');
DESCRIBE cliente;
DESCRIBE fatura;
DESCRIBE vendedor;


-- Agora conhecemos duas formas de criar atributos:
	-- CREATE TABLE : no momento da criação da tabela
    -- ALTER TABLE ADD: ou depois fazendo pontuações específicas com o ALTER

-- se a tabela tiver preenchida com dados pode haver perda de dados, problemas de conversão de tipos e outros erros por isso é preciso cautela ao usar ALTER TABLE e suas variantes com o banco de dados em produção.

Questões teóricas
1. Qual o comando para criar um banco de dados?
R: CREATE DATABASE nomedatabela

2. Qual o comando para selecionar o banco a ser usado?
R: USE nomedobanco

3. Qual o comando para apagar a estrutura de um banco de dados?
R: DROP DATABASE nomedobanco

4. Explique a diferença de chave primária para chave estrangeira. Qual a
relação das tabelas originais?
R: a 'chave primária' é: ('identifica um registro de forma única na tabela')
	-um identificador único; não pode ser nulo, garante a unicidade de cada linha na tabela
a 'chave estrangeira': ('relaciona duas tabelas, referenciando a chave primária de outra tabela')
	-pode ter valores duplicados (se não for UNIQUE); pode ser NULL (dependendo da regra de integridade); garante que os valores referenciados existam na tabela original
A relação pode ser:
	-de 1 para muitos(1:N)
    -de muitos para muitos(N:N)

5. Quais os principais tipos de dados para atributos de uma tabela?
R: INT, VARCHAR(), CHAR(), FLOAT, DATE

6. Qual o significado de UNSIGNED?
R: serve para especificar que o campo não pode armazenar valores negativos, apenas valores positivos
(por padrão os tipos numéricos INT, TINYINT, BIGINT podem armazenar valores positivos e negativos. Se adicionarmos UNSIGNED, o intervalo disponível dobra no lado positivo porque não precisamos reservar espaço para números negativos.)

7. Para que serve o NOT NULL? Qual seu significado?
R: para garantir que o atributo tenha um valor, ou seja, o valor não pode ser nulo.

8. O que é o AUTO_INCREMENT?  
R: é usado para gerar valores automáticos e sequenciais em uma coluna, geralmente aplicada a chaves primárias 
Ele incrementa automaticamente o valor do campo quando um novo registro é inserido.
O primeiro valor padrão é 1, e cada novo registro recebe um valor incrementado em +1.
Por padrão, o MySQL começa do 1, mas podemos definir outro valor:
	ALTER TABLE clientes AUTO_INCREMENT = 100;
    
8.1. Para que serve?
Garante que cada registro tenha um identificador único.
Evita a necessidade de inserir manualmente um ID único.
Muito utilizado para chaves primárias (PRIMARY KEY).

8.2. É possível dois atributos numa mesma tabela usar esse recurso?
Apenas uma coluna por tabela pode ter AUTO_INCREMENT.
Isso acontece porque o MySQL não tem suporte para mais de uma sequência automática dentro da mesma tabela.

9. Como eu defino uma chave primária na criação de uma tabela?
Demonstre com um exemplo.
Ex: 'idcliente INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY'

10. Como eu defino chaves estrangeiras numa tabela? Precisamos criar
antes os atributos? Por quê?
Precisamos primeiramente ter as chaves primárias dentro da tablela principal.
Em outra tabela podemos referenciar essas chaves assim:
Ex: idcliente INT UNSIGNED NOT NULL -- este comando só cria o atributo
FOREIGN KEY(idcliente) REFERENCES cliente(idcliente); -- este comando cria as chaves

11. Explique o comando de criação de chaves estrangeiras numa tabela.
Primeiro deve usar o comando FOREIGN KEY(nomedacoluna) o comando REFERENCES nomedatabela(nomedacoluna)
A notação básica é dizer o nome do atributo na tabela atual que será a chave estrangeira. No REFERENCES informar a tabela de origem e entre parênteses, o nome do atributo na tabela de origem.

12. Qual o comando para apagar a estrutura de uma tabela? Podemos
apagar uma tabela com dados?
DROP TABLE nomedatabela; 
é possível apagar tudo com este comando
mas se quiser apagas apenas os dados da tabela use o comando 
TRUNCATE TABLE nomedatabela;

13. Qual a diferença entre DELETE e DROP?
o DELETE ele remove um valor dentro de um atributo usando o WHERE,um registro ou todos os dados da tabela (DELETE FROM nomedatabela;)
O comando DROP é mais drástico, pois exclui completamente a tabela, incluindo seus dados e estrutura. DROP TABLE nomedatabela; Isso deleta a tabela completamente do banco de dados! Não pode ser desfeito facilmente. Remove todos os registros e a própria tabela do banco de dados.

DELETE -- REMOVE OS REGISTROS DA TABELA
DROP -- EXCLUI A TABELA INTEIRA, SUA ESTRUTURA E DADOS

14. Para que serve o comando TRUNCATE?
R: Para limpar os dados da tabela sem precisar apagar a estrutura.

15. Para que serve o comando ALTER TABLE? Quais são algumas das possibilidades que esse comando nos dá em relação à tabelas?
R: este comando serva para modificar a estrutura de uma tabela existente. ele permite adicionar, remover ou alterar colunas e restrições sem precisar recriar a tabela do zero.

16. Demonstre num exemplo para ALTER TABLE, a adição de um novo atributo.
R: sintaxe: ALTER TABLE nomedatabela ADD nomedoatributo tipo
ex: ALTER TABLE cliente ADD nome VARCHAR(50);

17. Demonstre num exemplo para ALTER TABLE, a remoção de um
atributo.
ex: ALTER TABLE cliente DROP nome; 

18. Demonstre num exemplo para ALTER TABLE, a modificação de
tipo de atributo.
ex: ALTER TABLE cliente MODIFY sexo INT

19. Demonstre num exemplo para ALTER TABLE, a modificação de
nome de atributo.
ex: ALTER TABLE cliente CHANGE sexo genero ENUM('M', 'F');

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

-- PARTE A - CRIAÇÃO DE TABELAS E ATRIBUTOS
-- a) Crie o banco (LOCADORA) conforme o modelo na ordem correta das tabelas.


CREATE DATABASE locadora;
USE locadora;

CREATE TABLE carros(
idcarro INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
placa VARCHAR(45),
ano VARCHAR(45),
cor VARCHAR(45)
);

CREATE TABLE clientes(
idcliente INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
CPF VARCHAR(45),
datanascimento DATE
);

CREATE TABLE telefones(
idtelefone INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
numero VARCHAR(45),
idcliente INT UNSIGNED NOT NULL, FOREIGN KEY(idcliente) REFERENCES clientes(idcliente)
);

CREATE TABLE aluguel(
idcarro INT UNSIGNED NOT NULL, FOREIGN KEY(idcarro) REFERENCES carros(idcarro),
idcliente INT UNSIGNED NOT NULL, FOREIGN KEY(idcliente) REFERENCES clientes(idcliente),
dataaluguel VARCHAR(45),
datafinal DATE
);

-- 1. Altere o atributo placa (carro) para VARCHAR(12), obrigatório e único.
ALTER TABLE carros MODIFY placa VARCHAR(12);

-- 2. Adicione o atributo modelo para carro.
ALTER TABLE carros ADD modelo VARCHAR(45);

-- 3. Altere o atributo ano para YEAR.
ALTER TABLE carros CHANGE ano YEAR INT;

-- 4 . Remova o atributo adicionado na questão 2.
ALTER TABLE carros DROP modelo;

-- 5 . Altere o atributo dataaluguel para DATE NOT NULL.
ALTER TABLE aluguel MODIFY dataaluguel VARCHAR(45) NOT NULL;

-- 6. Adicione o atributo valor DOUBLE para o aluguel.
ALTER TABLE aluguel ADD valor DOUBLE;

-- 7 . Altere o atributo cpf para VARCHAR(11) UNIQUE.
ALTER TABLE clientes MODIFY CPF VARCHAR(11) UNIQUE;

-- 8. Renomeie o nome do atributo datanascimento para datadenascimento tipo DATE.
ALTER TABLE clientes CHANGE datanascimento datadenascimento DATE;

-- 9 . Adicione o atributo cnh (carteira de habilitação) para o cliente.
ALTER TABLE clientes ADD cnh VARCHAR(45);

-- 10. Adicione o atributo ddd para telefone.
ALTER TABLE clientes ADD ddd VARCHAR(45);

-- PARTE B - INSERÇÃO DE DADOS - (FAZER NA ORDEM ESTABELECIDA)
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
LOCADORA
1. Mostre os dados dos clientes ordenados pelo nome.
2. Mostre o total dos carros agrupados pela cor.
3. Mostre o total de alugueis por clientes.
4. Mostre os clientes que nunca alugaram carros.
5. Mostre os 3 clientes mais velhos.
6. Mostre os clientes cujo nome em alguma parte tenha a letra "o".
7. Mostre o valor total de aluguel por carro.
8. Mostre o valor total de aluguel por data do aluguel.


