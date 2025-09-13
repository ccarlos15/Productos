-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-09-2025 a las 17:15:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `productos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Id_clientes` int(11) NOT NULL,
  `Nombre_completo` varchar(255) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `Id_cuenta` int(11) NOT NULL,
  `Id_cliente` int(11) DEFAULT NULL,
  `Id_tipo_cuenta` int(11) DEFAULT NULL,
  `Numero_cuenta` varchar(50) DEFAULT NULL,
  `Saldo` decimal(10,2) DEFAULT NULL,
  `Fecha_apertura` date DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_productos`
--

CREATE TABLE `cuenta_productos` (
  `Id_cuenta_productos` int(11) NOT NULL,
  `Id_cuenta` int(11) DEFAULT NULL,
  `Id_producto` int(11) DEFAULT NULL,
  `Fecha_contrato` date DEFAULT NULL,
  `Estado_producto` varchar(20) DEFAULT NULL,
  `Fecha_vencimiento` date DEFAULT NULL,
  `Valor_contrato` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inversiones_contrato`
--

CREATE TABLE `inversiones_contrato` (
  `Id_cuenta_productos` int(11) NOT NULL,
  `Monto_invertido` decimal(10,2) DEFAULT NULL,
  `Rendimiento_actual` decimal(5,2) DEFAULT NULL,
  `Fecha_vencimiento` date DEFAULT NULL,
  `Reinversion_automatica` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos_contrato`
--

CREATE TABLE `prestamos_contrato` (
  `Id_cuenta_productos` int(11) NOT NULL,
  `Monto_prestado` decimal(10,2) DEFAULT NULL,
  `Cuentas_pagadas` int(11) DEFAULT NULL,
  `Saldo_pendiente` decimal(10,2) DEFAULT NULL,
  `Fecha_primer_pago` date DEFAULT NULL,
  `Estado_prestamo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_producto` int(11) NOT NULL,
  `Id_tipo_producto` int(11) DEFAULT NULL,
  `Nombre_producto` varchar(255) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  `Fecha_creacion` date DEFAULT NULL,
  `Ultima_actualizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_inversion`
--

CREATE TABLE `productos_inversion` (
  `Id_producto` int(11) NOT NULL,
  `Tipo_prestamo` varchar(255) DEFAULT NULL,
  `Riesgo_financiero` varchar(50) DEFAULT NULL,
  `Rend_estimado` decimal(5,2) DEFAULT NULL,
  `Plazo_minimo` int(11) DEFAULT NULL,
  `Inversion_minima` decimal(10,2) DEFAULT NULL,
  `Comision` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_prestamo`
--

CREATE TABLE `productos_prestamo` (
  `Id_producto` int(11) NOT NULL,
  `Tipo_prestamo` varchar(255) DEFAULT NULL,
  `Tasa_interes` decimal(5,2) DEFAULT NULL,
  `Plazo_minimo` int(11) DEFAULT NULL,
  `Plazo_maximo` int(11) DEFAULT NULL,
  `Monto_minimo` decimal(10,2) DEFAULT NULL,
  `Monto_maximo` decimal(10,2) DEFAULT NULL,
  `Req_garantia` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_seguros`
--

CREATE TABLE `productos_seguros` (
  `Id_producto` int(11) NOT NULL,
  `Tipo_seguro` varchar(255) DEFAULT NULL,
  `Cobertura` varchar(255) DEFAULT NULL,
  `Prima_mensual` decimal(10,2) DEFAULT NULL,
  `Suma_asegurada` decimal(10,2) DEFAULT NULL,
  `Edad_minima` int(11) DEFAULT NULL,
  `Edad_maxima` int(11) DEFAULT NULL,
  `Vigencia_poliza` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_servicio`
--

CREATE TABLE `productos_servicio` (
  `Id_producto` int(11) NOT NULL,
  `Tipo_servicio` varchar(255) DEFAULT NULL,
  `Costo_servicio` decimal(10,2) DEFAULT NULL,
  `Disponibilidad` varchar(50) DEFAULT NULL,
  `Tiempo_proceso` int(11) DEFAULT NULL,
  `Req_autorizacion` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguros_contrato`
--

CREATE TABLE `seguros_contrato` (
  `Id_cuenta_productos` int(11) NOT NULL,
  `Numero_poliza` varchar(50) DEFAULT NULL,
  `Beneficiarios` text DEFAULT NULL,
  `Prima_pagada` decimal(10,2) DEFAULT NULL,
  `Ultimo_pago` date DEFAULT NULL,
  `Estado_prima` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_contrato`
--

CREATE TABLE `servicios_contrato` (
  `Id_cuenta_productos` int(11) NOT NULL,
  `Fecha_ultimo_uso` date DEFAULT NULL,
  `Transaccion_mes` int(11) DEFAULT NULL,
  `Limite_transaccion` decimal(10,2) DEFAULT NULL,
  `Costo_acumulado` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_cuenta`
--

CREATE TABLE `tipos_cuenta` (
  `Id_tipo_cuenta` int(11) NOT NULL,
  `Nombre_tipo` varchar(255) DEFAULT NULL,
  `Monto_minimo` decimal(10,2) DEFAULT NULL,
  `Permite_cheque` tinyint(1) DEFAULT NULL,
  `Tasa_interes` decimal(5,2) DEFAULT NULL,
  `Estado_activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_producto`
--

CREATE TABLE `tipos_producto` (
  `Id_tipo_producto` int(11) NOT NULL,
  `Nombre_tipo` varchar(255) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Estado_activo` tinyint(1) DEFAULT NULL,
  `Categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id_clientes`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`Id_cuenta`),
  ADD KEY `Id_cliente` (`Id_cliente`),
  ADD KEY `Id_tipo_cuenta` (`Id_tipo_cuenta`);

--
-- Indices de la tabla `cuenta_productos`
--
ALTER TABLE `cuenta_productos`
  ADD PRIMARY KEY (`Id_cuenta_productos`),
  ADD KEY `Id_cuenta` (`Id_cuenta`),
  ADD KEY `Id_producto` (`Id_producto`);

--
-- Indices de la tabla `inversiones_contrato`
--
ALTER TABLE `inversiones_contrato`
  ADD PRIMARY KEY (`Id_cuenta_productos`);

--
-- Indices de la tabla `prestamos_contrato`
--
ALTER TABLE `prestamos_contrato`
  ADD PRIMARY KEY (`Id_cuenta_productos`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_producto`),
  ADD KEY `Id_tipo_producto` (`Id_tipo_producto`);

--
-- Indices de la tabla `productos_inversion`
--
ALTER TABLE `productos_inversion`
  ADD PRIMARY KEY (`Id_producto`);

--
-- Indices de la tabla `productos_prestamo`
--
ALTER TABLE `productos_prestamo`
  ADD PRIMARY KEY (`Id_producto`);

--
-- Indices de la tabla `productos_seguros`
--
ALTER TABLE `productos_seguros`
  ADD PRIMARY KEY (`Id_producto`);

--
-- Indices de la tabla `productos_servicio`
--
ALTER TABLE `productos_servicio`
  ADD PRIMARY KEY (`Id_producto`);

--
-- Indices de la tabla `seguros_contrato`
--
ALTER TABLE `seguros_contrato`
  ADD PRIMARY KEY (`Id_cuenta_productos`);

--
-- Indices de la tabla `servicios_contrato`
--
ALTER TABLE `servicios_contrato`
  ADD PRIMARY KEY (`Id_cuenta_productos`);

--
-- Indices de la tabla `tipos_cuenta`
--
ALTER TABLE `tipos_cuenta`
  ADD PRIMARY KEY (`Id_tipo_cuenta`);

--
-- Indices de la tabla `tipos_producto`
--
ALTER TABLE `tipos_producto`
  ADD PRIMARY KEY (`Id_tipo_producto`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`Id_cliente`) REFERENCES `clientes` (`Id_clientes`),
  ADD CONSTRAINT `cuentas_ibfk_2` FOREIGN KEY (`Id_tipo_cuenta`) REFERENCES `tipos_cuenta` (`Id_tipo_cuenta`);

--
-- Filtros para la tabla `cuenta_productos`
--
ALTER TABLE `cuenta_productos`
  ADD CONSTRAINT `cuenta_productos_ibfk_1` FOREIGN KEY (`Id_cuenta`) REFERENCES `cuentas` (`Id_cuenta`),
  ADD CONSTRAINT `cuenta_productos_ibfk_2` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`);

--
-- Filtros para la tabla `inversiones_contrato`
--
ALTER TABLE `inversiones_contrato`
  ADD CONSTRAINT `inversiones_contrato_ibfk_1` FOREIGN KEY (`Id_cuenta_productos`) REFERENCES `cuenta_productos` (`Id_cuenta_productos`);

--
-- Filtros para la tabla `prestamos_contrato`
--
ALTER TABLE `prestamos_contrato`
  ADD CONSTRAINT `prestamos_contrato_ibfk_1` FOREIGN KEY (`Id_cuenta_productos`) REFERENCES `cuenta_productos` (`Id_cuenta_productos`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Id_tipo_producto`) REFERENCES `tipos_producto` (`Id_tipo_producto`);

--
-- Filtros para la tabla `productos_inversion`
--
ALTER TABLE `productos_inversion`
  ADD CONSTRAINT `productos_inversion_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`);

--
-- Filtros para la tabla `productos_prestamo`
--
ALTER TABLE `productos_prestamo`
  ADD CONSTRAINT `productos_prestamo_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`);

--
-- Filtros para la tabla `productos_seguros`
--
ALTER TABLE `productos_seguros`
  ADD CONSTRAINT `productos_seguros_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`);

--
-- Filtros para la tabla `productos_servicio`
--
ALTER TABLE `productos_servicio`
  ADD CONSTRAINT `productos_servicio_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`);

--
-- Filtros para la tabla `seguros_contrato`
--
ALTER TABLE `seguros_contrato`
  ADD CONSTRAINT `seguros_contrato_ibfk_1` FOREIGN KEY (`Id_cuenta_productos`) REFERENCES `cuenta_productos` (`Id_cuenta_productos`);

--
-- Filtros para la tabla `servicios_contrato`
--
ALTER TABLE `servicios_contrato`
  ADD CONSTRAINT `servicios_contrato_ibfk_1` FOREIGN KEY (`Id_cuenta_productos`) REFERENCES `cuenta_productos` (`Id_cuenta_productos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
