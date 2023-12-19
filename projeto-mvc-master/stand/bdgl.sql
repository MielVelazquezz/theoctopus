-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/10/2023 às 18:23
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdgl`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atrativos`
--

CREATE TABLE `atrativos` (
  `id_atrativo` int(11) NOT NULL,
  `nome_atrativo` varchar(45) NOT NULL,
  `lat_atrativo` varchar(45) DEFAULT NULL,
  `long_atrativo` varchar(45) DEFAULT NULL,
  `desc_atrativo` text DEFAULT NULL,
  `image_atrativo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `coins`
--

CREATE TABLE `coins` (
  `id_coin` int(11) NOT NULL,
  `nome_coin` varchar(45) NOT NULL,
  `value_coin` float DEFAULT NULL,
  `image_coin` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cupons`
--

CREATE TABLE `cupons` (
  `id_cupon` int(11) NOT NULL,
  `codigo_cupon` varchar(22) NOT NULL,
  `nome_cupon` varchar(45) NOT NULL,
  `validade_cupon` date NOT NULL,
  `valor_cupom` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cupons`
--

INSERT INTO `cupons` (`id_cupon`, `codigo_cupon`, `nome_cupon`, `validade_cupon`, `valor_cupom`) VALUES
(1, '000', 'sc', '2023-09-05', 0),
(2, 'PRIME01', 'Desconto de primeiro acesso', '2024-09-06', 15);

-- --------------------------------------------------------

--
-- Estrutura para tabela `descontos`
--

CREATE TABLE `descontos` (
  `id_desconto` int(11) NOT NULL,
  `valor_desconto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `descontos`
--

INSERT INTO `descontos` (`id_desconto`, `valor_desconto`) VALUES
(1, 30),
(2, 45);

-- --------------------------------------------------------

--
-- Estrutura para tabela `gamers`
--

CREATE TABLE `gamers` (
  `id_gamers` int(11) NOT NULL,
  `nome_gamer` varchar(45) NOT NULL,
  `senha_gamer` varchar(32) NOT NULL,
  `email_gamer` varchar(60) NOT NULL,
  `dtnasc_gamer` date NOT NULL,
  `personagens_id_personagem` int(11) NOT NULL,
  `coins_id_coin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_acessos`
--

CREATE TABLE `log_acessos` (
  `id_log_acesso` int(11) NOT NULL,
  `ultimo_acesso` date NOT NULL,
  `qtd_acesso` int(11) NOT NULL,
  `status_acesso` varchar(45) NOT NULL,
  `gamers_id_gamers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `missoes`
--

CREATE TABLE `missoes` (
  `id_missao` int(11) NOT NULL,
  `nome_missao` varchar(45) NOT NULL,
  `desc_missao` text DEFAULT NULL,
  `recompensa_missao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `missoes_has_personagens`
--

CREATE TABLE `missoes_has_personagens` (
  `missoes_id_missao` int(11) NOT NULL,
  `personagens_id_personagem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `personagens`
--

CREATE TABLE `personagens` (
  `id_personagem` int(11) NOT NULL,
  `nome_personagem` varchar(45) NOT NULL,
  `genero_personagem` enum('M','F') NOT NULL,
  `tipo_personagem` enum('Humano','Mago','Coruja') NOT NULL DEFAULT 'Humano',
  `totalcoin_personagem` decimal(10,0) NOT NULL,
  `start_latitude` varchar(30) NOT NULL DEFAULT '33.7367518947601',
  `start_longitude` varchar(30) NOT NULL DEFAULT '132.48511964017715',
  `skins_id_skin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `promocoes`
--

CREATE TABLE `promocoes` (
  `id_promocao` int(11) NOT NULL,
  `nome_promocao` varchar(45) NOT NULL,
  `dt_start_promocao` date NOT NULL,
  `dt_end_promocao` date NOT NULL,
  `descr_promocao` text NOT NULL,
  `ativa_promocao` enum('0','1') NOT NULL DEFAULT '0',
  `descontos_id_desconto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `promocoes`
--

INSERT INTO `promocoes` (`id_promocao`, `nome_promocao`, `dt_start_promocao`, `dt_end_promocao`, `descr_promocao`, `ativa_promocao`, `descontos_id_desconto`) VALUES
(1, 'Nilão', '2023-09-06', '2023-10-01', 'Descrição aqui ó ', '0', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `skins`
--

CREATE TABLE `skins` (
  `id_skin` int(11) NOT NULL,
  `categoria_skin` enum('Acessório','Chapéu','Conjunto','Manto','Mochila') NOT NULL,
  `nome_skin` varchar(45) NOT NULL,
  `descr_skin` text NOT NULL,
  `genero_skin` enum('Masculino','Feminino') NOT NULL,
  `valor_skin` float NOT NULL,
  `raridade_skin` enum('Comum','Rara','Épica','Lendário') NOT NULL,
  `foto1_skin` varchar(200) NOT NULL,
  `foto2_skin` varchar(200) DEFAULT NULL,
  `promocoes_id_promocao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `skins`
--

INSERT INTO `skins` (`id_skin`, `categoria_skin`, `nome_skin`, `descr_skin`, `genero_skin`, `valor_skin`, `raridade_skin`, `foto1_skin`, `foto2_skin`, `promocoes_id_promocao`) VALUES
(2, 'Acessório', 'Budega', 'Azul Frufru', '', 50.99, '', 'null', 'null', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id_venda` int(11) NOT NULL,
  `hora_venda` time NOT NULL,
  `dia_venda` date NOT NULL,
  `skins_id_skin` int(11) NOT NULL,
  `cupons_id_cupon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atrativos`
--
ALTER TABLE `atrativos`
  ADD PRIMARY KEY (`id_atrativo`);

--
-- Índices de tabela `coins`
--
ALTER TABLE `coins`
  ADD PRIMARY KEY (`id_coin`);

--
-- Índices de tabela `cupons`
--
ALTER TABLE `cupons`
  ADD PRIMARY KEY (`id_cupon`);

--
-- Índices de tabela `descontos`
--
ALTER TABLE `descontos`
  ADD PRIMARY KEY (`id_desconto`);

--
-- Índices de tabela `gamers`
--
ALTER TABLE `gamers`
  ADD PRIMARY KEY (`id_gamers`),
  ADD KEY `fk_gamers_personagens_idx` (`personagens_id_personagem`),
  ADD KEY `fk_gamers_coins1_idx` (`coins_id_coin`);

--
-- Índices de tabela `log_acessos`
--
ALTER TABLE `log_acessos`
  ADD PRIMARY KEY (`id_log_acesso`),
  ADD KEY `fk_log_acessos_gamers1_idx` (`gamers_id_gamers`);

--
-- Índices de tabela `missoes`
--
ALTER TABLE `missoes`
  ADD PRIMARY KEY (`id_missao`);

--
-- Índices de tabela `missoes_has_personagens`
--
ALTER TABLE `missoes_has_personagens`
  ADD PRIMARY KEY (`missoes_id_missao`,`personagens_id_personagem`),
  ADD KEY `fk_missoes_has_personagens_personagens1_idx` (`personagens_id_personagem`),
  ADD KEY `fk_missoes_has_personagens_missoes1_idx` (`missoes_id_missao`);

--
-- Índices de tabela `personagens`
--
ALTER TABLE `personagens`
  ADD PRIMARY KEY (`id_personagem`),
  ADD KEY `fk_personagens_skins1_idx` (`skins_id_skin`);

--
-- Índices de tabela `promocoes`
--
ALTER TABLE `promocoes`
  ADD PRIMARY KEY (`id_promocao`),
  ADD KEY `fk_promocoes_descontos1_idx` (`descontos_id_desconto`);

--
-- Índices de tabela `skins`
--
ALTER TABLE `skins`
  ADD PRIMARY KEY (`id_skin`),
  ADD KEY `fk_skins_promocoes1_idx` (`promocoes_id_promocao`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `fk_vendas_skins_idx` (`skins_id_skin`),
  ADD KEY `fk_vendas_cupons1_idx` (`cupons_id_cupon`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atrativos`
--
ALTER TABLE `atrativos`
  MODIFY `id_atrativo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `coins`
--
ALTER TABLE `coins`
  MODIFY `id_coin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cupons`
--
ALTER TABLE `cupons`
  MODIFY `id_cupon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `descontos`
--
ALTER TABLE `descontos`
  MODIFY `id_desconto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `gamers`
--
ALTER TABLE `gamers`
  MODIFY `id_gamers` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `log_acessos`
--
ALTER TABLE `log_acessos`
  MODIFY `id_log_acesso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `missoes`
--
ALTER TABLE `missoes`
  MODIFY `id_missao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `personagens`
--
ALTER TABLE `personagens`
  MODIFY `id_personagem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `promocoes`
--
ALTER TABLE `promocoes`
  MODIFY `id_promocao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `skins`
--
ALTER TABLE `skins`
  MODIFY `id_skin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `gamers`
--
ALTER TABLE `gamers`
  ADD CONSTRAINT `fk_gamers_coins1` FOREIGN KEY (`coins_id_coin`) REFERENCES `coins` (`id_coin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gamers_personagens` FOREIGN KEY (`personagens_id_personagem`) REFERENCES `personagens` (`id_personagem`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `log_acessos`
--
ALTER TABLE `log_acessos`
  ADD CONSTRAINT `fk_log_acessos_gamers1` FOREIGN KEY (`gamers_id_gamers`) REFERENCES `gamers` (`id_gamers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `missoes_has_personagens`
--
ALTER TABLE `missoes_has_personagens`
  ADD CONSTRAINT `fk_missoes_has_personagens_missoes1` FOREIGN KEY (`missoes_id_missao`) REFERENCES `missoes` (`id_missao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_missoes_has_personagens_personagens1` FOREIGN KEY (`personagens_id_personagem`) REFERENCES `personagens` (`id_personagem`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `personagens`
--
ALTER TABLE `personagens`
  ADD CONSTRAINT `fk_personagens_skins1` FOREIGN KEY (`skins_id_skin`) REFERENCES `skins` (`id_skin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `promocoes`
--
ALTER TABLE `promocoes`
  ADD CONSTRAINT `fk_promocoes_descontos1` FOREIGN KEY (`descontos_id_desconto`) REFERENCES `descontos` (`id_desconto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `skins`
--
ALTER TABLE `skins`
  ADD CONSTRAINT `fk_skins_promocoes1` FOREIGN KEY (`promocoes_id_promocao`) REFERENCES `promocoes` (`id_promocao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `fk_vendas_cupons1` FOREIGN KEY (`cupons_id_cupon`) REFERENCES `cupons` (`id_cupon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendas_skins` FOREIGN KEY (`skins_id_skin`) REFERENCES `skins` (`id_skin`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
