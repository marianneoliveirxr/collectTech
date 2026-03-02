-- Aqui to criando uma banco de dados para armazenar nossos dados/tabelas.
CREATE DATABASE IF NOT EXISTS collectTech;

-- drop database collectTech;

-- Aqui eu especifico pro programa qual banco de dados que quero utilizar 
-- para criar as tabelas e inserir meus dados
USE collectTech;


-- criando uma tabela para receber alguns dados.
CREATE TABLE IF NOT EXISTS cargos(
cargo VARCHAR(30) PRIMARY KEY NOT NULL
);

-- criei a tabela Cargos primeiro ao inves de usuario pois a tabela utiliza uma
-- FOREIGN KEY, entao nao teria como eu consultar a coluna sem a tabela
--  cargos estar criada primeiro

-- FOREIGN KEY so pode ser utilizada se a coluna que quero puxar é uma PRIMARY KEY ou UNIQUE INDEX se nao,
-- ira dar erros diversos.

-- é necessario tambem colocar a coluna na tabela em que voce quer puxar ela igual na coluna CARGO abaixo:
CREATE TABLE IF NOT EXISTS usuario(
id_usuario INT PRIMARY KEY NOT NULL,
nome VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
senha VARCHAR(255) NOT NULL,
tel VARCHAR(11) NOT NULL,
cargo VARCHAR(30) NOT NULL,
FOREIGN KEY (cargo) REFERENCES cargos(cargo)
);
-- para utilizar a FOREIGN KEY, primeiro declaramos que ela é uma chave estrangeira e colocamos o nome
-- da coluna que queremos chamar com parenteses (igual ali em cima), depois do nome da coluna a gente 
-- da uma referencia de onde esta a coluna e novamente o nome
-- Ex: CHAVE ESTRANGEIRA (nome) REFERENCIA usuario(nome) // é como se eu estivesse ensinando o caminho para
-- o banco de dados, dando o nome e o local de onde procurar.

CREATE TABLE IF NOT EXISTS localizacao(
logradouro VARCHAR(255) PRIMARY KEY NOT NULL,
cep VARCHAR(8) NOT NULL,
numero VARCHAR(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS caminhoes(
quantidade INT NOT NULL,
disponivel TINYINT PRIMARY KEY NOT NULL,
placa VARCHAR(7)
);

CREATE TABLE IF NOT EXISTS lixeira(
nome_lix VARCHAR(20) PRIMARY KEY NOT NULL,
lotacao TINYINT
);

CREATE TABLE IF NOT EXISTS coleta(
id INT PRIMARY KEY NOT NULL,
id_usuario INT NOT NULL,
nome_lix VARCHAR(20) NOT NULL,
logradouro VARCHAR(255) NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (nome_lix) REFERENCES lixeira(nome_lix),
FOREIGN KEY (logradouro) REFERENCES localizacao(logradouro)
);