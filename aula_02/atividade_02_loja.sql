CREATE DATABASE db_lojaLivre;

USE db_lojaLivre;

CREATE TABLE tb_produtos(
	id bigint auto_increment PRIMARY KEY,
    nome varchar(255) not null,
    data_validade date,
    quantidade int, 
    categoria varchar(255) not null,
    preco decimal(6,2) not null
);

DESC tb_produtos;

INSERT INTO tb_produtos (nome, data_validade, quantidade, categoria, preco)  
VALUES  
('Leite', '2024-12-31', 100, 'Laticínios', 3.50),  
('Arroz', '2025-06-30', 500, 'Grãos', 2.20),  
('Feijão', '2025-03-31', 200, 'Grãos', 1.80),  
('Sabonete', '2026-01-31', 300, 'Higiene', 1.50),  
('Shampoo', '2025-09-30', 150, 'Higiene', 5.00),  
('Pão', '2024-12-31', 400, 'Padaria', 2.00),  
('Ovo', '2025-06-30', 200, 'Laticínios', 1.20),  
('Manteiga', '2025-03-31', 100, 'Laticínios', 3.00),  
('Açúcar', '2026-01-31', 500, 'Grãos', 1.00),  
('Café', '2025-09-30', 300, 'Bebidas', 2.50),
('Smartphone Samsung Galaxy S22', '2025-12-31', 50, 'Eletrônicos', 999.99),  
('Notebook Dell Inspiron 15', '2026-06-30', 20, 'Informática', 899.99),  
('TV LED 4K 55 polegadas', '2025-09-30', 30, 'Eletrônicos', 799.99),  
('Câmera Digital Canon EOS', '2026-03-31', 15, 'Fotografia', 699.99),  
('Relógio de Pulso Fossil', '2025-12-31', 100, 'Acessórios', 299.99),  
('Tablet Apple iPad Air', '2026-06-30', 25, 'Informática', 599.99),  
('Fones de Ouvido Sony', '2025-09-30', 50, 'Eletrônicos', 199.99),  
('Console de Jogos PlayStation 5', '2026-03-31', 20, 'Videogames', 999.99),  
('Impressora HP LaserJet', '2025-12-31', 30, 'Informática', 499.99),  
('Cadeira de Escritório Ergonômica', '2026-06-30', 40, 'Móveis', 399.99);  

SELECT * FROM tb_produtos;

SELECT id, nome, CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preço,
DATE_FORMAT(data_validade, '%d/%m/%Y') As Data_Validade FROM tb_produtos  WHERE preco > 500;

SELECT id, nome, CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preço,
DATE_FORMAT(data_validade, '%d/%m/%Y') As Data_Validade FROM tb_produtos  WHERE preco < 500;

UPDATE tb_produtos SET nome = 'Console de Jogos Playstation 4', categoria = 'Videogames', preco = 850.00 WHERE id = 1;