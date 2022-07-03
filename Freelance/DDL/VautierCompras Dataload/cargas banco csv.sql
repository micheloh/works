LOAD DATA LOCAL INFILE 'F:/Freela/Projeto Vautier/banco de dados/20130112banner.csv'
INTO TABLE banner
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
;

LOAD DATA LOCAL INFILE 'F:/Freela/Projeto Vautier/banco de dados/20130117categoria.csv'
INTO TABLE categoria
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
;

LOAD DATA LOCAL INFILE 'F:/Freela/Projeto Vautier/banco de dados/20130117loja.csv'
INTO TABLE loja
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
(lojaCategoria,
lojaNome,
lojaResponsavel,
lojaEnd,
lojaSetBox,
lojaTelefone1,
lojaTelefone2,
lojaEmail1,
lojaEmail2,
lojaURL,
lojaIMG,
lojaDataCadastro,
lojaDataDesativacao)
;

LOAD DATA LOCAL INFILE 'F:/Freela/Projeto Vautier/banco de dados/20130117cat_loja.csv'
INTO TABLE cat_loja
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
(cat_lojaCategoria,
cat_lojaLoja)
;

LOAD DATA LOCAL INFILE 'F:/Freela/Projeto Vautier/banco de dados/20130617produto.csv'
INTO TABLE produto
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
(produtoLoja,
produtoNomeReduzido,
produtoNome,
produtoDescricao,
produtoPreco,
produtoPrecoAt,
produtoIMG,
produtoCliques)
;

UPDATE produto
SET produtoPrecoAt = NULL
where produtoPrecoAt = 0
;

select * from loja
;

select a.lojaNome, b.produtoNome, b.produtoCliques
from loja a, produto b
where a.lojaId = b.produtoLoja
and a.lojaId = 3
order by 3 desc
;

update loja SET
  lojaDataDesativacao = '31/12/9999' -- varchar(20)
WHERE lojaId = 1 -- int(11)
;

alter table loja
add lojaEnd varchar(100)
after lojaResponsavel
;

