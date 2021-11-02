-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-11-2021 a las 11:04:57
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mysql-estructura`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `cp` float DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefon` varchar(25) DEFAULT NULL,
  `registre` datetime DEFAULT NULL,
  `ulleres_id` int(11) DEFAULT NULL,
  `id_client_recomenat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleats`
--

CREATE TABLE `empleats` (
  `id` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

CREATE TABLE `proveidor` (
  `id` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `carrer` varchar(50) DEFAULT NULL,
  `num` float DEFAULT NULL,
  `pis` float DEFAULT NULL,
  `porta` varchar(10) DEFAULT NULL,
  `cp` float DEFAULT NULL,
  `pais` varchar(25) DEFAULT NULL,
  `telefon` varchar(25) DEFAULT NULL,
  `fax` varchar(25) DEFAULT NULL,
  `nif` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id` int(11) NOT NULL,
  `proveidor_id` int(11) DEFAULT NULL,
  `marca` varchar(30) DEFAULT NULL,
  `graduizq` float DEFAULT NULL,
  `graduder` float DEFAULT NULL,
  `montura` varchar(0) DEFAULT NULL,
  `colormontura` varchar(1) DEFAULT NULL,
  `colorvidres` varchar(10) DEFAULT NULL,
  `preu` int(11) DEFAULT NULL,
  `empleat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client_recomenat` (`id_client_recomenat`),
  ADD KEY `ulleres_id` (`ulleres_id`);

--
-- Indices de la tabla `empleats`
--
ALTER TABLE `empleats`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empleat_id` (`empleat_id`),
  ADD KEY `proveidor_id` (`proveidor_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleats`
--
ALTER TABLE `empleats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`ulleres_id`) REFERENCES `ulleres` (`id`),
  ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`ulleres_id`) REFERENCES `ulleres` (`id`);

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidor` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ulleres_ibfk_2` FOREIGN KEY (`empleat_id`) REFERENCES `empleats` (`id`),
  ADD CONSTRAINT `ulleres_ibfk_3` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidor` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ulleres_ibfk_4` FOREIGN KEY (`empleat_id`) REFERENCES `empleats` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
