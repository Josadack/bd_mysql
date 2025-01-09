CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes (  
    id BIGINT AUTO_INCREMENT PRIMARY KEY,  
    nome VARCHAR(255) NOT NULL,  
    descricao_classe VARCHAR(255) NOT NULL,  
    poder_ataque INT NOT NULL,  
    poder_defesa INT NOT NULL  
);  

CREATE TABLE tb_personagens (  
    id_personagem BIGINT AUTO_INCREMENT PRIMARY KEY,  
    nome_personagem VARCHAR(255) NOT NULL,  
    nivel_personagem INT NOT NULL,  
    vida_personagem INT NOT NULL,  
    id_classe BIGINT,  
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id)  
);  

INSERT INTO tb_classes (nome, descricao_classe, poder_ataque, poder_defesa)  
VALUES  
('Guerreiro', 'Classe de combate corpo a corpo, com habilidades de defesa e ataque físico.', 2500, 1800),  
('Mago', 'Classe de magia, com habilidades de ataque e defesa mágica.', 2000, 1500),  
('Arqueiro', 'Classe de ataque à distância, com habilidades de precisão e velocidade.', 2200, 1200),  
('Ladino', 'Classe de furtividade e roubo, com habilidades de sigilo e astúcia.', 1800, 1000),  
('Clérigo', 'Classe de suporte, com habilidades de cura e proteção.', 1500, 2000);  

INSERT INTO tb_personagens (nome_personagem, nivel_personagem, vida_personagem, id_classe)  
VALUES  
('Eryndor Thorne', 10, 100, 1),  
('Lila Earthsong', 12, 120, 2),  
('Arin the Swift', 9, 90, 3),  
('Finnley Swiftfoot', 11, 110, 4),  
('Elara Moonwhisper', 10, 100, 5),  
('Kael Darkhunter', 13, 130, 1),  
('Aria Starseeker', 8, 80, 2),  
('Cormac Nightshade', 12, 120, 4);  

DESC tb_classes;

DESC tb_personagens;

SELECT * FROM tb_classes;

SELECT * FROM tb_personagens;

SELECT nome, poder_ataque FROM tb_classes WHERE poder_ataque > 2000;

SELECT * FROM tb_classes WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome_personagem LIKE '%C%';

SELECT * FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.id_classe = tb_classes.id;

SELECT * FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.id_classe = tb_classes.id
WHERE tb_personagens.id_classe = 4;

SELECT tb_classes.descricao_classe, COUNT(nome_personagem) AS Numero_Personagem
 FROM tb_personagens INNER JOIN tb_classes
 ON tb_personagens.id_classe = tb_classes.id
 GROUP BY tb_classes.descricao_classe;









