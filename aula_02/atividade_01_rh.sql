CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_rh(
	id bigint auto_increment PRIMARY KEY,
    nome varchar(255) not null,
    cargo varchar(255) not null,
    data_admissao date,
    departamento varchar(255),
    salario decimal(10,2)
);

DESC tb_rh;

INSERT INTO tb_rh (nome, cargo, data_admissao, departamento, salario)
VALUES  ("João Silva", "Analista de Sistemas", "2023-05-15", "TI", 5500.00),
	    ("Maria Pereira", "Gerente de Projeto", "2022-11-01", "Projetos", 15000.00),
        ("Pedro Santos", "Analista Financeiro", "2024-01-10", "Finanças", 10550.00),
	    ("Ana Oliveira", "Assistente RH", "2023-07-20", "RH", 2650.00),
		("Carlos Almeida", "Desenvolvedor", "2022-03-15", "TI", 7250.00);
        
        
SELECT nome, CONCAT('R$ ', FORMAT(salario, 2, 'pt_BR')) AS Salários, 
DATE_FORMAT(data_admissao, '%d/%m/%y') AS Data_Admissão FROM tb_rh WHERE salario > 2000;


SELECT nome, CONCAT('R$ ', FORMAT(salario, 2, 'pt_BR')) AS Salários,
 DATE_FORMAT(data_admissao, '%d/%m/%y')AS Data_Admissão  FROM tb_rh WHERE salario < 2000;

UPDATE tb_rh SET salario = 1550 where id = 4;


