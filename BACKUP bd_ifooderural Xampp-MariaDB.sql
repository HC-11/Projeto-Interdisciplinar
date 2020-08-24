-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 16-Jul-2020 às 18:15
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_ifoodrural`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_carrinho`
--

CREATE TABLE `tb_carrinho` (
  `PK_cod_carrinho` int(11) NOT NULL,
  `Cod_Produto` int(11) NOT NULL,
  `Cod_Venda` int(11) NOT NULL,
  `PRECO` decimal(10,2) NOT NULL,
  `QUANTIDADE` smallint(6) NOT NULL,
  `FK_cod_produto` int(11) NOT NULL,
  `FK_cod_venda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `PK_cod_cliente` int(11) NOT NULL,
  `NOME` varchar(60) NOT NULL,
  `TELEFONE` int(11) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `DataNasc` date NOT NULL,
  `CPF` int(11) UNSIGNED ZEROFILL NOT NULL,
  `Endereco` varchar(40) NOT NULL,
  `Complemento_end` char(10) NOT NULL,
  `Bairro_end` varchar(40) NOT NULL,
  `Cidade_end` varchar(40) NOT NULL,
  `CEP_end` int(8) NOT NULL,
  `UF_end` char(2) NOT NULL,
  `SEXO` enum('F','M') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_estoque`
--

CREATE TABLE `tb_estoque` (
  `DataVALIDADE` date NOT NULL,
  `PRECO` decimal(10,2) NOT NULL,
  `CERTIFICACAO` varchar(100) NOT NULL,
  `PK_cod_estoque` int(11) NOT NULL,
  `Cod_produto` int(11) NOT NULL,
  `Cod_fornecedor` int(11) NOT NULL,
  `FK_cod_produto` int(11) NOT NULL,
  `FK_cod_fornecedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_fornecedor`
--

CREATE TABLE `tb_fornecedor` (
  `PK_cod_fornecedor` int(11) NOT NULL,
  `Nome_fornecedor` varchar(60) NOT NULL,
  `Pessoa` enum('FISICA','JURIDICA') NOT NULL,
  `Telefone_fornecedor` int(11) NOT NULL,
  `Email_fornecedor` varchar(40) NOT NULL,
  `WHATSAPP` int(11) DEFAULT NULL,
  `Endereco_fornecedor` varchar(60) NOT NULL,
  `Complemento_end_fornecedor` char(10) NOT NULL,
  `Bairro_end_fornecedor` varchar(40) NOT NULL,
  `Cidade_end_fornecedor` varchar(40) NOT NULL,
  `UF_end_fornecedor` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_produto`
--

CREATE TABLE `tb_produto` (
  `PK_cod_produto` int(11) NOT NULL,
  `Nome_produto` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_UF`
--

CREATE TABLE `tb_UF` (
  `Sigla_UF` char(2) NOT NULL,
  `Nome_cidade` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_venda`
--

CREATE TABLE `tb_venda` (
  `PK_cod_venda` int(11) NOT NULL,
  `DATA_VENDA` date NOT NULL,
  `HORA` time NOT NULL,
  `FK_cod_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_carrinho`
--
ALTER TABLE `tb_carrinho`
  ADD PRIMARY KEY (`PK_cod_carrinho`),
  ADD KEY `IX_FK_COD_PRODUTO` (`FK_cod_produto`),
  ADD KEY `IX_FK_COD_VENDA` (`FK_cod_venda`);

--
-- Índices para tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`PK_cod_cliente`),
  ADD UNIQUE KEY `CPF` (`CPF`),
  ADD KEY `UF_END` (`UF_end`);

--
-- Índices para tabela `tb_estoque`
--
ALTER TABLE `tb_estoque`
  ADD PRIMARY KEY (`PK_cod_estoque`),
  ADD KEY `FK_COD_PRODUTO1` (`FK_cod_produto`),
  ADD KEY `FK_COD_FORNECEDOR` (`FK_cod_fornecedor`);

--
-- Índices para tabela `tb_fornecedor`
--
ALTER TABLE `tb_fornecedor`
  ADD PRIMARY KEY (`PK_cod_fornecedor`),
  ADD KEY `UF_END_FORNECEDOR` (`UF_end_fornecedor`);

--
-- Índices para tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD PRIMARY KEY (`PK_cod_produto`);

--
-- Índices para tabela `tb_UF`
--
ALTER TABLE `tb_UF`
  ADD PRIMARY KEY (`Sigla_UF`);

--
-- Índices para tabela `tb_venda`
--
ALTER TABLE `tb_venda`
  ADD PRIMARY KEY (`PK_cod_venda`),
  ADD KEY `IX_FK_COD_CLIENTE` (`FK_cod_cliente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_carrinho`
--
ALTER TABLE `tb_carrinho`
  MODIFY `PK_cod_carrinho` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `PK_cod_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_estoque`
--
ALTER TABLE `tb_estoque`
  MODIFY `PK_cod_estoque` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_fornecedor`
--
ALTER TABLE `tb_fornecedor`
  MODIFY `PK_cod_fornecedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  MODIFY `PK_cod_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_venda`
--
ALTER TABLE `tb_venda`
  MODIFY `PK_cod_venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_carrinho`
--
ALTER TABLE `tb_carrinho`
  ADD CONSTRAINT `FK_COD_PRODUTO2` FOREIGN KEY (`FK_cod_produto`) REFERENCES `tb_produto` (`PK_cod_produto`),
  ADD CONSTRAINT `FK_COD_VENDA` FOREIGN KEY (`FK_cod_venda`) REFERENCES `tb_venda` (`PK_cod_venda`);

--
-- Limitadores para a tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD CONSTRAINT `UF_END` FOREIGN KEY (`UF_end`) REFERENCES `tb_UF` (`Sigla_UF`);

--
-- Limitadores para a tabela `tb_estoque`
--
ALTER TABLE `tb_estoque`
  ADD CONSTRAINT `FK_COD_FORNECEDOR` FOREIGN KEY (`FK_cod_fornecedor`) REFERENCES `tb_fornecedor` (`PK_cod_fornecedor`),
  ADD CONSTRAINT `FK_COD_PRODUTO1` FOREIGN KEY (`FK_cod_produto`) REFERENCES `tb_produto` (`PK_cod_produto`);

--
-- Limitadores para a tabela `tb_fornecedor`
--
ALTER TABLE `tb_fornecedor`
  ADD CONSTRAINT `UF_END_FORNECEDOR` FOREIGN KEY (`UF_end_fornecedor`) REFERENCES `tb_UF` (`Sigla_UF`);

--
-- Limitadores para a tabela `tb_venda`
--
ALTER TABLE `tb_venda`
  ADD CONSTRAINT `FK_COD_CLIENTE` FOREIGN KEY (`FK_cod_cliente`) REFERENCES `tb_cliente` (`PK_cod_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
