-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:33067
-- Tiempo de generación: 24-03-2025 a las 15:55:54
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_naturista`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategorias` int(11) NOT NULL COMMENT 'ID de la categoría',
  `nombCategoria` varchar(55) NOT NULL COMMENT 'Nombre de la categoría'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucion`
--

CREATE TABLE `devolucion` (
  `idDevolucion` int(11) NOT NULL COMMENT 'ID de la devolución',
  `fechaDevolucion` date NOT NULL COMMENT 'Fecha de la devolución',
  `estadoDevolucion` varchar(45) NOT NULL COMMENT 'Estado de la devolución',
  `factura_idFactura` int(11) NOT NULL COMMENT 'ID de la factura asociada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domiciliarios`
--

CREATE TABLE `domiciliarios` (
  `idDomiciliarios` int(11) NOT NULL COMMENT 'ID del domiciliario',
  `nombDomiciliario` varchar(55) NOT NULL COMMENT 'Nombre del domiciliario',
  `numTelefono` varchar(15) NOT NULL COMMENT 'Teléfono del domiciliario',
  `direccionDomiciliario` varchar(100) NOT NULL COMMENT 'Dirección del domiciliario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL COMMENT 'ID de la factura',
  `fechaFactura` date NOT NULL COMMENT 'Fecha de la factura',
  `Usuarios_idUsuarios` int(11) NOT NULL COMMENT 'ID del usuario que generó la factura'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialcompras`
--

CREATE TABLE `historialcompras` (
  `idHistorialCompras` int(11) NOT NULL COMMENT 'ID del historial de compras',
  `Usuarios_idUsuarios` int(11) NOT NULL COMMENT 'ID del usuario',
  `fechaCompra` date NOT NULL COMMENT 'Fecha de la compra'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metododepago`
--

CREATE TABLE `metododepago` (
  `idMetodoDePago` int(11) NOT NULL COMMENT 'ID del método de pago',
  `nombreMetodoPago` varchar(45) NOT NULL COMMENT 'Nombre del método de pago'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(11) NOT NULL COMMENT 'ID del pago',
  `ReferenciaPago` varchar(45) NOT NULL COMMENT 'Referencia del pago',
  `factura_idFactura` int(11) NOT NULL COMMENT 'ID de la factura',
  `metodoDePago_idMetodoDePago` int(11) NOT NULL COMMENT 'ID del método de pago'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedidos` int(11) NOT NULL COMMENT 'ID del pedido',
  `fechaPedido` date NOT NULL COMMENT 'Fecha del pedido',
  `direccionPedido` varchar(100) NOT NULL COMMENT 'Dirección de entrega del pedido',
  `Usuarios_idUsuarios` int(11) NOT NULL COMMENT 'ID del usuario que realiza el pedido',
  `Pago_idPago` int(11) NOT NULL COMMENT 'ID del pago asociado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL COMMENT 'ID del producto',
  `nombProducto` varchar(50) NOT NULL COMMENT 'Nombre del producto',
  `valorUnitario` decimal(10,2) NOT NULL COMMENT 'Precio del producto',
  `Categorias_idCategorias` int(11) NOT NULL COMMENT 'ID de la categoría'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_has_domiciliarios`
--

CREATE TABLE `productos_has_domiciliarios` (
  `Productos_idProductos` int(11) NOT NULL COMMENT 'ID del producto',
  `Domiciliarios_idDomiciliarios` int(11) NOT NULL COMMENT 'ID del domiciliario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_has_historialcompras`
--

CREATE TABLE `productos_has_historialcompras` (
  `Productos_idProductos` int(11) NOT NULL COMMENT 'ID del producto',
  `HistorialCompras_idHistorialCompras` int(11) NOT NULL COMMENT 'ID del historial de compras'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL COMMENT 'ID del usuario',
  `nombUsuario` varchar(45) NOT NULL COMMENT 'Nombre completo del usuario',
  `numTelefono` varchar(15) DEFAULT NULL COMMENT 'Número de teléfono del usuario',
  `correoElectronico` varchar(60) NOT NULL COMMENT 'Correo electrónico del usuario',
  `rol` enum('cliente','administrador','repartidor') NOT NULL COMMENT 'Rol del usuario en la plataforma'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategorias`);

--
-- Indices de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD PRIMARY KEY (`idDevolucion`),
  ADD KEY `factura_idFactura` (`factura_idFactura`);

--
-- Indices de la tabla `domiciliarios`
--
ALTER TABLE `domiciliarios`
  ADD PRIMARY KEY (`idDomiciliarios`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `Usuarios_idUsuarios` (`Usuarios_idUsuarios`);

--
-- Indices de la tabla `historialcompras`
--
ALTER TABLE `historialcompras`
  ADD PRIMARY KEY (`idHistorialCompras`),
  ADD KEY `Usuarios_idUsuarios` (`Usuarios_idUsuarios`);

--
-- Indices de la tabla `metododepago`
--
ALTER TABLE `metododepago`
  ADD PRIMARY KEY (`idMetodoDePago`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`),
  ADD KEY `factura_idFactura` (`factura_idFactura`),
  ADD KEY `metodoDePago_idMetodoDePago` (`metodoDePago_idMetodoDePago`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedidos`),
  ADD KEY `Usuarios_idUsuarios` (`Usuarios_idUsuarios`),
  ADD KEY `Pago_idPago` (`Pago_idPago`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProductos`),
  ADD KEY `Categorias_idCategorias` (`Categorias_idCategorias`);

--
-- Indices de la tabla `productos_has_domiciliarios`
--
ALTER TABLE `productos_has_domiciliarios`
  ADD PRIMARY KEY (`Productos_idProductos`,`Domiciliarios_idDomiciliarios`),
  ADD KEY `Domiciliarios_idDomiciliarios` (`Domiciliarios_idDomiciliarios`);

--
-- Indices de la tabla `productos_has_historialcompras`
--
ALTER TABLE `productos_has_historialcompras`
  ADD PRIMARY KEY (`Productos_idProductos`,`HistorialCompras_idHistorialCompras`),
  ADD KEY `HistorialCompras_idHistorialCompras` (`HistorialCompras_idHistorialCompras`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuarios`),
  ADD UNIQUE KEY `correoElectronico` (`correoElectronico`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategorias` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de la categoría';

--
-- AUTO_INCREMENT de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  MODIFY `idDevolucion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de la devolución';

--
-- AUTO_INCREMENT de la tabla `domiciliarios`
--
ALTER TABLE `domiciliarios`
  MODIFY `idDomiciliarios` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del domiciliario';

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de la factura';

--
-- AUTO_INCREMENT de la tabla `historialcompras`
--
ALTER TABLE `historialcompras`
  MODIFY `idHistorialCompras` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del historial de compras';

--
-- AUTO_INCREMENT de la tabla `metododepago`
--
ALTER TABLE `metododepago`
  MODIFY `idMetodoDePago` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del método de pago';

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del pago';

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedidos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del pedido';

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del producto';

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuarios` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del usuario';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`factura_idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`Usuarios_idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `historialcompras`
--
ALTER TABLE `historialcompras`
  ADD CONSTRAINT `historialcompras_ibfk_1` FOREIGN KEY (`Usuarios_idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`factura_idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`metodoDePago_idMetodoDePago`) REFERENCES `metododepago` (`idMetodoDePago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`Usuarios_idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`Pago_idPago`) REFERENCES `pago` (`idPago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Categorias_idCategorias`) REFERENCES `categorias` (`idCategorias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_has_domiciliarios`
--
ALTER TABLE `productos_has_domiciliarios`
  ADD CONSTRAINT `productos_has_domiciliarios_ibfk_1` FOREIGN KEY (`Productos_idProductos`) REFERENCES `productos` (`idProductos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_has_domiciliarios_ibfk_2` FOREIGN KEY (`Domiciliarios_idDomiciliarios`) REFERENCES `domiciliarios` (`idDomiciliarios`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_has_historialcompras`
--
ALTER TABLE `productos_has_historialcompras`
  ADD CONSTRAINT `productos_has_historialcompras_ibfk_1` FOREIGN KEY (`Productos_idProductos`) REFERENCES `productos` (`idProductos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_has_historialcompras_ibfk_2` FOREIGN KEY (`HistorialCompras_idHistorialCompras`) REFERENCES `historialcompras` (`idHistorialCompras`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
