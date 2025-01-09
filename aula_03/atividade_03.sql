CREATE DATABASE db_farmacia_bem_estar;  

USE db_farmacia_bem_estar;  

CREATE TABLE tb_categorias (  
    id BIGINT AUTO_INCREMENT PRIMARY KEY,  
    nome VARCHAR(255) NOT NULL,  
    descricao VARCHAR(255) NOT NULL  
);  

CREATE TABLE tb_produtos (  
    id_produto BIGINT AUTO_INCREMENT PRIMARY KEY,  
    nome_produto VARCHAR(255) NOT NULL,  
    preco DECIMAL(10,2) NOT NULL,  
    quantidade INT NOT NULL,  
    data_validade DATE NOT NULL,  
    id_categoria BIGINT,  
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)  
);  

INSERT INTO tb_categorias (nome, descricao)  
VALUES  
('Medicamentos', 'Produtos para tratamento de doenças'),  
('Cosméticos', 'Produtos para cuidado pessoal e beleza'),  
('Suplementos', 'Produtos para suplementação nutricional'),  
('Vitaminas', 'Produtos para suplementação de vitaminas'),  
('Equipamentos Médicos', 'Equipamentos para uso médico'),  
('Higiene Pessoal', 'Produtos para higiene pessoal');

INSERT INTO tb_produtos (nome_produto, preco, quantidade, data_validade, id_categoria)  
VALUES  
('Paracetamol', 10.90, 50, '2025-12-31', 1),  
('Shampoo', 55.90, 20, '2026-06-30', 2),  
('Vitamina C', 20.90, 30, '2025-09-30', 4),  
('Termômetro Digital', 75.90, 10, '2027-12-31', 5),  
('Sabonete', 5.90, 40, '2026-03-31', 6),  
('Aspirina', 12.90, 60, '2025-11-30', 1),  
('Creme Hidratante', 65.90, 25, '2026-09-30', 2),  
('Suplemento de Proteína', 90.90, 15, '2027-06-30', 3),  
('Luvas de Exame', 8.90, 50, '2026-12-31', 5),  
('Desodorante', 7.90, 35, '2026-05-31', 6);  

DESC tb_produtos;

SELECT nome_produto, CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preço, 
DATE_FORMAT(data_validade, '%d/%m/%y') AS Validade FROM tb_produtos WHERE preco > 50  ORDER BY nome_produto;

SELECT nome_produto, CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preço, 
DATE_FORMAT(data_validade, '%d/%m/%y') AS Validade FROM tb_produtos WHERE preco BETWEEN 5 AND 60  ORDER BY preco;

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%' ORDER BY nome_produto;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id
ORDER BY nome_produto;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id
WHERE tb_produtos.id_categoria = 6
ORDER BY nome_produto;

SELECT tb_categorias.nome, COUNT(nome_produto) AS Total
 FROM tb_produtos INNER JOIN tb_categorias
 ON tb_produtos.id_categoria = tb_categorias.id
 GROUP BY tb_categorias.nome;


