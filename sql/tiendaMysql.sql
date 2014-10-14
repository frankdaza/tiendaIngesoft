-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 13, 2014 at 09:01 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tienda`
--

-- --------------------------------------------------------

--
-- Table structure for table `ciudades`
--

CREATE TABLE IF NOT EXISTS `ciudades` (
  `id_ciudad` int(11) NOT NULL,
  `nombreciudad` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `id_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `ciudades`
--

INSERT INTO `ciudades` (`id_ciudad`, `nombreciudad`, `id_departamento`) VALUES
(5001, 'MEDELLIN', 5),
(5002, 'ABEJORRAL', 5),
(5004, 'ABRIAQUI', 5),
(5021, 'ALEJANDRIA', 5),
(8001, 'BARRANQUILLA', 8),
(8078, 'BARANOA', 8),
(11001, 'BOGOTA D.C', 11),
(13001, 'CARTAGENA', 13),
(13006, 'ACHI', 13),
(13030, 'ALTOS DEL ROSARIO', 13),
(15001, 'TUNJA', 15),
(15022, 'ALMEIDA', 15),
(15047, 'AQUITANIA', 15),
(17001, 'MANIZALES', 17),
(17013, 'AGUADAS', 17),
(17042, 'ANSERMA', 17),
(18001, 'FLORENCIA', 18),
(18029, 'ALBANIA', 18),
(18094, 'BELEN DE LOS ANDAQUIES', 18),
(19001, 'POPAYAN', 19),
(19022, 'ALMAGUER', 19),
(19050, 'ARGELIA', 19),
(20001, 'VALLEDUPAR', 20),
(20011, 'AGUACHICA', 20),
(20013, 'AGUSTIN CODAZZI', 20),
(23001, 'MONTERIA', 23),
(23068, 'AYAPEL', 23),
(23079, 'BUENAVISTA', 23),
(25001, 'AGUA DE DIOS', 25),
(25019, 'ALBAN', 25),
(25035, 'ANAPOIMA', 25),
(27001, 'QUIBDO', 27),
(27006, 'ACANDI', 27),
(27025, 'ALTO BAUDO', 27),
(41001, 'NEIVA', 41),
(41006, 'ACEVEDO', 41),
(41013, 'AGRADO', 41),
(44001, 'RIOHACHA', 44),
(44035, 'ALBANIA', 44),
(44078, 'BARRANCAS', 44),
(47001, 'SANTA MARTA', 47),
(47030, 'ALGARROBO', 47),
(47053, 'ARACATACA', 47),
(50001, 'VILLAVICENCIO', 50),
(50006, 'ACACIAS', 50),
(50110, 'BARRANCA DE UPIA', 50),
(52001, 'PASTO', 52),
(52019, 'ALBAN', 52),
(52022, 'ALDANA', 52),
(54001, 'CUCUTA', 54),
(54003, 'ABREGO', 54),
(54051, 'ARBOLEDAS', 54),
(63001, 'ARMENIA', 63),
(63111, 'BUENAVISTA', 63),
(63130, 'CALARCA', 63),
(66001, 'PEREIRA', 66),
(66045, 'APIA', 66),
(66075, 'BALBOA', 66),
(68001, 'BUCARAMANGA', 68),
(68013, 'AGUADA', 68),
(68020, 'ALBANIA', 68),
(70001, 'SINCELEJO', 70),
(70110, 'BUENAVISTA', 70),
(70124, 'CAIMITO', 70),
(73001, 'IBAGUE', 73),
(73024, 'ALPUJARRA', 73),
(73026, 'ALVARADO', 73),
(76001, 'CALI', 76),
(76020, 'ALCALA', 76),
(76036, 'ANDALUCIA', 76),
(80137, 'CAMPO DE LA CRUZ', 8),
(81001, 'ARAUCA', 81),
(81065, 'ARAUQUITA', 81),
(85001, 'YOPAL', 85),
(85010, 'AGUAZUL', 85),
(85015, 'CHAMEZA', 85),
(86001, 'MOCOA', 86),
(88001, 'SAN ANDRES', 88),
(88564, 'PROVIDENCIA', 88),
(94001, 'INIRIDA', 94),
(94343, 'BARRANCO MINAS', 94),
(94663, 'MAPIRIPANA', 94),
(95001, 'SAN JOSE DEL GUAVIARE', 95),
(95015, 'CALAMAR', 95),
(95025, 'EL RETORNO', 95),
(97001, 'MITU', 97),
(97161, 'CARURU', 97),
(97511, 'PACOA', 97),
(99001, 'PUERTO CARREÑO', 99),
(99524, 'LA PRIMAVERA', 99),
(99624, 'SANTA ROSALIA', 99),
(810220, 'CRAVO NORTE', 81),
(860219, 'COLON', 86),
(860320, 'ORITO', 86);

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(20) NOT NULL,
  `tel_cliente` bigint(16) NOT NULL,
  `nombre_cliente` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `date_cliente` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `tel_cliente`, `nombre_cliente`, `id_ciudad`, `date_cliente`) VALUES
(1000000, 3162904033, 'Frank Edward Daza González', 20013, '2014-10-03'),
(6278346, 31187977, 'Felipe Gutierres', 5001, '2014-09-03'),
(7873631, 345527892, 'Luisa Maria Certuche', 11001, '2014-08-05'),
(10656356, 56266354, 'Eugenia Andrade', 66001, '2013-09-05'),
(11046748, 31466894, 'Roberto Lopez', 11001, '2014-01-02'),
(17938794, 355607963, 'Carlos Gomez', 76001, '2013-06-05'),
(20708389, 473878, 'Ruben Londoño', 5001, '2014-02-05'),
(20732445, 4523234, 'Martin Londoño', 5001, '2012-07-05'),
(23462425, 6607963, 'Marlene Palacios', 76001, '2013-03-20'),
(61253707, 4757367, 'Julian Palacios', 76001, '2014-04-04'),
(82734872, 2374322, 'Andrea Martinez', 8001, '2014-05-05'),
(106873980, 56267090, 'Maria Andrade', 66001, '2013-09-05'),
(111668983, 2147483647, 'Hans Gordon', 8001, '2012-09-05'),
(115467389, 2147483647, 'Juan Gordon', 8001, '2013-08-05'),
(125865497, 6474839, 'Andres Lopez', 66001, '2013-09-15'),
(238479723, 4564778, 'Mario Hernandez', 5001, '2013-01-05'),
(863476387, 58567234, 'Martha Lucia Lopez', 11001, '2014-09-05'),
(890287487, 2374683, 'Andres Martinez', 8001, '2014-09-05'),
(898392749, 2873644, 'Maria Luisa Perez', 66001, '2014-09-05'),
(928734987, 4254672, 'Federico Hernandez', 76001, '2012-09-05'),
(2147483647, 2147483647, 'Steven Certuche', 11001, '2014-09-05');

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

CREATE TABLE IF NOT EXISTS `departamentos` (
  `id_departamento` int(11) NOT NULL,
  `nombredepartamento` varchar(25) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`id_departamento`, `nombredepartamento`) VALUES
(5, 'Antioquia'),
(8, 'Atlantico'),
(11, 'Bogota D.C'),
(13, 'Bolivar'),
(15, 'Boyaca'),
(17, 'Caldas'),
(18, 'Caqueta'),
(19, 'Cauca'),
(20, 'Cesar'),
(23, 'Cordoba'),
(25, 'Cundinamarca'),
(27, 'Choco'),
(41, 'Huila'),
(44, 'La guajira'),
(47, 'Magdalena'),
(50, 'Meta'),
(52, 'Nariño'),
(54, 'Norte de santander'),
(63, 'Quindio'),
(66, 'Risaralda'),
(68, 'Santander'),
(70, 'Sucre'),
(73, 'Tolima'),
(76, 'Valle del cauca'),
(81, 'Arauca'),
(85, 'Casanare'),
(86, 'Putumayo'),
(88, 'San andres'),
(91, 'Amazonas'),
(94, 'Guainia'),
(95, 'Guaviare'),
(97, 'Vaupes'),
(99, 'Vichada');

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
`idempleado` int(11) NOT NULL,
  `departamento` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `salario` int(8) NOT NULL,
  `edad` varchar(3) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `empleados`
--

INSERT INTO `empleados` (`idempleado`, `departamento`, `salario`, `edad`) VALUES
(1, 'ventas', 3000, '24'),
(2, 'ventas', 3200, '26'),
(3, 'ventas', 3500, '35'),
(4, 'distribucion', 2000, '22'),
(5, 'distribucion', 2100, '42'),
(6, 'distribucion', 2400, '40'),
(7, 'produccion', 2800, '41'),
(8, 'produccion', 2400, '29'),
(9, 'produccion', 1900, '19'),
(10, 'produccion', 3000, '45'),
(11, 'produccion', 3000, '40');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
`id_producto` int(11) NOT NULL,
  `id_tipoproducto` int(10) NOT NULL,
  `descripcion_producto` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `precio_producto` bigint(8) NOT NULL,
  `ref_producto` bigint(10) NOT NULL,
  `presentacion_producto` varchar(30) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1032 ;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id_producto`, `id_tipoproducto`, `descripcion_producto`, `precio_producto`, `ref_producto`, `presentacion_producto`) VALUES
(1003, 5, 'Soporte', 100000, 97649, 'Caja'),
(1004, 4, 'Aceite', 65000, 92650, 'Galon'),
(1005, 5, 'Limpiador', 20000, 9236597, 'Galon'),
(1006, 2, 'Taladro', 250000, 297657, 'Caja'),
(1007, 2, 'Pulidora', 300000, 347568, 'Caja'),
(1008, 2, 'Cortadora', 185000, 3945672, 'Caja'),
(1009, 2, 'Juego Destornilladores', 50000, 293497, 'Caja'),
(1010, 5, 'Silicona', 15000, 394593, 'Tubo'),
(1011, 1, 'Accesorios Industriales', 25000, 93476, 'Caja'),
(1012, 3, 'Pegante', 45000, 23423, 'Tubo'),
(1013, 2, 'Juego Llaves', 55000, 9623, 'Individual'),
(1014, 6, 'Soporte Mecanico', 120000, 97650, 'Caja'),
(1015, 9, 'Aceite Especial', 75000, 92660, 'Galon'),
(1016, 10, 'Limpiador Penetrante', 22000, 9236598, 'Galon'),
(1017, 7, 'Taladro Industrial', 350000, 297658, 'Caja'),
(1018, 6, 'Pulidora', 400000, 347569, 'Caja'),
(1019, 6, 'Cortadora Industrial', 285000, 3945673, 'Caja'),
(1020, 2, 'Juego Alicates', 50000, 293497, 'Caja'),
(1021, 5, 'Silicona Grande', 25000, 394594, 'Tubo'),
(1022, 13, 'Accesorios Electricos', 25000, 93476, 'Caja'),
(1023, 8, 'Pegante Fuerte', 55000, 23424, 'Tubo'),
(1024, 7, 'Juego Llaves Aleman', 65000, 9624, 'Individual'),
(1025, 12, 'Soporte Electromencanico', 100000, 97649, 'Caja'),
(1026, 14, 'Aceite Mutigrado', 75000, 92651, 'Galon'),
(1027, 15, 'Limpiador', 30000, 9236599, 'Galon'),
(1028, 11, 'Taladro Industrial', 350000, 297660, 'Caja'),
(1029, 11, 'Pulidora Neumatica', 360000, 347570, 'Caja'),
(1030, 12, 'Cortadora Electrica', 195000, 3945680, 'Caja'),
(1031, 7, 'Juego Destornilladores Magneticos	', 60000, 293500, 'Caja');

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
--

CREATE TABLE IF NOT EXISTS `proveedores` (
`id_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `nit_proveedor` bigint(20) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `tel_proveedor` bigint(16) NOT NULL,
  `direccion_proveedor` varchar(100) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre_proveedor`, `nit_proveedor`, `id_ciudad`, `tel_proveedor`, `direccion_proveedor`) VALUES
(1, 'Dsitribuciones Cali', 890327682, 76001, 2147483647, 'cra1#376-45'),
(2, 'Alimentos el Paisa S.A', 2147483647, 66001, 64783889, 'av8N#68-144'),
(3, 'Internacional de Cosas Ltda', 2147483647, 5001, 467484, 'Calle 25#878-346'),
(4, 'La Cosa Rica S.A.S', 87653989, 11001, 8964534, 'Clla 45#34-120'),
(5, 'La confianza Ltda', 879579873, 76001, 9236792, 'Clla54#346-34'),
(6, 'Productos el canario S.A', 890768768, 8001, 9287970, 'Cra67A#45-234'),
(7, 'Comercializadora la quinta', 880235376, 66001, 923697799, 'Cra5#345-345'),
(8, 'Productos especiales S.A', 2147483647, 5001, 2147483647, 'Cra23#36-35'),
(9, 'Internacional de suministros', 890923776, 11001, 58782973, 'Cra23#36-35'),
(10, 'Producto Colombia S.A', 800763387, 8001, 34587988, 'Calle 65#34-23'),
(11, 'Altecnica Cali', 2147483647, 8001, 3662345, 'cra1#36-55'),
(12, 'Implementos el Paisa S.A', 2147483647, 11001, 64723542, 'av9N#68-14'),
(13, 'Internacional de Herramientas Ltda', 2147483647, 5001, 46748423, 'Calle 5#78-46'),
(14, 'La Maquina S.A.S', 2147483647, 66001, 865764754, 'Calle 5#34-120'),
(15, 'Distribuidor Industrial Ltda', 880876787, 8001, 67572882, 'Calle 54#46-34'),
(16, 'Productos el canario S.A', 890768768, 76001, 9287970, 'Cra67a#45-234'),
(17, 'Comercializadora Mecanica', 880235376, 11001, 314767984, 'Cra15#35-35'),
(18, 'Productos Industriales S.A', 870976376, 5001, 314852398, 'Cra3#36-3'),
(19, 'Internacional de suministros2 Ltda', 880923776, 66001, 315382973, 'Cra3#3-35'),
(20, 'Colombiana de Solucionez S.A', 880763387, 76001, 314587988, 'Calle 6#3-23'),
(21, 'Altecnica Bogota', 2147483647, 11001, 4662345, 'cra2#36-55'),
(22, 'Implementos S.A', 2147483647, 8001, 64723234, 'av10N#68-14'),
(23, 'Internacional Ltda', 2147483647, 5001, 46748345, 'Calle 8#78-46'),
(24, 'La Maquina S.A', 2147483647, 66001, 865764765, 'Calle 15#34-120'),
(25, 'Distribuidor Ltda', 2147483647, 8001, 675723456, 'Calle 14#146-34'),
(26, 'Productos S.A', 2147483647, 76001, 9287567, 'Cra7#45-234'),
(27, 'Comercializadora Ltda.', 2147483647, 11001, 2147483647, 'Cra5#65-35'),
(28, 'Industriales S.A', 870976234, 5001, 314852398, 'Cra33#3-3'),
(29, 'Suministros Ltda', 880927857, 66001, 315382767, 'Cra3#3-35'),
(30, 'Soluciones S.A', 880123345, 76001, 314587988, 'Calle 66#35-3');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_productos`
--

CREATE TABLE IF NOT EXISTS `tipo_productos` (
`id_tipoproducto` int(10) NOT NULL,
  `desc_tipoproducto` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `perecedero_tipoproducto` varchar(1) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `tipo_productos`
--

INSERT INTO `tipo_productos` (`id_tipoproducto`, `desc_tipoproducto`, `perecedero_tipoproducto`) VALUES
(1, 'accesorios', 'N'),
(2, 'herramientas', 'N'),
(3, 'pegantes', 'Y'),
(4, 'lubricantes', 'Y'),
(5, 'otros', 'N'),
(6, 'Accesorios Electricos', 'N'),
(7, 'Herramienta Liviana', 'N'),
(8, 'Pegantes Especiales', 'Y'),
(9, 'Lubricantes Industriales', 'Y'),
(10, 'otros Accesorios', 'N'),
(11, 'Herramienta Pesada', 'N'),
(12, 'Herramienta Electrica', 'N'),
(13, 'Accesorios Electricos', 'Y'),
(14, 'lubricantes Especiales', 'Y'),
(15, 'Varios', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
`id_usuario` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  `clave` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `rol` int(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `clave`, `rol`) VALUES
(1, 'Frank Edward Daza González', 'frank.daza2@gmail.com', 'Knarf01,.*,.', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ciudades`
--
ALTER TABLE `ciudades`
 ADD PRIMARY KEY (`id_ciudad`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
 ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
 ADD PRIMARY KEY (`id_departamento`);

--
-- Indexes for table `empleados`
--
ALTER TABLE `empleados`
 ADD PRIMARY KEY (`idempleado`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
 ADD PRIMARY KEY (`id_producto`);

--
-- Indexes for table `proveedores`
--
ALTER TABLE `proveedores`
 ADD PRIMARY KEY (`id_proveedor`);

--
-- Indexes for table `tipo_productos`
--
ALTER TABLE `tipo_productos`
 ADD PRIMARY KEY (`id_tipoproducto`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `empleados`
--
ALTER TABLE `empleados`
MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1032;
--
-- AUTO_INCREMENT for table `proveedores`
--
ALTER TABLE `proveedores`
MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `tipo_productos`
--
ALTER TABLE `tipo_productos`
MODIFY `id_tipoproducto` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
