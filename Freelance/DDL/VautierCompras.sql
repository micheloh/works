drop database if exists vautierCompras;
create database vautierCompras;
use vautierCompras;

drop table if exists banner;
drop table if exists produto;
drop table if exists cat_loja;
drop table if exists loja;
drop table if exists categoria;

create table categoria (
categoriaId INT NOT NULL,
categoriaNome VARCHAR(50),
PRIMARY KEY (categoriaId),
UNIQUE (categoriaNome)
);
create table loja (
lojaId INT NOT NULL AUTO_INCREMENT,
lojaCategoria INT NOT NULL,
lojaNome VARCHAR(70),
lojaResponsavel VARCHAR(100),
lojaSetor VARCHAR(50),
lojaBox VARCHAR(20),
lojaTelefone1 VARCHAR(20),
lojaTelefone2 VARCHAR(20) NULL,
lojaEmail1 VARCHAR(100),
lojaEmail2 VARCHAR(100) NULL,
lojaURL VARCHAR(100),
lojaDataCadastro VARCHAR(20),
lojaDataDesativacao VARCHAR(20),
PRIMARY KEY (lojaId),
FOREIGN KEY (lojaCategoria) REFERENCES categoria(categoriaId),
UNIQUE (lojaNome)
);
create table cat_loja(
cat_lojaId INT NOT NULL AUTO_INCREMENT,
cat_lojaCategoria INT NOT NULL,
cat_lojaLoja INT NOT NULL,
PRIMARY KEY (cat_lojaId),
FOREIGN KEY (cat_lojaCategoria) REFERENCES categoria(categoriaId),
FOREIGN KEY (cat_lojaLoja) REFERENCES loja(lojaId)
);
create table produto(
produtoId INT NOT NULL AUTO_INCREMENT,
produtoLoja INT NOT NULL,
produtoNome VARCHAR(70),
produtoDescricao VARCHAR(200),
produtoPreco VARCHAR(20),
produtoURL VARCHAR(100),
produtoCliques INT,
PRIMARY KEY (produtoId),
FOREIGN KEY (produtoLoja) REFERENCES loja(lojaId)
);
create table banner(
bannerId INT NOT NULL AUTO_INCREMENT,
bannerLoja INT NOT NULL,
bannerURL VARCHAR(100),
bannerMaior INT,
PRIMARY KEY (bannerId),
FOREIGN KEY (bannerLoja) REFERENCES loja(lojaId)
);


