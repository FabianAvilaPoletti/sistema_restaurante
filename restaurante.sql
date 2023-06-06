-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2023 a las 23:53:09
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bebidas`
--

CREATE TABLE `bebidas` (
  `idBebida` int(10) UNSIGNED NOT NULL,
  `nombreBebida` varchar(20) DEFAULT NULL,
  `precioBebida` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bebidas`
--

INSERT INTO `bebidas` (`idBebida`, `nombreBebida`, `precioBebida`) VALUES
(1, 'Jugo de Naranja', '200.00'),
(2, 'Agua 350ml', '300.00'),
(3, 'Cafe', '300.00'),
(4, 'Coca cola 350ml', '500.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carta_menu`
--

CREATE TABLE `carta_menu` (
  `idCartaMenu` int(10) UNSIGNED NOT NULL,
  `idMenu` int(10) UNSIGNED NOT NULL,
  `idComida` int(10) UNSIGNED DEFAULT NULL,
  `idBebida` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carta_menu`
--

INSERT INTO `carta_menu` (`idCartaMenu`, `idMenu`, `idComida`, `idBebida`) VALUES
(1, 1, 2, 3),
(2, 2, 1, 1),
(3, 3, 1, 1),
(4, 4, 3, 4),
(5, 5, 3, NULL),
(6, 6, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(10) UNSIGNED NOT NULL,
  `idPersona` int(10) UNSIGNED NOT NULL,
  `fechaRegistro` date DEFAULT NULL,
  `preferencias` varchar(100) DEFAULT NULL,
  `condicionesEspeciales` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comidas`
--

CREATE TABLE `comidas` (
  `idComida` int(10) UNSIGNED NOT NULL,
  `idReceta` int(10) UNSIGNED NOT NULL,
  `nombreComida` varchar(20) DEFAULT NULL,
  `precioComida` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comidas`
--

INSERT INTO `comidas` (`idComida`, `idReceta`, `nombreComida`, `precioComida`) VALUES
(1, 1, 'Chipitas', '300.00'),
(2, 2, 'Medialunas', '500.00'),
(3, 3, 'Pizza', '1500.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `idDetalle_pedidos` int(10) UNSIGNED NOT NULL,
  `idFaltante` int(10) UNSIGNED NOT NULL,
  `idCartaMenu` int(10) UNSIGNED NOT NULL,
  `idPedido` int(10) UNSIGNED NOT NULL,
  `subTotal` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faltantes`
--

CREATE TABLE `faltantes` (
  `idFaltante` int(10) UNSIGNED NOT NULL,
  `idInventario` int(10) UNSIGNED NOT NULL,
  `cantidad` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes_recetas`
--

CREATE TABLE `ingredientes_recetas` (
  `idIngredientesRecetas` int(10) UNSIGNED NOT NULL,
  `idReceta` int(10) UNSIGNED NOT NULL,
  `idInventario` int(10) UNSIGNED NOT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idInventario` int(10) UNSIGNED NOT NULL,
  `idProveedor` int(10) UNSIGNED NOT NULL,
  `nombreInsumo` varchar(100) DEFAULT NULL,
  `stockActual` decimal(10,2) DEFAULT NULL,
  `stockMinimo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `idMenu` int(10) UNSIGNED NOT NULL,
  `idTipoMenu` int(10) UNSIGNED NOT NULL,
  `nombreMenu` varchar(40) DEFAULT NULL,
  `descripcionMenu` text DEFAULT NULL,
  `precio` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`idMenu`, `idTipoMenu`, `nombreMenu`, `descripcionMenu`, `precio`) VALUES
(1, 1, 'Desayuno Clásico', '\"Desayuno Clásico\": disfruta de un rico café recién hecho acompañado de nuestras deliciosas medialunas recién horneadas, perfectas para empezar el día con energía.', '800.00'),
(2, 1, 'Combo Ligero', 'Disfruta de un delicioso y completo combo para comenzar tu día o para una pausa en la tarde. Incluye refrescante jugo de naranja recién exprimido y crujientes chipitas horneadas con la receta tradicional. ¡La combinación perfecta para una mañana o tarde sabrosa y energizante!', '450.00'),
(3, 3, 'Combo Ligero', 'Disfruta de un delicioso y completo combo para comenzar tu día o para una pausa en la tarde. Incluye refrescante jugo de naranja recién exprimido y crujientes chipitas horneadas con la receta tradicional. ¡La combinación perfecta para una mañana o tarde sabrosa y energizante!', '450.00'),
(4, 2, 'Combo Pizza Express', 'Disfruta de una deliciosa pizza clásica recién horneada, con ingredientes de alta calidad y una salsa de tomate casera. Elaborada con una masa fina y crujiente, y con una gran variedad de opciones para elegir. Perfecta para compartir con amigos y familiares. Y para acompañar, una deliciosa y refrescante coca cola!', '1900.00'),
(5, 4, 'Pizza Express', 'Disfruta de una deliciosa pizza clásica recién horneada, con ingredientes de alta calidad y una salsa de tomate casera. Elaborada con una masa fina y crujiente, y con una gran variedad de opciones para elegir. Perfecta para compartir con amigos y familiares.', '1500.00'),
(6, 1, 'Chipitazo Correntino', 'Deliciosas chipitas calentitas, recién horneadas y listas para disfrutar en cualquier momento del día. Perfectas para acompañar con una taza de café o té', '300.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `idMesa` int(10) UNSIGNED NOT NULL,
  `idTipoMesa` int(10) UNSIGNED NOT NULL,
  `numeroMesa` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad_factura`
--

CREATE TABLE `modalidad_factura` (
  `idModalidad_Factura` int(10) UNSIGNED NOT NULL,
  `modalidadFactura` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int(10) UNSIGNED NOT NULL,
  `idTipo_factura` int(10) UNSIGNED NOT NULL,
  `idModalidad_Factura` int(10) UNSIGNED NOT NULL,
  `idProveedor` int(10) UNSIGNED NOT NULL,
  `idRestaurante` int(10) UNSIGNED NOT NULL,
  `idCliente` int(10) UNSIGNED NOT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `idPersona` int(10) UNSIGNED NOT NULL,
  `dni` int(10) UNSIGNED DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int(10) UNSIGNED NOT NULL,
  `nombreProveedor` varchar(50) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` int(10) UNSIGNED DEFAULT NULL,
  `sitioWeb` varchar(100) DEFAULT NULL,
  `servicios` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `idReceta` int(10) UNSIGNED NOT NULL,
  `descripcionReceta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`idReceta`, `descripcionReceta`) VALUES
(1, 'Precalentar el horno a 200°C.\r\n\r\nEn un bol grande, mezclar el almidón de mandioca, el queso rallado y la sal.\r\n\r\nEn otro bol, batir los huevos y agregar el aceite. Mezclar bien.\r\n\r\nIncorporar la mezcla de huevos y aceite al bol de los ingredientes secos y amasar hasta obtener una masa homogénea.\r\n\r\nFormar pequeñas bolitas con la masa y colocarlas en una bandeja para horno previamente engrasada o cubierta con papel para hornear.\r\n\r\nHornear durante 15-20 minutos o hasta que estén doradas y crujientes.\r\n\r\nRetirar del horno y dejar enfriar antes de servir.'),
(2, 'Precalentar el horno a 200°C.\r\nEn un bol grande, mezclar el almidón de mandioca, el queso rallado y la sal.\r\n\r\nEn otro bol, batir los huevos y agregar el aceite. Mezclar bien.\r\n\r\nIncorporar la mezcla de huevos y aceite al bol de los ingredientes secos y amasar hasta obtener una masa homogénea.\r\n\r\nFormar pequeñas bolitas con la masa y colocarlas en una bandeja para horno previamente engrasada o cubierta con papel para hornear.\r\n\r\nHornear durante 15-20 minutos o hasta que estén doradas y crujientes.\r\n\r\nRetirar del horno y dejar enfriar antes de servir.'),
(3, 'Precalienta el horno a 220 grados Celsius.\r\n\r\nExtiende la masa de pizza sobre una superficie enharinada hasta que tenga el tamaño deseado.\r\n\r\nColoca la masa de pizza en una bandeja para hornear previamente engrasada.\r\n\r\nAgrega la salsa de tomate sobre la masa, dejando un borde de alrededor de 1 cm sin cubrir.\r\n\r\nEspolvorea el queso mozzarella rallado y el queso parmesano rallado sobre la salsa de tomate.\r\n\r\nColoca las rebanadas de pepperoni sobre el queso.\r\n\r\nEspolvorea la cucharadita de orégano sobre la pizza.\r\n\r\nRocía un poco de aceite de oliva sobre la pizza.\r\n\r\nHornea la pizza durante 10-15 minutos o hasta que el queso esté dorado y burbujeante.\r\n\r\nSaca la pizza del horno y deja que se enfríe durante unos minutos antes de cortarla y servirla.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitos`
--

CREATE TABLE `remitos` (
  `idRemito` int(10) UNSIGNED NOT NULL,
  `idProveedor` int(10) UNSIGNED NOT NULL,
  `fechaRemito` date DEFAULT NULL,
  `totalRemito` decimal(9,2) DEFAULT NULL,
  `fotoRemito` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `idReserva` int(10) UNSIGNED NOT NULL,
  `idCliente` int(10) UNSIGNED NOT NULL,
  `idMesa` int(10) UNSIGNED NOT NULL,
  `fechaYHora` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurante`
--

CREATE TABLE `restaurante` (
  `idRestaurante` int(10) UNSIGNED NOT NULL,
  `nombreRestaurante` varchar(50) DEFAULT NULL,
  `direccionLocal` varchar(50) DEFAULT NULL,
  `telefonoLocal` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(10) UNSIGNED NOT NULL,
  `rol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_factura`
--

CREATE TABLE `tipo_factura` (
  `idTipo_factura` int(10) UNSIGNED NOT NULL,
  `nombreTipoFactura` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_menu`
--

CREATE TABLE `tipo_menu` (
  `idTipoMenu` int(10) UNSIGNED NOT NULL,
  `nombreTipoMenu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_menu`
--

INSERT INTO `tipo_menu` (`idTipoMenu`, `nombreTipoMenu`) VALUES
(1, 'Desayuno'),
(2, 'Almuerzo'),
(3, 'Merienda'),
(4, 'Cena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_mesa`
--

CREATE TABLE `tipo_mesa` (
  `idTipoMesa` int(10) UNSIGNED NOT NULL,
  `tamanio` varchar(50) DEFAULT NULL,
  `capacidad` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `idRol` int(10) UNSIGNED NOT NULL,
  `idPersona` int(10) UNSIGNED NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bebidas`
--
ALTER TABLE `bebidas`
  ADD PRIMARY KEY (`idBebida`);

--
-- Indices de la tabla `carta_menu`
--
ALTER TABLE `carta_menu`
  ADD PRIMARY KEY (`idCartaMenu`),
  ADD KEY `carta_menu_FKIndex1` (`idBebida`),
  ADD KEY `carta_menu_FKIndex2` (`idComida`),
  ADD KEY `carta_menu_FKIndex3` (`idMenu`),
  ADD KEY `IFK_Rel_09` (`idBebida`),
  ADD KEY `IFK_Rel_10` (`idComida`),
  ADD KEY `IFK_Rel_11` (`idMenu`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `clientes_FKIndex1` (`idPersona`),
  ADD KEY `IFK_Rel_03` (`idPersona`);

--
-- Indices de la tabla `comidas`
--
ALTER TABLE `comidas`
  ADD PRIMARY KEY (`idComida`),
  ADD KEY `comidas_FKIndex1` (`idReceta`),
  ADD KEY `IFK_Rel_12` (`idReceta`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`idDetalle_pedidos`),
  ADD KEY `detalle_pedidos_FKIndex1` (`idCartaMenu`),
  ADD KEY `detalle_pedidos_FKIndex2` (`idPedido`),
  ADD KEY `detalle_pedidos_FKIndex3` (`idFaltante`),
  ADD KEY `IFK_Rel_17` (`idCartaMenu`),
  ADD KEY `IFK_Rel_18` (`idPedido`),
  ADD KEY `IFK_Rel_23` (`idFaltante`);

--
-- Indices de la tabla `faltantes`
--
ALTER TABLE `faltantes`
  ADD PRIMARY KEY (`idFaltante`),
  ADD KEY `faltantes_FKIndex1` (`idInventario`),
  ADD KEY `IFK_Rel_04` (`idInventario`);

--
-- Indices de la tabla `ingredientes_recetas`
--
ALTER TABLE `ingredientes_recetas`
  ADD PRIMARY KEY (`idIngredientesRecetas`),
  ADD KEY `ingredientes_recetas_FKIndex1` (`idInventario`),
  ADD KEY `ingredientes_recetas_FKIndex2` (`idReceta`),
  ADD KEY `IFK_Rel_09` (`idInventario`),
  ADD KEY `IFK_Rel_10` (`idReceta`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`),
  ADD KEY `inventario_FKIndex1` (`idProveedor`),
  ADD KEY `IFK_Rel_06` (`idProveedor`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idMenu`),
  ADD KEY `menus_FKIndex1` (`idTipoMenu`),
  ADD KEY `IFK_Rel_08` (`idTipoMenu`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`idMesa`),
  ADD KEY `mesa_FKIndex1` (`idTipoMesa`),
  ADD KEY `IFK_Rel_20` (`idTipoMesa`);

--
-- Indices de la tabla `modalidad_factura`
--
ALTER TABLE `modalidad_factura`
  ADD PRIMARY KEY (`idModalidad_Factura`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `pedidos_FKIndex1` (`idRestaurante`),
  ADD KEY `pedidos_FKIndex2` (`idCliente`),
  ADD KEY `pedidos_FKIndex3` (`idProveedor`),
  ADD KEY `pedidos_FKIndex4` (`idTipo_factura`),
  ADD KEY `pedidos_FKIndex5` (`idModalidad_Factura`),
  ADD KEY `IFK_Rel_20` (`idRestaurante`),
  ADD KEY `IFK_Rel_21` (`idCliente`),
  ADD KEY `IFK_Rel_22` (`idProveedor`),
  ADD KEY `IFK_Rel_23` (`idTipo_factura`),
  ADD KEY `IFK_Rel_24` (`idModalidad_Factura`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`idReceta`);

--
-- Indices de la tabla `remitos`
--
ALTER TABLE `remitos`
  ADD PRIMARY KEY (`idRemito`),
  ADD KEY `remitos_FKIndex1` (`idProveedor`),
  ADD KEY `IFK_Rel_24` (`idProveedor`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `reservas_FKIndex1` (`idMesa`),
  ADD KEY `reservas_FKIndex2` (`idCliente`),
  ADD KEY `IFK_Rel_21` (`idMesa`),
  ADD KEY `IFK_Rel_22` (`idCliente`);

--
-- Indices de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`idRestaurante`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `tipo_factura`
--
ALTER TABLE `tipo_factura`
  ADD PRIMARY KEY (`idTipo_factura`);

--
-- Indices de la tabla `tipo_menu`
--
ALTER TABLE `tipo_menu`
  ADD PRIMARY KEY (`idTipoMenu`);

--
-- Indices de la tabla `tipo_mesa`
--
ALTER TABLE `tipo_mesa`
  ADD PRIMARY KEY (`idTipoMesa`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `Usuarios_FKIndex1` (`idPersona`),
  ADD KEY `Usuarios_FKIndex2` (`idRol`),
  ADD KEY `IFK_Rel_01` (`idPersona`),
  ADD KEY `IFK_Rel_02` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bebidas`
--
ALTER TABLE `bebidas`
  MODIFY `idBebida` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `carta_menu`
--
ALTER TABLE `carta_menu`
  MODIFY `idCartaMenu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comidas`
--
ALTER TABLE `comidas`
  MODIFY `idComida` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `idDetalle_pedidos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `faltantes`
--
ALTER TABLE `faltantes`
  MODIFY `idFaltante` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingredientes_recetas`
--
ALTER TABLE `ingredientes_recetas`
  MODIFY `idIngredientesRecetas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idInventario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `idMenu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mesa`
--
ALTER TABLE `mesa`
  MODIFY `idMesa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modalidad_factura`
--
ALTER TABLE `modalidad_factura`
  MODIFY `idModalidad_Factura` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedido` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `idPersona` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `idReceta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `remitos`
--
ALTER TABLE `remitos`
  MODIFY `idRemito` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `idReserva` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  MODIFY `idRestaurante` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_factura`
--
ALTER TABLE `tipo_factura`
  MODIFY `idTipo_factura` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_menu`
--
ALTER TABLE `tipo_menu`
  MODIFY `idTipoMenu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_mesa`
--
ALTER TABLE `tipo_mesa`
  MODIFY `idTipoMesa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carta_menu`
--
ALTER TABLE `carta_menu`
  ADD CONSTRAINT `carta_menu_ibfk_1` FOREIGN KEY (`idBebida`) REFERENCES `bebidas` (`idBebida`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `carta_menu_ibfk_2` FOREIGN KEY (`idComida`) REFERENCES `comidas` (`idComida`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `carta_menu_ibfk_3` FOREIGN KEY (`idMenu`) REFERENCES `menu` (`idMenu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comidas`
--
ALTER TABLE `comidas`
  ADD CONSTRAINT `comidas_ibfk_1` FOREIGN KEY (`idReceta`) REFERENCES `recetas` (`idReceta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`idCartaMenu`) REFERENCES `carta_menu` (`idCartaMenu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_pedidos_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_pedidos_ibfk_3` FOREIGN KEY (`idFaltante`) REFERENCES `faltantes` (`idFaltante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `faltantes`
--
ALTER TABLE `faltantes`
  ADD CONSTRAINT `faltantes_ibfk_1` FOREIGN KEY (`idInventario`) REFERENCES `inventario` (`idInventario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingredientes_recetas`
--
ALTER TABLE `ingredientes_recetas`
  ADD CONSTRAINT `ingredientes_recetas_ibfk_1` FOREIGN KEY (`idInventario`) REFERENCES `inventario` (`idInventario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ingredientes_recetas_ibfk_2` FOREIGN KEY (`idReceta`) REFERENCES `recetas` (`idReceta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`idTipoMenu`) REFERENCES `tipo_menu` (`idTipoMenu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD CONSTRAINT `mesa_ibfk_1` FOREIGN KEY (`idTipoMesa`) REFERENCES `tipo_mesa` (`idTipoMesa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idRestaurante`) REFERENCES `restaurante` (`idRestaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pedidos_ibfk_4` FOREIGN KEY (`idTipo_factura`) REFERENCES `tipo_factura` (`idTipo_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pedidos_ibfk_5` FOREIGN KEY (`idModalidad_Factura`) REFERENCES `modalidad_factura` (`idModalidad_Factura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `remitos`
--
ALTER TABLE `remitos`
  ADD CONSTRAINT `remitos_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`idMesa`) REFERENCES `mesa` (`idMesa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
