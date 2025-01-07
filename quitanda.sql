CREATE DATABASE db_quitanda;
use db_quitanda;
CREATE TABLE tb_produtos(
	id bigint auto_increment primary key,
    nome varchar(255) Not null,
    quantidade int,
    data_validade date,
    preco decimal
);

alter table tb_produtos modify preco decimal(6,2);

alter table tb_produtos ADD descricao varchar(255);

INSERT INTO tb_produtos(nome, quantidade, data_validade, preco) values
( "Tomate Italiano", 100, "2025-01-10", 8.90);
INSERT INTO tb_produtos(nome, quantidade, data_validade, preco) values
( "Pepino", 57, "2025-02-13", 9.50),
( "Cenoura", 20, "2025-01-20", 7.00),
( "Cebola", 60, "2025-03-07", 5.00),
( "Repolho", 30, "2025-02-02", 3.00);

select * from tb_produtos;

select nome, preco from tb_produtos;

update tb_produtos SET preco = 9.50 where id = 2;

update tb_produtos SET preco = 9.50;

alter table tb_produtos add exemplo int first;

alter table tb_produtos drop exemplo;

