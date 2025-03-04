USE clubedapizza;

SELECT * 
FROM atendentes;

UPDATE atendentes
	SET
    nomeatendente = 'Arthur'
WHERE idatendentes = 1;

SELECT * 
FROM atendentes;
USE clinica2021;
SELECT * FROM pacientes;
-- sp (stored procedures)
DELIMITER $$
CREATE PROCEDURE spInserirPaciente(pNome VARCHAR (50), pSexo CHAR(1), pIdade INT, pDoencaInicial VARCHAR(100))
BEGIN	
	INSERT INTO pacientes (nome, sexo, idade, doenca_inicial)
		VALUES (pNome, pSexo, pIdade, pDoencaInicial);
END
$$
CALL spInserirPaciente ('Dudu', 'M', 21, 'obesidade');






