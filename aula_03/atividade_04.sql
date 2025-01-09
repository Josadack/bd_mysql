CREATE DATABASE db_cidade_das_carnes;  

USE db_cidade_das_carnes; 


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
    id_categoria BIGINT,  
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)  
);  

INSERT INTO tb_categorias (nome, descricao)  
VALUES  
('Carnes', 'Produtos cárneos frescos'),  
('Aves', 'Produtos de aves frescos'),  
('Peixes', 'Produtos de peixes frescos'),  
('Laticínios', 'Produtos lácteos frescos'),  
('Outros', 'Produtos variados');  

INSERT INTO tb_produtos (nome_produto, preco, quantidade, id_categoria)  
VALUES  
('Picanha', 50.00, 20, 1),  
('Frango', 15.00, 30, 2),  
('Salmão', 80.00, 10, 3),  
('Queijo', 20.00, 40, 4),  
('Carne Moída', 25.00, 50, 1),  
('Peito de Frango', 30.00, 25, 2),  
('Bife', 100.00, 15, 1),  
('Leite', 10.00, 60, 4); 

DESC tb_produtos;

SELECT nome_produto, CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preço FROM tb_produtos WHERE preco > 50 ;

SELECT nome_produto, CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preço FROM tb_produtos WHERE preco BETWEEN 50 AND 150;

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%' ORDER BY nome_produto;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id
ORDER BY nome_produto;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id
WHERE tb_produtos.id_categoria = 4
ORDER BY preco;

select tb_categorias.descricao, round(avg(preco), 2) as Preço_medio
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id
GROUP BY  tb_categorias.descricao
HAVING Preço_medio > 10;

SELECT nome_produto, CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Produto_Maior_Valor From tb_produtos
WHERE preco = (SELECT Max(preco) FROM tb_produtos);
