CREATE DATABASE db_construindo_vidas;  

USE db_construindo_vidas;  

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
('Materiais de Construção', 'Produtos para construção de edifícios'),  
('Ferramentas', 'Ferramentas para trabalhos de construção'),  
('Materiais de Decoração', 'Produtos para decoração de ambientes'),  
('Materiais de Segurança', 'Produtos para segurança no trabalho'),  
('Outros', 'Produtos variados');  

INSERT INTO tb_produtos (nome_produto, preco, quantidade, id_categoria)  
VALUES  
('Cimento', 50.00, 100, 1),  
('Martelo', 20.00, 50, 2),  
('Pintura', 30.00, 200, 3),  
('Luvas de Segurança', 15.00, 150, 4),  
('Tijolo', 25.00, 500, 1),  
('Serra Circular', 120.00, 20, 2),  
('Madeira', 80.00, 100, 1),  
('Lâmpada de Segurança', 180.00, 10, 4);  

DESC tb_produtos;
SELECT * FROM tb_categorias;

SELECT nome_produto, CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preço
FROM tb_produtos WHERE preco > 100 ;

SELECT nome_produto, CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preço
FROM tb_produtos WHERE preco BETWEEN 70 AND 150 ORDER BY preco;

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%'ORDER BY preco;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id
ORDER BY nome_produto;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id
WHERE tb_produtos.id_categoria = 1
ORDER BY nome_produto DESC;

select tb_categorias.nome, round(avg(preco), 2) as Preço_medio
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id
GROUP BY  tb_categorias.nome
HAVING Preço_medio > 10;

SELECT * FROM tb_produtos WHERE preco IN(50, 30, 15) ORDER BY nome_produto DESC;