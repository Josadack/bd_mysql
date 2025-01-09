CREATE DATABASE db_curso_da_minha_vida;  

USE db_curso_da_minha_vida;  

CREATE TABLE tb_categorias (  
    id BIGINT AUTO_INCREMENT PRIMARY KEY,  
    nome VARCHAR(255) NOT NULL,  
    descricao VARCHAR(255) NOT NULL  
);  

CREATE TABLE tb_cursos (  
    id_curso BIGINT AUTO_INCREMENT PRIMARY KEY,  
    nome_curso VARCHAR(255) NOT NULL,  
    preco DECIMAL(10,2) NOT NULL,  
    duracao INT NOT NULL,  
    id_categoria BIGINT,  
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)  
);  

INSERT INTO tb_categorias (nome, descricao)  
VALUES  
('Tecnologia', 'Cursos de tecnologia e programação'),  
('Negócios', 'Cursos de negócios e administração'),  
('Saúde', 'Cursos de saúde e bem-estar'),  
('Educação', 'Cursos de educação e pedagogia'),  
('Arte', 'Cursos de arte e design'),  
('Esportes', 'Cursos de esportes e condicionamento físico'),  
('Línguas', 'Cursos de línguas e idiomas');  

INSERT INTO tb_cursos (nome_curso, preco, duracao, id_categoria)  
VALUES  
('Desenvolvimento Web', 800.00, 120, 1),  
('Gestão de Projetos', 400.00, 60, 2),  
('Enfermagem', 600.00, 180, 3),  
('Pedagogia', 500.00, 90, 4),  
('Desenho', 300.00, 40, 5),  
('Tênis', 200.00, 20, 6),  
('Inglês', 700.00, 100, 7),  
('Espanhol', 900.00, 120, 7),  
('Françês', 1000.00, 150, 7),  
('Alemão', 850.00, 110, 7);  

SELECT * FROM tb_cursos WHERE preco > 500.00;  

SELECT * FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00; 

SELECT * FROM tb_cursos WHERE nome_curso LIKE '%J%';

SELECT * FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.id_categoria = tb_categorias.id
ORDER BY nome_curso;

SELECT * FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.id_categoria = tb_categorias.id
WHERE tb_cursos.id_categoria = 7;

select tb_categorias.nome, round(avg(preco), 2) as Preço_medio
FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.id_categoria = tb_categorias.id
GROUP BY  tb_categorias.nome
HAVING Preço_medio > 10;