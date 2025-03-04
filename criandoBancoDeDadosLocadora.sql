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
