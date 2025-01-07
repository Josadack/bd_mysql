CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_aluno(
	id bigint auto_increment PRIMARY KEY,
    nome varchar(255) not null,
    data_nascimento date not null,
    nota float not null,
    turma varchar(10) not null,
    telefone varchar(25)
);

DESC tb_aluno;

INSERT INTO tb_aluno (nome,  data_nascimento, nota, turma, telefone)  
VALUES  
  ('João Pedro', '2005-02-12', 8.0, '9A',  '(11) 1234-5678'),  
  ('Maria Luiza', '2006-08-25', 9.5, '8B',  '(11) 9012-3456'),  
  ('Pedro Henrique', '2004-11-10',  7.0, '10A', '(11) 1111-2222'),  
  ('Ana Beatriz', '2007-03-15', 9.0, '7A',  '(11) 3333-4444'),  
  ('Luiz Felipe', '2005-05-20', 8.0, '9B',  '(11) 5555-6666'),  
  ('Gabriela Silva', '2006-01-28',  9.5, '8A', '(11) 7777-8888'),  
  ('Rafael Santos', '2004-09-02', 7.5, '10B', '(11) 9999-0000'),  
  ('Beatriz Oliveira', '2007-06-18', 8.5, '7B',  '(11) 1234-9012');  
  
SELECT * FROM tb_aluno;

SELECT nome, nota AS Notas_Aprovados FROM tb_aluno WHERE nota >= 7;

SELECT nome, nota AS Notas_Reprovados FROM tb_aluno WHERE nota < 7;

UPDATE tb_aluno  SET nota = 5.5  WHERE id =5;

UPDATE tb_aluno  SET nota = 6.5  WHERE id IN (1, 7);
