/* Script Banco de dados PI - LUCAS S. ARAGÃO */
CREATE DATABASE bd_ifoodrural;
USE bd_ifoodrural;

CREATE TABLE tb_cliente (
    PK_cod_cliente INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(60) NOT NULL,
    TELEFONE INT(11) NOT NULL,
    EMAIL VARCHAR(40) NOT NULL,
    DataNasc DATE NOT NULL,
    CPF INT(11) ZEROFILL UNIQUE NOT NULL,
    Endereco VARCHAR(40)NOT NULL,
    Complemento_end CHAR(10) NOT NULL,
    Bairro_end VARCHAR(40) NOT NULL,
    Cidade_end VARCHAR(40) NOT NULL,
    CEP_end INT(8) NOT NULL,
    UF_end CHAR(2) NOT NULL,
    SEXO ENUM('F','M') NOT NULL
);

CREATE TABLE tb_fornecedor (
    PK_cod_fornecedor INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome_fornecedor  VARCHAR(60) NOT NULL,
    Pessoa ENUM('FISICA','JURIDICA') NOT NULL,
    Telefone_fornecedor INT(11) NOT NULL,
    Email_fornecedor VARCHAR(40) NOT NULL,
    WHATSAPP INT(11),
    Endereco_fornecedor VARCHAR(60) NOT NULL,
    Complemento_end_fornecedor CHAR(10) NOT NULL,
    Bairro_end_fornecedor VARCHAR(40) NOT NULL,
    Cidade_end_fornecedor VARCHAR(40) NOT NULL,
    UF_end_fornecedor CHAR(2) NOT NULL
);

CREATE TABLE tb_produto (
    PK_cod_produto INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome_produto VARCHAR(60) NOT NULL
);

CREATE TABLE tb_venda (
    PK_cod_venda INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DATA_VENDA DATE NOT NULL,
    HORA TIME NOT NULL,
    FK_cod_cliente INT(11) NOT NULL
);

CREATE TABLE tb_estoque (
    DataVALIDADE DATE NOT NULL,
    PRECO DECIMAL (10,2) NOT NULL,
    CERTIFICACAO VARCHAR(100) NOT NULL,
    PK_cod_estoque INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Cod_produto INT(11) NOT NULL,
    Cod_fornecedor INT(11) NOT NULL,
    FK_cod_produto INT(11) NOT NULL,
    FK_cod_fornecedor INT(11) NOT NULL
);

CREATE TABLE tb_carrinho (
    PK_cod_carrinho INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Cod_Produto INT(11) NOT NULL,
    Cod_Venda INT(11) NOT NULL,
    PRECO DECIMAL (10,2) NOT NULL,
    QUANTIDADE SMALLINT NOT NULL,
    FK_cod_produto INT(11) NOT NULL,
    FK_cod_venda INT(11) NOT NULL
);

CREATE TABLE tb_UF (
    Sigla_UF CHAR(2) NOT NULL PRIMARY KEY,
    Nome_cidade VARCHAR(20) NOT NULL
);

CREATE INDEX IX_FK_COD_CLIENTE ON tb_venda (FK_cod_cliente);
CREATE INDEX IX_FK_COD_PRODUTO ON tb_carrinho (FK_cod_produto);
CREATE INDEX IX_FK_COD_VENDA ON tb_carrinho (FK_cod_venda);

ALTER TABLE tb_cliente 
    ADD CONSTRAINT UF_END FOREIGN KEY (UF_end)
    REFERENCES tb_UF (Sigla_UF)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT;
 
ALTER TABLE tb_fornecedor 
    ADD CONSTRAINT UF_END_FORNECEDOR FOREIGN KEY (UF_end_fornecedor)
    REFERENCES tb_UF (Sigla_UF)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT;
 
ALTER TABLE tb_venda 
    ADD CONSTRAINT FK_COD_CLIENTE FOREIGN KEY (FK_cod_cliente)
    REFERENCES tb_cliente (PK_cod_cliente)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT;
 
ALTER TABLE tb_estoque 
    ADD CONSTRAINT FK_COD_PRODUTO1 FOREIGN KEY (FK_cod_produto)
    REFERENCES tb_produto (PK_cod_produto)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT;
 
ALTER TABLE tb_estoque 
    ADD CONSTRAINT FK_COD_FORNECEDOR FOREIGN KEY (FK_cod_fornecedor)
    REFERENCES tb_fornecedor (PK_cod_fornecedor)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT;
 
ALTER TABLE tb_carrinho 
    ADD CONSTRAINT FK_COD_PRODUTO2 FOREIGN KEY (FK_cod_produto)
    REFERENCES tb_produto (PK_cod_produto)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT;
 
ALTER TABLE tb_carrinho 
   ADD CONSTRAINT FK_COD_VENDA FOREIGN KEY (FK_cod_venda)
    REFERENCES tb_venda (PK_cod_venda)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT;