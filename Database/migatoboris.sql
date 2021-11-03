-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2021 a las 21:55:29
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
-- Base de datos: `migatoboris`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `no_control` int(30) NOT NULL,
  `ids` int(30) NOT NULL,
  `idc` int(30) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellido_paterno` varchar(30) NOT NULL,
  `apellido_materno` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `idc` int(30) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`idc`, `nombre`) VALUES
(1, 'SISTEMAS COMPUTACIONALES'),
(2, 'GESTION EMPRESARIAL'),
(3, 'BIOQUIMICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `idh` int(30) NOT NULL,
  `hora` datetime DEFAULT NULL,
  `dia` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(30) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `no_control_prof` int(30) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE `semestre` (
  `ids` int(30) NOT NULL,
  `semestre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `semestre`
--

INSERT INTO `semestre` (`ids`, `semestre`) VALUES
(1, 'primero'),
(2, 'segundo'),
(3, 'tercero'),
(4, 'cuarto'),
(5, 'quinto'),
(6, 'sexto'),
(7, 'septimo'),
(8, 'octavo'),
(9, 'noveno'),
(10, 'decimo'),
(11, 'onceavo'),
(12, 'doceavo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutorias`
--

CREATE TABLE `tutorias` (
  `idtu` int(30) NOT NULL,
  `no_control_prof` int(30) NOT NULL,
  `no_control` int(30) NOT NULL,
  `idh` int(30) NOT NULL,
  `grupo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Antonio', 'linares', 'alumnoitma@gmail.com', '$2y$04$rtgRdtdplBw5tfuiDMIPJO52hViczFGamabDZB.Aw8kuL97i6B24m', '2021-09-08 18:35:44', '2021-09-08 18:35:44'),
(2, 'Antonio', 'Carbajal', 'tony@gmail.com', '$2y$04$RaGwsHnvtR12uAw3lnQWqOWMPWOQ99UEhOnDL0SJoTv/ZYvDfVh0u', '2021-09-08 18:36:05', '2021-09-08 18:36:05'),
(3, 'dariana', 'becerril', 'dar@gmail.com', '$2y$04$JgLyqbCc0xQ1gwp.MU/LuuWnmpNUqxS5d2bvermD27z0sHeO3OxBi', '2021-09-08 18:41:04', '2021-09-08 18:41:04'),
(4, 'jony', 'rosas', 'jony@gmail.com', '$2y$04$OWsHPd2.nqk0udTI7KFQRuF1yXOxsQJbHW/4ZGmKKgmMIQEN4oAzK', '2021-09-08 18:57:05', '2021-09-08 18:57:05'),
(5, 'fernanda', 'morales', 'fer@gmail.com', '$2y$04$SCKN0uZl3AwJGZcTQvGRSe57BX8Xp3mkjeVkqcbcfgyOAwrU4DDrq', '2021-09-08 19:59:58', '2021-09-08 19:59:58'),
(6, 'luis', 'villavicencio', 'luis@gmail.com', '$2y$04$5u7X.7SltuT.deolWjaT5ORnkD83lpzPi2zOgPMEjyPbGZJTy9nP6', '2021-09-16 20:03:06', '2021-09-16 20:03:06'),
(7, 'juan', 'Martinez', 'juan@gmail.com', '$2y$04$TN4dsGbqXIwxH48cG325GeDeGynZH4Bca5NLwvUSH6Jd1E1QnTkpq', '2021-09-24 01:27:22', '2021-09-24 01:27:22'),
(8, 'Mi gato', 'Boris', 'Migato@gmail.com', '$2y$04$Eu0Tao5pWQ1H.9jjDTQpbeT3MiEshuIv3oQ1XsYBwIhw3zntky6ZG', '2021-09-27 19:02:36', '2021-09-27 19:02:36'),
(9, 'skiper', 'cat', 'skipercat@gmail.com', '$2y$04$Em0eEEKbJOj8IdgUK0DsC.2dq4WqxVkl4dGHQVDgtYzqFInOk1wp.', '2021-10-11 18:20:16', '2021-10-11 18:20:16');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`no_control`),
  ADD KEY `ids` (`ids`),
  ADD KEY `idc` (`idc`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`idc`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`idh`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`no_control_prof`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`ids`);

--
-- Indices de la tabla `tutorias`
--
ALTER TABLE `tutorias`
  ADD PRIMARY KEY (`idtu`),
  ADD KEY `no_control_prof` (`no_control_prof`),
  ADD KEY `no_control` (`no_control`),
  ADD KEY `idh` (`idh`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `no_control` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `idc` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `idh` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `no_control_prof` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `semestre`
--
ALTER TABLE `semestre`
  MODIFY `ids` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tutorias`
--
ALTER TABLE `tutorias`
  MODIFY `idtu` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`ids`) REFERENCES `semestre` (`ids`),
  ADD CONSTRAINT `alumnos_ibfk_2` FOREIGN KEY (`idc`) REFERENCES `carrera` (`idc`);

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `tutorias`
--
ALTER TABLE `tutorias`
  ADD CONSTRAINT `tutorias_ibfk_1` FOREIGN KEY (`no_control_prof`) REFERENCES `profesores` (`no_control_prof`),
  ADD CONSTRAINT `tutorias_ibfk_2` FOREIGN KEY (`no_control`) REFERENCES `alumnos` (`no_control`),
  ADD CONSTRAINT `tutorias_ibfk_3` FOREIGN KEY (`idh`) REFERENCES `horario` (`idh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
