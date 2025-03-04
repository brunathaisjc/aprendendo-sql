

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";




--
-- Database: clubedapizza
--
drop Database if exists clubedapizza;
CREATE DATABASE clubedapizza;
USE clubedapizza;
-- --------------------------------------------------------

--
-- Estrutura da tabela atendentes
--

CREATE TABLE atendentes (
  idatendentes int(11) NOT NULL,
  nomeatendente varchar(45) NOT NULL,
  codigo varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela atendentes
--

INSERT INTO atendentes (idatendentes, nomeatendente, codigo) VALUES
(1, 'jorge', 'AB1'),
(2, 'Paulo', 'CD2'),
(3, 'Ana', 'FG1'),
(4, 'Paula', 'CD4'),
(5, 'João', 'JO1'),
(6, 'Xuxa', 'XU9'),
(7, 'Carol', 'XX1'),
(8, 'Joana', 'J77');

-- --------------------------------------------------------

--
-- Estrutura da tabela itens
--

CREATE TABLE itens (
  idpedidos int(10) UNSIGNED NOT NULL,
  idpizzas int(11) NOT NULL,
  quantidade int(11) DEFAULT NULL,
  tipo int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela itens
--

INSERT INTO itens (idpedidos, idpizzas, quantidade, tipo) VALUES
(1, 1, 2, 1),
(1, 3, 4, 2),
(1, 4, 3, 1),
(1, 5, 5, 1),
(1, 6, 3, 1),
(1, 8, 3, 1),
(2, 1, 4, 1),
(2, 2, 3, 1),
(2, 3, 4, 1),
(2, 6, 1, 2),
(2, 7, 4, 1),
(3, 2, 5, 2),
(3, 3, 1, 1),
(3, 4, 4, 2),
(3, 5, 5, 2),
(3, 6, 4, 1),
(4, 1, 4, 2),
(4, 2, 5, 2),
(4, 3, 4, 2),
(4, 4, 4, 2),
(4, 6, 4, 1),
(4, 7, 5, 2),
(4, 8, 4, 2),
(5, 2, 5, 1),
(5, 3, 2, 1),
(5, 4, 2, 1),
(5, 5, 1, 2),
(5, 7, 5, 2),
(6, 1, 4, 1),
(6, 2, 1, 2),
(6, 3, 3, 2),
(6, 4, 5, 2),
(6, 5, 3, 2),
(6, 6, 2, 1),
(6, 7, 1, 1),
(6, 8, 4, 1),
(7, 1, 2, 1),
(7, 2, 5, 2),
(7, 3, 4, 1),
(7, 4, 10, 2),
(7, 5, 4, 2),
(7, 7, 2, 2),
(7, 8, 3, 1),
(8, 1, 5, 2),
(8, 2, 1, 2),
(8, 3, 2, 2),
(8, 4, 1, 1),
(8, 6, 2, 2),
(8, 7, 3, 1),
(8, 8, 1, 1),
(9, 1, 3, 2),
(9, 2, 5, 1),
(9, 3, 1, 2),
(9, 4, 5, 1),
(9, 5, 4, 2),
(9, 6, 3, 2),
(9, 7, 3, 2),
(9, 8, 2, 2),
(10, 1, 3, 1),
(10, 2, 1, 1),
(10, 3, 2, 2),
(10, 4, 5, 1),
(10, 6, 4, 1),
(10, 7, 4, 1),
(10, 8, 3, 1),
(12, 3, 3, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela pedidos
--

CREATE TABLE pedidos (
  idpedidos int(10) UNSIGNED NOT NULL,
  idatendentes int(11) NOT NULL,
  idsocios int(11) NOT NULL,
  datapedido date DEFAULT NULL,
  valor_total float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela pedidos
--

INSERT INTO pedidos (idpedidos, idatendentes, idsocios, datapedido, valor_total) VALUES
(1, 1, 1, '2016-01-01', 100),
(2, 1, 1, '2016-01-02', 100),
(3, 1, 1, '2016-01-03', 100),
(4, 1, 2, '2016-01-04', 100),
(5, 1, 2, '2016-02-05', 100),
(6, 1, 2, '2016-02-06', 100),
(7, 2, 3, '2016-03-07', 100),
(8, 2, 3, '2016-04-08', 100),
(9, 1, 6, '2016-04-09', 100),
(10, 1, 6, '2016-05-01', 100),
(11, 2, 4, '2016-05-02', 100),
(12, 2, 4, '2016-05-03', 100),
(13, 2, 5, '2016-01-04', 100),
(14, 3, 6, '2016-06-05', 100),
(15, 3, 6, '2016-06-03', 100),
(16, 1, 6, '2016-03-06', 100),
(17, 2, 4, '2016-03-09', 100),
(18, 2, 4, '2016-02-10', 100),
(19, 2, 5, '2016-02-11', 100),
(20, 3, 6, '2016-04-12', 100),
(21, 3, 6, '2016-01-14', 100),
(22, 3, 8, '2016-01-07', 108),
(23, 1, 5, '2016-12-18', 68),
(24, 1, 1, '2017-09-03', 85),
(25, 3, 6, '2016-09-24', 64),
(26, 5, 2, '2017-08-23', 67),
(27, 3, 6, '2016-04-14', 63),
(28, 1, 5, '2016-10-10', 86),
(29, 1, 4, '2016-09-02', 71),
(30, 4, 3, '2017-08-27', 89),
(31, 3, 1, '2016-03-12', 68),
(32, 4, 6, '2016-08-25', 72),
(33, 5, 4, '2017-12-05', 52),
(34, 1, 7, '2017-01-29', 104),
(35, 1, 5, '2017-06-01', 111),
(36, 2, 5, '2016-04-11', 94),
(37, 3, 5, '2016-03-25', 32),
(38, 3, 8, '2016-01-11', 109),
(39, 3, 2, '2016-04-14', 114),
(40, 2, 3, '2017-09-16', 117),
(41, 2, 5, '2017-03-09', 90),
(42, 4, 7, '2016-02-23', 55),
(43, 5, 8, '2016-07-01', 93),
(44, 2, 4, '2017-05-01', 99),
(45, 4, 3, '2017-07-04', 78),
(46, 5, 4, '2017-12-24', 36),
(47, 4, 4, '2016-03-01', 51),
(48, 3, 5, '2017-06-14', 54),
(49, 2, 8, '2016-10-06', 78),
(50, 4, 5, '2016-08-02', 85),
(51, 3, 8, '2017-05-12', 95),
(52, 1, 1, '2017-01-22', 31),
(53, 1, 7, '2017-09-26', 50),
(54, 4, 2, '2016-07-26', 63),
(55, 4, 1, '2017-07-16', 65),
(56, 4, 1, '2017-05-07', 32),
(57, 1, 8, '2016-04-22', 106),
(58, 2, 3, '2016-09-02', 77),
(59, 3, 7, '2017-03-13', 65),
(60, 5, 2, '2017-12-21', 48),
(61, 5, 2, '2016-10-04', 78),
(62, 3, 7, '2016-06-25', 35),
(63, 1, 7, '2017-05-27', 96),
(64, 2, 6, '2016-07-11', 120),
(65, 2, 1, '2016-02-02', 103),
(66, 1, 3, '2016-09-09', 60),
(67, 2, 6, '2017-06-20', 85),
(68, 2, 3, '2017-11-17', 67),
(69, 5, 8, '2016-05-03', 109),
(70, 2, 2, '2016-07-22', 35),
(71, 2, 3, '2016-11-05', 87),
(72, 5, 5, '2017-11-20', 63),
(73, 3, 3, '2017-09-02', 119),
(74, 4, 5, '0000-00-00', 90),
(75, 2, 3, '2016-10-17', 30),
(76, 1, 7, '2016-01-24', 66),
(77, 4, 7, '2016-01-23', 32),
(78, 2, 4, '2017-07-24', 105),
(79, 1, 1, '2017-10-01', 48),
(80, 1, 4, '2016-09-11', 97),
(81, 3, 3, '2016-09-03', 97),
(82, 2, 1, '2017-09-16', 72),
(83, 2, 4, '2016-09-10', 34);

-- --------------------------------------------------------

--
-- Estrutura da tabela pizzas
--

CREATE TABLE pizzas (
  idpizzas int(11) NOT NULL,
  sabor varchar(45) DEFAULT NULL,
  preco float DEFAULT NULL,
  quantidade int(11) DEFAULT NULL,
  quantidade_critica int(11) DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela pizzas
--

INSERT INTO pizzas (idpizzas, sabor, preco, quantidade, quantidade_critica) VALUES
(1, 'Mussarela', 40, 60, 10),
(2, 'Calabresa', 35, 60, 10),
(3, 'Quatro Queijos', 40, 60, 10),
(4, 'Baiana', 45, 60, 10),
(5, 'Portuguesa', 30, 60, 10),
(6, 'Frango ao Catupiry', 50, 90, 10),
(7, 'Mista de Sardinha e 4 Queijos', 50, 100, 10),
(8, 'Italiana', 60, 50, 10),
(9, 'Alho e Óleo', 40, 30, 10),
(10, 'Brócolis e Peperoni', 50, 40, 10),
(11, 'Peru ao Catupiry', 45, 50, 10),
(12, 'Bacon', 40, 30, 5),
(13, 'Romana', 45, 50, 5),
(14, 'Gorgonzola', 50, 40, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela socios
--

CREATE TABLE socios (
  idsocios int(11) NOT NULL,
  nomesocio varchar(45) NOT NULL,
  cpf varchar(11) NOT NULL,
  telefone varchar(15) DEFAULT NULL,
  idtiposocio int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela socios
--

INSERT INTO socios (idsocios, nomesocio, cpf, telefone, idtiposocio) VALUES
(1, 'Flavia', '12345', '9999-5555', 1),
(2, 'Fernando', '23456', '8888-5555', 1),
(3, 'Lilian', '34567', '7777-5555', 1),
(4, 'Renato', '45678', '6666-5555', 2),
(5, 'Rafaela', '56789', '9988-5555', 2),
(6, 'Yasmin', '67890', '9911-5555', 3),
(7, 'Lane', '78901', '9966-5555', 3),
(8, 'Alisson', '89012', '9900-5555', 3),
(9, 'John', '123423', '9888-6565', 2),
(10, 'Guilherme', '2233445', '9765-9999', 1),
(11, 'Shuana', '5434343', '9898-0100', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela tiposocios
--

CREATE TABLE tiposocios (
  idtiposocio int(11) NOT NULL,
  tipo_socio varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela tiposocios
--

INSERT INTO tiposocios (idtiposocio, tipo_socio) VALUES
(1, 'ouro'),
(2, 'prata'),
(3, 'bronze');

--
-- Indexes for dumped tables
--

--
-- Indexes for table atendentes
--
ALTER TABLE atendentes
  ADD PRIMARY KEY (idatendentes);

--
-- Indexes for table itens
--
ALTER TABLE itens
  ADD PRIMARY KEY (idpedidos,idpizzas),
  ADD KEY fk_pedidos_has_pizzas_pizzas1_idx (idpizzas),
  ADD KEY fk_pedidos_has_pizzas_pedidos1_idx (idpedidos);

--
-- Indexes for table pedidos
--
ALTER TABLE pedidos
  ADD PRIMARY KEY (idpedidos),
  ADD KEY fk_atendentes_has_socios_socios1_idx (idsocios),
  ADD KEY fk_atendentes_has_socios_atendentes1_idx (idatendentes);

--
-- Indexes for table pizzas
--
ALTER TABLE pizzas
  ADD PRIMARY KEY (idpizzas);

--
-- Indexes for table socios
--
ALTER TABLE socios
  ADD PRIMARY KEY (idsocios,idtiposocio),
  ADD KEY fk_socios_tipo_socios_idx (idtiposocio);

--
-- Indexes for table tiposocios
--
ALTER TABLE tiposocios
  ADD PRIMARY KEY (idtiposocio);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table atendentes
--
ALTER TABLE atendentes
  MODIFY idatendentes int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table pedidos
--
ALTER TABLE pedidos
  MODIFY idpedidos int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table pizzas
--
ALTER TABLE pizzas
  MODIFY idpizzas int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table socios
--
ALTER TABLE socios
  MODIFY idsocios int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table tiposocios
--
ALTER TABLE tiposocios
  MODIFY idtiposocio int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela itens
--
ALTER TABLE itens
  ADD CONSTRAINT fk_pedidos_has_pizzas_pedidos1 FOREIGN KEY (idpedidos) REFERENCES pedidos (idpedidos) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_pedidos_has_pizzas_pizzas1 FOREIGN KEY (idpizzas) REFERENCES pizzas (idpizzas) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela pedidos
--
ALTER TABLE pedidos
  ADD CONSTRAINT fk_atendentes_has_socios_atendentes1 FOREIGN KEY (idatendentes) REFERENCES atendentes (idatendentes) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_atendentes_has_socios_socios1 FOREIGN KEY (idsocios) REFERENCES socios (idsocios) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela socios
--
ALTER TABLE socios
  ADD CONSTRAINT fk_socios_tipo_socios FOREIGN KEY (idtiposocio) REFERENCES tiposocios (idtiposocio) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
