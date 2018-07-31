-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28-Jul-2018 às 14:53
-- Versão do servidor: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `midnight`
--
CREATE DATABASE IF NOT EXISTS `midnight` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `midnight`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acessos`
--

DROP TABLE IF EXISTS `acessos`;
CREATE TABLE `acessos` (
  `id_acesso` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `cod_filme` int(11) NOT NULL,
  `data_acesso` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios` (
  `id_comentario` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `cod_filme` int(11) NOT NULL,
  `data_comentario` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `valor_compra` int(11) DEFAULT NULL,
  `data_compra` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `favorito_usuario`
--

DROP TABLE IF EXISTS `favorito_usuario`;
CREATE TABLE `favorito_usuario` (
  `id_favorito_usuario` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `cod_filme` int(11) NOT NULL,
  `data_registro` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `filmes`
--

DROP TABLE IF EXISTS `filmes`;
CREATE TABLE `filmes` (
  `id_filme` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `sinopse` text NOT NULL,
  `foto` varchar(32) NOT NULL,
  `data_lancamento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `filme_categoria`
--

DROP TABLE IF EXISTS `filme_categoria`;
CREATE TABLE `filme_categoria` (
  `id_filme_categoria` int(11) NOT NULL,
  `cod_categoria` int(11) NOT NULL,
  `cod_filme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id_item` int(11) NOT NULL,
  `nome_item` varchar(50) NOT NULL,
  `valor_item` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `foto_item` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_tipo`
--

DROP TABLE IF EXISTS `item_tipo`;
CREATE TABLE `item_tipo` (
  `id_item_tipo` int(11) NOT NULL,
  `cod_item` int(11) NOT NULL,
  `cod_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_comprados`
--

DROP TABLE IF EXISTS `itens_comprados`;
CREATE TABLE `itens_comprados` (
  `id_itens_comprados` int(11) NOT NULL,
  `cod_item` int(11) NOT NULL,
  `cod_compra` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticias`
--

DROP TABLE IF EXISTS `noticias`;
CREATE TABLE `noticias` (
  `id_noticia` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `cod_filme` int(11) NOT NULL,
  `titulo_noticia` varchar(50) NOT NULL,
  `noticia` text NOT NULL,
  `data_noticia` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos_categoria`
--

DROP TABLE IF EXISTS `tipos_categoria`;
CREATE TABLE `tipos_categoria` (
  `id_tipo_categoria` int(11) NOT NULL,
  `categoria` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos_item`
--

DROP TABLE IF EXISTS `tipos_item`;
CREATE TABLE `tipos_item` (
  `id_tipo_item` int(11) NOT NULL,
  `tipo_item` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipos_item`
--

INSERT INTO `tipos_item` (`id_tipo_item`, `tipo_item`) VALUES
(1, 'Chapéu'),
(2, 'Touca'),
(3, 'Camisa'),
(4, 'Moletom'),
(5, 'Macacão'),
(6, 'Chaveiro'),
(7, 'Pelúcia'),
(8, 'Colar'),
(9, 'Caneca'),
(10, 'Óculos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos_usuario`
--

DROP TABLE IF EXISTS `tipos_usuario`;
CREATE TABLE `tipos_usuario` (
  `id_tipo_usuario` int(11) NOT NULL,
  `tipo_usuario` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipos_usuario`
--

INSERT INTO `tipos_usuario` (`id_tipo_usuario`, `tipo_usuario`) VALUES
(1, 'Comum'),
(2, 'Administrador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `cod_tipo_usuario` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` int(32) NOT NULL,
  `foto` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id_acesso`),
  ADD KEY `cod_usuario` (`cod_usuario`),
  ADD KEY `cod_filme` (`cod_filme`);

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `cod_usuario` (`cod_usuario`),
  ADD KEY `cod_filme` (`cod_filme`);

--
-- Indexes for table `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Indexes for table `favorito_usuario`
--
ALTER TABLE `favorito_usuario`
  ADD PRIMARY KEY (`id_favorito_usuario`),
  ADD KEY `cod_usuario` (`cod_usuario`),
  ADD KEY `cod_filme` (`cod_filme`);

--
-- Indexes for table `filmes`
--
ALTER TABLE `filmes`
  ADD PRIMARY KEY (`id_filme`);

--
-- Indexes for table `filme_categoria`
--
ALTER TABLE `filme_categoria`
  ADD PRIMARY KEY (`id_filme_categoria`),
  ADD KEY `cod_categoria` (`cod_categoria`),
  ADD KEY `cod_filme` (`cod_filme`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`);

--
-- Indexes for table `item_tipo`
--
ALTER TABLE `item_tipo`
  ADD PRIMARY KEY (`id_item_tipo`),
  ADD KEY `cod_item` (`cod_item`),
  ADD KEY `cod_tipo` (`cod_tipo`);

--
-- Indexes for table `itens_comprados`
--
ALTER TABLE `itens_comprados`
  ADD PRIMARY KEY (`id_itens_comprados`),
  ADD KEY `cod_item` (`cod_item`),
  ADD KEY `cod_compra` (`cod_compra`);

--
-- Indexes for table `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id_noticia`),
  ADD KEY `cod_usuario` (`cod_usuario`),
  ADD KEY `cod_filme` (`cod_filme`);

--
-- Indexes for table `tipos_categoria`
--
ALTER TABLE `tipos_categoria`
  ADD PRIMARY KEY (`id_tipo_categoria`);

--
-- Indexes for table `tipos_item`
--
ALTER TABLE `tipos_item`
  ADD PRIMARY KEY (`id_tipo_item`);

--
-- Indexes for table `tipos_usuario`
--
ALTER TABLE `tipos_usuario`
  ADD PRIMARY KEY (`id_tipo_usuario`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `cod_tipo_usuario` (`cod_tipo_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id_acesso` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `favorito_usuario`
--
ALTER TABLE `favorito_usuario`
  MODIFY `id_favorito_usuario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `filmes`
--
ALTER TABLE `filmes`
  MODIFY `id_filme` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `filme_categoria`
--
ALTER TABLE `filme_categoria`
  MODIFY `id_filme_categoria` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_tipo`
--
ALTER TABLE `item_tipo`
  MODIFY `id_item_tipo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `itens_comprados`
--
ALTER TABLE `itens_comprados`
  MODIFY `id_itens_comprados` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id_noticia` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipos_categoria`
--
ALTER TABLE `tipos_categoria`
  MODIFY `id_tipo_categoria` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipos_item`
--
ALTER TABLE `tipos_item`
  MODIFY `id_tipo_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tipos_usuario`
--
ALTER TABLE `tipos_usuario`
  MODIFY `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `acessos`
--
ALTER TABLE `acessos`
  ADD CONSTRAINT `acessos_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `acessos_ibfk_2` FOREIGN KEY (`cod_filme`) REFERENCES `filmes` (`id_filme`);

--
-- Limitadores para a tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`cod_filme`) REFERENCES `filmes` (`id_filme`);

--
-- Limitadores para a tabela `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Limitadores para a tabela `favorito_usuario`
--
ALTER TABLE `favorito_usuario`
  ADD CONSTRAINT `favorito_usuario_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `favorito_usuario_ibfk_2` FOREIGN KEY (`cod_filme`) REFERENCES `filmes` (`id_filme`);

--
-- Limitadores para a tabela `filme_categoria`
--
ALTER TABLE `filme_categoria`
  ADD CONSTRAINT `filme_categoria_ibfk_1` FOREIGN KEY (`cod_categoria`) REFERENCES `tipos_categoria` (`id_tipo_categoria`),
  ADD CONSTRAINT `filme_categoria_ibfk_2` FOREIGN KEY (`cod_filme`) REFERENCES `filmes` (`id_filme`);

--
-- Limitadores para a tabela `item_tipo`
--
ALTER TABLE `item_tipo`
  ADD CONSTRAINT `item_tipo_ibfk_1` FOREIGN KEY (`cod_item`) REFERENCES `item` (`id_item`),
  ADD CONSTRAINT `item_tipo_ibfk_2` FOREIGN KEY (`cod_tipo`) REFERENCES `tipos_item` (`id_tipo_item`);

--
-- Limitadores para a tabela `itens_comprados`
--
ALTER TABLE `itens_comprados`
  ADD CONSTRAINT `itens_comprados_ibfk_1` FOREIGN KEY (`cod_item`) REFERENCES `item` (`id_item`),
  ADD CONSTRAINT `itens_comprados_ibfk_2` FOREIGN KEY (`cod_compra`) REFERENCES `compras` (`id_compra`);

--
-- Limitadores para a tabela `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `noticias_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `noticias_ibfk_2` FOREIGN KEY (`cod_filme`) REFERENCES `filmes` (`id_filme`);

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`cod_tipo_usuario`) REFERENCES `tipos_usuario` (`id_tipo_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
