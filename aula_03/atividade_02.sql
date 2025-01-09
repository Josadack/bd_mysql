CREATE DATABASE db_pizzaria_legal;  

USE db_pizzaria_legal;  

CREATE TABLE tb_categorias (  
    id BIGINT AUTO_INCREMENT PRIMARY KEY,  
    nome VARCHAR(255) NOT NULL,  
    descricao VARCHAR(255) NOT NULL  
);  

CREATE TABLE tb_pizzas (  
    id_pizza BIGINT AUTO_INCREMENT PRIMARY KEY,  
    nome_pizza VARCHAR(255) NOT NULL,  
    preco DECIMAL(10,2) NOT NULL,  
    ingredientes VARCHAR(255) NOT NULL,  
    id_categoria BIGINT,  
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)  
);

INSERT INTO tb_categorias (nome, descricao)  
VALUES  
('Vegetariana', 'Pizzas vegetarianas, sem carne'),  
('Carnes', 'Pizzas com carnes, como pepperoni, linguiça'),  
('Frutos do Mar', 'Pizzas com frutos do mar, como camarão, lula'),  
('Especiais', 'Pizzas especiais, com ingredientes únicos'),  
('Clássicas', 'Pizzas clássicas, com ingredientes tradicionais');  

INSERT INTO tb_pizzas (nome_pizza, preco, ingredientes, id_categoria)  
VALUES  
('Quatro Queijos', 49.90, 'Queijo parmesão, queijo cheddar, queijo gorgonzola, queijo catupiry', 1),  
('Pepperoni', 39.90, 'Pepperoni, queijo mozzarella', 2),  
('Camarão', 59.90, 'Camarão, queijo mozzarella, cebola', 3),  
('Portuguesa', 49.90, 'Presunto, queijo, ovo, azeitona', 4),  
('Margherita', 29.90, 'Tomate, queijo mozzarella, manjericão', 5),  
('Quatro Carnes', 69.90, 'Pepperoni, linguiça, bacon, presunto', 2),  
('Frango com Catupiry', 49.90, 'Frango, catupiry, cebola', 4),  
('Mussarela', 39.90, 'Queijo mussarela, tomate', 1);  

DESC tb_pizzas;
DESC tb_categorias;

SELECT nome_pizza, CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preço FROM tb_pizzas WHERE preco > 45;

SELECT nome_pizza, CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preço FROM tb_pizzas WHERE preco BETWEEN 50 AND 100;

SELECT * FROM tb_pizzas WHERE nome_pizza LIKE '%M%';

SELECT * FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.id_categoria = tb_categorias.id;

SELECT * FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.id_categoria = tb_categorias.id
WHERE tb_pizzas.id_categoria = 1;

SELECT nome_pizza, CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preço FROM tb_pizzas ORDER BY nome_pizza;

