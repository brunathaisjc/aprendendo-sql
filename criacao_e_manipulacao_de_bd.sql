-- CRIANDO BANCO DE DADOS
-- CRIANDO TABELAS E ATRIBUTOS
-- EXERCICIOS

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






