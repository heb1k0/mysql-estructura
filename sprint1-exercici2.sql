-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2021 a las 09:00:23
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

CREATE DATABASE pizzeria;
USE pizzeria;

DROP TABLE IF EXISTS botiga,
categories_pizza,
clients,
comandes,
empletats,
localitats,
posicions,
productes,
productes_comanda,
provincias,
tipus_producte;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pizzeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `botiga`
--

CREATE TABLE `botiga` (
  `id` int(11) NOT NULL,
  `direccio` varchar(30) NOT NULL,
  `cp` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories_pizza`
--

CREATE TABLE `categories_pizza` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `cognoms` varchar(40) NOT NULL,
  `adressa` varchar(50) NOT NULL,
  `localitat_id` int(11) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `registre` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comandes`
--

CREATE TABLE `comandes` (
  `id` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp(),
  `client_id` int(11) NOT NULL,
  `botiga_id` int(10) NOT NULL,
  `domicili` tinyint(1) NOT NULL DEFAULT 0,
  `quantitat` int(5) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empletats`
--

CREATE TABLE `empletats` (
  `id` int(11) NOT NULL,
  `botiga_id` int(10) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `cognoms` varchar(40) NOT NULL,
  `telefon` varchar(30) NOT NULL,
  `nif` varchar(30) NOT NULL,
  `posicio_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localitats`
--

CREATE TABLE `localitats` (
  `id` int(11) NOT NULL,
  `provincia_id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posicions`
--

CREATE TABLE `posicions` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `posicions`
--

INSERT INTO `posicions` (`id`, `nom`) VALUES
(1, 'cuiner'),
(2, 'repartidor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productes`
--

CREATE TABLE `productes` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `descripcio` text NOT NULL,
  `imatge` varchar(30) NOT NULL,
  `preu` float NOT NULL,
  `tipus_id` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productes_comanda`
--

CREATE TABLE `productes_comanda` (
  `id` int(11) NOT NULL,
  `comanda_id` int(11) NOT NULL,
  `producte_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipus_producte`
--

CREATE TABLE `tipus_producte` (
  `idTipus` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `botiga`
--
ALTER TABLE `botiga`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories_pizza`
--
ALTER TABLE `categories_pizza`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `localitat_id` (`localitat_id`);

--
-- Indices de la tabla `comandes`
--
ALTER TABLE `comandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `botiga_id` (`botiga_id`);

--
-- Indices de la tabla `empletats`
--
ALTER TABLE `empletats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `botiga_id` (`botiga_id`),
  ADD KEY `nif` (`nif`),
  ADD KEY `posicio_id` (`posicio_id`);

--
-- Indices de la tabla `localitats`
--
ALTER TABLE `localitats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provincia_id` (`provincia_id`);

--
-- Indices de la tabla `posicions`
--
ALTER TABLE `posicions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productes`
--
ALTER TABLE `productes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `tipus_id` (`tipus_id`);

--
-- Indices de la tabla `productes_comanda`
--
ALTER TABLE `productes_comanda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comanda_id` (`comanda_id`),
  ADD KEY `producte_id` (`producte_id`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipus_producte`
--
ALTER TABLE `tipus_producte`
  ADD PRIMARY KEY (`idTipus`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `botiga`
--
ALTER TABLE `botiga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories_pizza`
--
ALTER TABLE `categories_pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comandes`
--
ALTER TABLE `comandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empletats`
--
ALTER TABLE `empletats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `localitats`
--
ALTER TABLE `localitats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posicions`
--
ALTER TABLE `posicions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productes`
--
ALTER TABLE `productes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productes_comanda`
--
ALTER TABLE `productes_comanda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipus_producte`
--
ALTER TABLE `tipus_producte`
  MODIFY `idTipus` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `botiga`
--
ALTER TABLE `botiga`
  ADD CONSTRAINT `botiga_ibfk_1` FOREIGN KEY (`id`) REFERENCES `comandes` (`botiga_id`);

--
-- Filtros para la tabla `categories_pizza`
--
ALTER TABLE `categories_pizza`
  ADD CONSTRAINT `categories_pizza_ibfk_1` FOREIGN KEY (`id`) REFERENCES `productes` (`categoria_id`);

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`id`) REFERENCES `comandes` (`client_id`);

--
-- Filtros para la tabla `comandes`
--
ALTER TABLE `comandes`
  ADD CONSTRAINT `comandes_ibfk_1` FOREIGN KEY (`id`) REFERENCES `productes_comanda` (`comanda_id`);

--
-- Filtros para la tabla `empletats`
--
ALTER TABLE `empletats`
  ADD CONSTRAINT `empletats_ibfk_1` FOREIGN KEY (`botiga_id`) REFERENCES `botiga` (`id`),
  ADD CONSTRAINT `empletats_ibfk_2` FOREIGN KEY (`posicio_id`) REFERENCES `posicions` (`id`);

--
-- Filtros para la tabla `localitats`
--
ALTER TABLE `localitats`
  ADD CONSTRAINT `localitats_ibfk_1` FOREIGN KEY (`id`) REFERENCES `clients` (`localitat_id`);

--
-- Filtros para la tabla `productes`
--
ALTER TABLE `productes`
  ADD CONSTRAINT `productes_ibfk_1` FOREIGN KEY (`id`) REFERENCES `productes_comanda` (`producte_id`);

--
-- Filtros para la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD CONSTRAINT `provincias_ibfk_1` FOREIGN KEY (`id`) REFERENCES `localitats` (`provincia_id`);

--
-- Filtros para la tabla `tipus_producte`
--
ALTER TABLE `tipus_producte`
  ADD CONSTRAINT `tipus_producte_ibfk_1` FOREIGN KEY (`idTipus`) REFERENCES `productes` (`tipus_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
