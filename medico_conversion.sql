-- phpMyAdmin SQL Dump
-- version 4.4.13.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 23-03-2016 a las 18:16:29
-- Versión del servidor: 5.6.28-0ubuntu0.15.10.1
-- Versión de PHP: 5.6.11-1ubuntu3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `medico_conversion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ANALISIS_CLINICO`
--

CREATE TABLE IF NOT EXISTS `ANALISIS_CLINICO` (
  `id_analisis` int(11) NOT NULL,
  `nombre_analisis` text,
  `sinonimo` text,
  `preparacion` text,
  `patologia` text,
  `tiempo_entrega` datetime DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `id_analisis_tipo_fk` int(11) DEFAULT NULL,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ANALISIS_TIPO`
--

CREATE TABLE IF NOT EXISTS `ANALISIS_TIPO` (
  `id_analisis_tipo` int(11) NOT NULL,
  `nombre_analisis_tipo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CATALOGO_SISTEMA`
--

CREATE TABLE IF NOT EXISTS `CATALOGO_SISTEMA` (
  `id_sistema` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CATALOGO_SISTEMA_SUBSECCION`
--

CREATE TABLE IF NOT EXISTS `CATALOGO_SISTEMA_SUBSECCION` (
  `id_sistema_subseccion` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `id_sistema_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CONSULTAS_INTERROGATORIO`
--

CREATE TABLE IF NOT EXISTS `CONSULTAS_INTERROGATORIO` (
  `id_interrogatorio` int(11) NOT NULL,
  `descripcion` text,
  `id_consulta_descripcion_fk` int(11) DEFAULT NULL,
  `id_sistema_subseccion_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CONSULTA_DESCRIPCION`
--

CREATE TABLE IF NOT EXISTS `CONSULTA_DESCRIPCION` (
  `id_consulta_descripcion` int(11) NOT NULL,
  `descripcion` text,
  `fecha` datetime DEFAULT NULL,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CONSULTA_PADECIMIENTO`
--

CREATE TABLE IF NOT EXISTS `CONSULTA_PADECIMIENTO` (
  `id_consulta_padecimiento` int(11) NOT NULL,
  `padecimiento` text,
  `medicamento` text,
  `fecha` datetime DEFAULT NULL,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DIAGNOSTICO`
--

CREATE TABLE IF NOT EXISTS `DIAGNOSTICO` (
  `id_diagnostico` int(11) NOT NULL,
  `diagnostico` text,
  `id_consulta_descripcion_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ENFERMEDAD`
--

CREATE TABLE IF NOT EXISTS `ENFERMEDAD` (
  `id_enfermedad` int(11) NOT NULL,
  `codigo_enfermedad_tipo` varchar(5) DEFAULT NULL,
  `nombre` text,
  `id_enfermedad_tipo_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ENFERMEDAD_TIPO`
--

CREATE TABLE IF NOT EXISTS `ENFERMEDAD_TIPO` (
  `id_enfermedad_tipo` int(11) NOT NULL,
  `codigo_enfermedad_tipo` varchar(5) DEFAULT NULL,
  `nombre_enfermedad_tipo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EXPEDIENTE_PACIENTE`
--

CREATE TABLE IF NOT EXISTS `EXPEDIENTE_PACIENTE` (
  `id_paciente` int(11) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `apellido_paterno` char(30) DEFAULT NULL,
  `apellido_materno` char(30) DEFAULT NULL,
  `nombre` char(30) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `curp` varchar(18) DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `edad` int(2) DEFAULT NULL,
  `estatura` float DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `sexo` char(2) DEFAULT NULL,
  `ocupacion` char(30) DEFAULT NULL,
  `estado_civil` char(15) DEFAULT NULL,
  `telefono_particular` int(10) DEFAULT NULL,
  `telefono_oficina` int(10) DEFAULT NULL,
  `celular` int(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `calle_y_numero` varchar(50) DEFAULT NULL,
  `colonia` varchar(30) DEFAULT NULL,
  `ciudad` char(30) DEFAULT NULL,
  `estado` char(30) DEFAULT NULL,
  `cp` int(5) DEFAULT NULL,
  `pais` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EXPLORACION`
--

CREATE TABLE IF NOT EXISTS `EXPLORACION` (
  `id_exploracion` int(11) NOT NULL,
  `temperatura` float(2,2) DEFAULT NULL,
  `pulso` int(3) DEFAULT NULL,
  `tension_arterial` int(3) DEFAULT NULL,
  `frec_cardiaca` int(3) DEFAULT NULL,
  `frec_respiratoria` int(2) DEFAULT NULL,
  `estatura` float(2,2) DEFAULT NULL,
  `kg_grasa` float(2,2) DEFAULT NULL,
  `porcentaje_magra` float(2,2) DEFAULT NULL,
  `kilogramos_magra` float(2,2) DEFAULT NULL,
  `porcentaje_agua` float(2,2) DEFAULT NULL,
  `kilogramos_agua` float(2,2) DEFAULT NULL,
  `id_consulta_descripcion_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_HEREDOFAMILIARES`
--

CREATE TABLE IF NOT EXISTS `FICHA_HEREDOFAMILIARES` (
  `id_heredofamiliar` int(11) NOT NULL,
  `enfermedad_padre` text,
  `enfermedad_madre` text,
  `enfermedad_abuelos_paternos` text,
  `enfermedad_abuelos_maternos` text,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_NOPATOLOGICO_ALERGIA`
--

CREATE TABLE IF NOT EXISTS `FICHA_NOPATOLOGICO_ALERGIA` (
  `id_nopatologico_alergia` int(11) NOT NULL,
  `alimento` text,
  `medio_ambiente` text,
  `otros` text,
  `id_paciente_fk` int(11) DEFAULT NULL,
  `id_medicamento_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_NOPATOLOGICO_CATALOGOSANGRE`
--

CREATE TABLE IF NOT EXISTS `FICHA_NOPATOLOGICO_CATALOGOSANGRE` (
  `id_tipo_sangre` int(11) NOT NULL,
  `tipo_sangre` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_NOPATOLOGICO_GRUPOSANGUINEO`
--

CREATE TABLE IF NOT EXISTS `FICHA_NOPATOLOGICO_GRUPOSANGUINEO` (
  `id_grupo_sanguineo` int(11) NOT NULL,
  `actividad_deportiva` varchar(3) DEFAULT NULL,
  `viajes` text,
  `id_paciente_fk` int(11) DEFAULT NULL,
  `id_tipo_sangre_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_NOPATOLOGICO_GRUPO_OTROS`
--

CREATE TABLE IF NOT EXISTS `FICHA_NOPATOLOGICO_GRUPO_OTROS` (
  `id_nopatologico_grupo_otros` int(11) NOT NULL,
  `descripcion` text,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_PATOLOGICO_CATALOGO_INMUNIZACIONES`
--

CREATE TABLE IF NOT EXISTS `FICHA_PATOLOGICO_CATALOGO_INMUNIZACIONES` (
  `id_catalogo_inmunizacion` int(11) NOT NULL,
  `inmunizaciones` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_PATOLOGICO_CATALOGO_PADECIMIENTOS`
--

CREATE TABLE IF NOT EXISTS `FICHA_PATOLOGICO_CATALOGO_PADECIMIENTOS` (
  `id_catalogo_padecimiento` int(11) NOT NULL,
  `padecimiento` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_PATOLOGICO_HOSPITALIZACION`
--

CREATE TABLE IF NOT EXISTS `FICHA_PATOLOGICO_HOSPITALIZACION` (
  `id_hospitalizacion` int(11) NOT NULL,
  `descripcion` text,
  `fecha` datetime DEFAULT NULL,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_PATOLOGICO_INMUNIZACIONES`
--

CREATE TABLE IF NOT EXISTS `FICHA_PATOLOGICO_INMUNIZACIONES` (
  `id_patologico_inmunizacion` int(11) NOT NULL,
  `id_catalogo_inmunizacion_fk` int(11) DEFAULT NULL,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_PATOLOGICO_PADECIMIENTO`
--

CREATE TABLE IF NOT EXISTS `FICHA_PATOLOGICO_PADECIMIENTO` (
  `id_patologico` int(11) NOT NULL,
  `id_catalogo_padecimiento_fk` int(11) DEFAULT NULL,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_PATOLOGICO_PADECIMIENTO_CATALOGO_HABITO`
--

CREATE TABLE IF NOT EXISTS `FICHA_PATOLOGICO_PADECIMIENTO_CATALOGO_HABITO` (
  `id_catalogo_habito` int(11) NOT NULL,
  `habito` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_PATOLOGICO_PADECIMIENTO_HABITO`
--

CREATE TABLE IF NOT EXISTS `FICHA_PATOLOGICO_PADECIMIENTO_HABITO` (
  `id_habito` int(11) NOT NULL,
  `id_catalogo_habito_fk` int(11) DEFAULT NULL,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_PATOLOGICO_QUIRURGICO`
--

CREATE TABLE IF NOT EXISTS `FICHA_PATOLOGICO_QUIRURGICO` (
  `id_quirurgico` int(11) NOT NULL,
  `descripcion` text,
  `fecha` datetime DEFAULT NULL,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_PATOLOGICO_QUIRURGICO_OBSERVACIONES`
--

CREATE TABLE IF NOT EXISTS `FICHA_PATOLOGICO_QUIRURGICO_OBSERVACIONES` (
  `id_observacion` int(11) NOT NULL,
  `observacion` text,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FICHA_PATOLOGICO_TRAUMA`
--

CREATE TABLE IF NOT EXISTS `FICHA_PATOLOGICO_TRAUMA` (
  `id_trauma` int(11) NOT NULL,
  `descripcion` text,
  `fecha` datetime DEFAULT NULL,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LABORATORIO`
--

CREATE TABLE IF NOT EXISTS `LABORATORIO` (
  `id_laboratorio` int(11) NOT NULL,
  `id_consulta_descripcion_fk` int(11) DEFAULT NULL,
  `id_analisis_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MEDICAMENTO`
--

CREATE TABLE IF NOT EXISTS `MEDICAMENTO` (
  `id_medicamento` int(11) NOT NULL,
  `nombre_medicamento` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MULTIMEDIA`
--

CREATE TABLE IF NOT EXISTS `MULTIMEDIA` (
  `fecha_ingreso` datetime DEFAULT NULL,
  `titulo` char(50) DEFAULT NULL,
  `descripcion` text,
  `imagen` varchar(100) DEFAULT NULL,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `NOTAS`
--

CREATE TABLE IF NOT EXISTS `NOTAS` (
  `id_nota` int(11) NOT NULL,
  `nota` text,
  `observacion` text,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `NOTA_EVOLUTIVA`
--

CREATE TABLE IF NOT EXISTS `NOTA_EVOLUTIVA` (
  `id_nota_evolutiva` int(11) NOT NULL,
  `descripcion` text,
  `valor1` int(3) DEFAULT NULL,
  `valor2` int(3) DEFAULT NULL,
  `valor3` int(3) DEFAULT NULL,
  `valor4` int(3) DEFAULT NULL,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `NOTA_INTERCONSULTA`
--

CREATE TABLE IF NOT EXISTS `NOTA_INTERCONSULTA` (
  `id_nota_interconsulta` int(11) NOT NULL,
  `criterio_diagnostico` text,
  `plan_estudios` text,
  `sugerencia_diagnostico` text,
  `sugerencia_tratamiento` text,
  `id_consulta_descripcion_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PACIENTE_GINECO`
--

CREATE TABLE IF NOT EXISTS `PACIENTE_GINECO` (
  `id_gineco` int(11) NOT NULL,
  `menarquia` datetime DEFAULT NULL,
  `ciclo_menstrual` int(2) DEFAULT NULL,
  `flujo_menstrual` char(10) DEFAULT NULL,
  `actividad_sexual` char(2) DEFAULT NULL,
  `fecha_primera_relacion` datetime DEFAULT NULL,
  `no_compañeros` int(1) DEFAULT NULL,
  `gestas` int(1) DEFAULT NULL,
  `abortos` int(1) DEFAULT NULL,
  `fecha_1er_embarazo` datetime DEFAULT NULL,
  `fecha_ultimo_embarazo` datetime DEFAULT NULL,
  `partos` int(1) DEFAULT NULL,
  `prematuros` int(1) DEFAULT NULL,
  `euticos` int(1) DEFAULT NULL,
  `distocicos` int(1) DEFAULT NULL,
  `vaginales` int(1) DEFAULT NULL,
  `abdominales` int(1) DEFAULT NULL,
  `postermino` int(1) DEFAULT NULL,
  `complicaciones` text,
  `cauterizaciones` text,
  `menospaucia` text,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RECETA`
--

CREATE TABLE IF NOT EXISTS `RECETA` (
  `id_receta` int(11) NOT NULL,
  `presentacion` text,
  `cantidad` int(2) DEFAULT NULL,
  `medida` text,
  `repeticion` text,
  `duracion` text,
  `id_medicamento_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RECETA_TRATAMIENTO`
--

CREATE TABLE IF NOT EXISTS `RECETA_TRATAMIENTO` (
  `receta_tratamiento` text,
  `id_tratamiento_fk` int(11) DEFAULT NULL,
  `id_receta_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SEGURO_MEDICO`
--

CREATE TABLE IF NOT EXISTS `SEGURO_MEDICO` (
  `id_seguro_medico` int(11) NOT NULL,
  `institucion_aseguradora` text,
  `numero_seguro` int(15) DEFAULT NULL,
  `nombre` char(30) DEFAULT NULL,
  `fecha_expedicion` datetime DEFAULT NULL,
  `fecha_expiracion` datetime DEFAULT NULL,
  `nombre_familiar1` char(50) DEFAULT NULL,
  `nombre_familiar2` char(50) DEFAULT NULL,
  `telefono1` int(10) DEFAULT NULL,
  `telefono2` int(10) DEFAULT NULL,
  `informacion_adicional` text,
  `id_paciente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TERAPEUTICA`
--

CREATE TABLE IF NOT EXISTS `TERAPEUTICA` (
  `id_terapeutica` int(11) NOT NULL,
  `plan` text,
  `control` text,
  `id_tratamiento_fk` int(11) DEFAULT NULL,
  `id_consulta_descripcion_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TRASLADO`
--

CREATE TABLE IF NOT EXISTS `TRASLADO` (
  `id_traslado` int(11) NOT NULL,
  `envia` varchar(30) DEFAULT NULL,
  `recibe` varchar(30) DEFAULT NULL,
  `motivo` varchar(30) DEFAULT NULL,
  `impresion_diagnostica` text,
  `terapeutica_empleada` text,
  `id_consulta_descripcion_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TRATAMIENTO`
--

CREATE TABLE IF NOT EXISTS `TRATAMIENTO` (
  `id_tratamiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ANALISIS_CLINICO`
--
ALTER TABLE `ANALISIS_CLINICO`
  ADD PRIMARY KEY (`id_analisis`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`),
  ADD KEY `id_analisis_tipo_fk` (`id_analisis_tipo_fk`);

--
-- Indices de la tabla `ANALISIS_TIPO`
--
ALTER TABLE `ANALISIS_TIPO`
  ADD PRIMARY KEY (`id_analisis_tipo`);

--
-- Indices de la tabla `CATALOGO_SISTEMA`
--
ALTER TABLE `CATALOGO_SISTEMA`
  ADD PRIMARY KEY (`id_sistema`);

--
-- Indices de la tabla `CATALOGO_SISTEMA_SUBSECCION`
--
ALTER TABLE `CATALOGO_SISTEMA_SUBSECCION`
  ADD PRIMARY KEY (`id_sistema_subseccion`),
  ADD KEY `id_sistema_fk` (`id_sistema_fk`);

--
-- Indices de la tabla `CONSULTAS_INTERROGATORIO`
--
ALTER TABLE `CONSULTAS_INTERROGATORIO`
  ADD PRIMARY KEY (`id_interrogatorio`),
  ADD KEY `id_consulta_descripcion_fk` (`id_consulta_descripcion_fk`),
  ADD KEY `id_sistema_subseccion_fk` (`id_sistema_subseccion_fk`);

--
-- Indices de la tabla `CONSULTA_DESCRIPCION`
--
ALTER TABLE `CONSULTA_DESCRIPCION`
  ADD PRIMARY KEY (`id_consulta_descripcion`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`);

--
-- Indices de la tabla `CONSULTA_PADECIMIENTO`
--
ALTER TABLE `CONSULTA_PADECIMIENTO`
  ADD PRIMARY KEY (`id_consulta_padecimiento`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`);

--
-- Indices de la tabla `DIAGNOSTICO`
--
ALTER TABLE `DIAGNOSTICO`
  ADD PRIMARY KEY (`id_diagnostico`),
  ADD KEY `id_consulta_descripcion_fk` (`id_consulta_descripcion_fk`);

--
-- Indices de la tabla `ENFERMEDAD`
--
ALTER TABLE `ENFERMEDAD`
  ADD PRIMARY KEY (`id_enfermedad`),
  ADD KEY `id_enfermedad_tipo_fk` (`id_enfermedad_tipo_fk`);

--
-- Indices de la tabla `ENFERMEDAD_TIPO`
--
ALTER TABLE `ENFERMEDAD_TIPO`
  ADD PRIMARY KEY (`id_enfermedad_tipo`);

--
-- Indices de la tabla `EXPEDIENTE_PACIENTE`
--
ALTER TABLE `EXPEDIENTE_PACIENTE`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indices de la tabla `EXPLORACION`
--
ALTER TABLE `EXPLORACION`
  ADD PRIMARY KEY (`id_exploracion`),
  ADD KEY `id_consulta_descripcion_fk` (`id_consulta_descripcion_fk`);

--
-- Indices de la tabla `FICHA_HEREDOFAMILIARES`
--
ALTER TABLE `FICHA_HEREDOFAMILIARES`
  ADD PRIMARY KEY (`id_heredofamiliar`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`);

--
-- Indices de la tabla `FICHA_NOPATOLOGICO_ALERGIA`
--
ALTER TABLE `FICHA_NOPATOLOGICO_ALERGIA`
  ADD PRIMARY KEY (`id_nopatologico_alergia`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`),
  ADD KEY `id_medicamento_fk` (`id_medicamento_fk`);

--
-- Indices de la tabla `FICHA_NOPATOLOGICO_CATALOGOSANGRE`
--
ALTER TABLE `FICHA_NOPATOLOGICO_CATALOGOSANGRE`
  ADD PRIMARY KEY (`id_tipo_sangre`);

--
-- Indices de la tabla `FICHA_NOPATOLOGICO_GRUPOSANGUINEO`
--
ALTER TABLE `FICHA_NOPATOLOGICO_GRUPOSANGUINEO`
  ADD PRIMARY KEY (`id_grupo_sanguineo`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`),
  ADD KEY `id_tipo_sangre_fk` (`id_tipo_sangre_fk`);

--
-- Indices de la tabla `FICHA_NOPATOLOGICO_GRUPO_OTROS`
--
ALTER TABLE `FICHA_NOPATOLOGICO_GRUPO_OTROS`
  ADD PRIMARY KEY (`id_nopatologico_grupo_otros`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`);

--
-- Indices de la tabla `FICHA_PATOLOGICO_CATALOGO_INMUNIZACIONES`
--
ALTER TABLE `FICHA_PATOLOGICO_CATALOGO_INMUNIZACIONES`
  ADD PRIMARY KEY (`id_catalogo_inmunizacion`);

--
-- Indices de la tabla `FICHA_PATOLOGICO_CATALOGO_PADECIMIENTOS`
--
ALTER TABLE `FICHA_PATOLOGICO_CATALOGO_PADECIMIENTOS`
  ADD PRIMARY KEY (`id_catalogo_padecimiento`);

--
-- Indices de la tabla `FICHA_PATOLOGICO_HOSPITALIZACION`
--
ALTER TABLE `FICHA_PATOLOGICO_HOSPITALIZACION`
  ADD PRIMARY KEY (`id_hospitalizacion`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`);

--
-- Indices de la tabla `FICHA_PATOLOGICO_INMUNIZACIONES`
--
ALTER TABLE `FICHA_PATOLOGICO_INMUNIZACIONES`
  ADD PRIMARY KEY (`id_patologico_inmunizacion`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`),
  ADD KEY `id_catalogo_inmunizacion_fk` (`id_catalogo_inmunizacion_fk`);

--
-- Indices de la tabla `FICHA_PATOLOGICO_PADECIMIENTO`
--
ALTER TABLE `FICHA_PATOLOGICO_PADECIMIENTO`
  ADD PRIMARY KEY (`id_patologico`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`),
  ADD KEY `id_catalogo_padecimiento_fk` (`id_catalogo_padecimiento_fk`);

--
-- Indices de la tabla `FICHA_PATOLOGICO_PADECIMIENTO_CATALOGO_HABITO`
--
ALTER TABLE `FICHA_PATOLOGICO_PADECIMIENTO_CATALOGO_HABITO`
  ADD PRIMARY KEY (`id_catalogo_habito`);

--
-- Indices de la tabla `FICHA_PATOLOGICO_PADECIMIENTO_HABITO`
--
ALTER TABLE `FICHA_PATOLOGICO_PADECIMIENTO_HABITO`
  ADD PRIMARY KEY (`id_habito`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`),
  ADD KEY `id_catalogo_habito_fk` (`id_catalogo_habito_fk`);

--
-- Indices de la tabla `FICHA_PATOLOGICO_QUIRURGICO`
--
ALTER TABLE `FICHA_PATOLOGICO_QUIRURGICO`
  ADD PRIMARY KEY (`id_quirurgico`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`);

--
-- Indices de la tabla `FICHA_PATOLOGICO_QUIRURGICO_OBSERVACIONES`
--
ALTER TABLE `FICHA_PATOLOGICO_QUIRURGICO_OBSERVACIONES`
  ADD PRIMARY KEY (`id_observacion`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`);

--
-- Indices de la tabla `FICHA_PATOLOGICO_TRAUMA`
--
ALTER TABLE `FICHA_PATOLOGICO_TRAUMA`
  ADD PRIMARY KEY (`id_trauma`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`);

--
-- Indices de la tabla `LABORATORIO`
--
ALTER TABLE `LABORATORIO`
  ADD PRIMARY KEY (`id_laboratorio`),
  ADD KEY `id_consulta_descripcion_fk` (`id_consulta_descripcion_fk`),
  ADD KEY `id_analisis_fk` (`id_analisis_fk`);

--
-- Indices de la tabla `MEDICAMENTO`
--
ALTER TABLE `MEDICAMENTO`
  ADD PRIMARY KEY (`id_medicamento`);

--
-- Indices de la tabla `MULTIMEDIA`
--
ALTER TABLE `MULTIMEDIA`
  ADD KEY `id_paciente_fk` (`id_paciente_fk`);

--
-- Indices de la tabla `NOTAS`
--
ALTER TABLE `NOTAS`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`);

--
-- Indices de la tabla `NOTA_EVOLUTIVA`
--
ALTER TABLE `NOTA_EVOLUTIVA`
  ADD PRIMARY KEY (`id_nota_evolutiva`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`);

--
-- Indices de la tabla `NOTA_INTERCONSULTA`
--
ALTER TABLE `NOTA_INTERCONSULTA`
  ADD PRIMARY KEY (`id_nota_interconsulta`),
  ADD KEY `id_consulta_descripcion_fk` (`id_consulta_descripcion_fk`);

--
-- Indices de la tabla `PACIENTE_GINECO`
--
ALTER TABLE `PACIENTE_GINECO`
  ADD PRIMARY KEY (`id_gineco`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`);

--
-- Indices de la tabla `RECETA`
--
ALTER TABLE `RECETA`
  ADD PRIMARY KEY (`id_receta`),
  ADD KEY `id_medicamento_fk` (`id_medicamento_fk`);

--
-- Indices de la tabla `RECETA_TRATAMIENTO`
--
ALTER TABLE `RECETA_TRATAMIENTO`
  ADD KEY `id_tratamiento_fk` (`id_tratamiento_fk`),
  ADD KEY `id_receta_fk` (`id_receta_fk`);

--
-- Indices de la tabla `SEGURO_MEDICO`
--
ALTER TABLE `SEGURO_MEDICO`
  ADD PRIMARY KEY (`id_seguro_medico`),
  ADD KEY `id_paciente_fk` (`id_paciente_fk`);

--
-- Indices de la tabla `TERAPEUTICA`
--
ALTER TABLE `TERAPEUTICA`
  ADD PRIMARY KEY (`id_terapeutica`),
  ADD KEY `id_tratamiento_fk` (`id_tratamiento_fk`),
  ADD KEY `id_consulta_descripcion_fk` (`id_consulta_descripcion_fk`);

--
-- Indices de la tabla `TRASLADO`
--
ALTER TABLE `TRASLADO`
  ADD PRIMARY KEY (`id_traslado`),
  ADD KEY `id_consulta_descripcion_fk` (`id_consulta_descripcion_fk`);

--
-- Indices de la tabla `TRATAMIENTO`
--
ALTER TABLE `TRATAMIENTO`
  ADD PRIMARY KEY (`id_tratamiento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ANALISIS_CLINICO`
--
ALTER TABLE `ANALISIS_CLINICO`
  MODIFY `id_analisis` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ANALISIS_TIPO`
--
ALTER TABLE `ANALISIS_TIPO`
  MODIFY `id_analisis_tipo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `CATALOGO_SISTEMA`
--
ALTER TABLE `CATALOGO_SISTEMA`
  MODIFY `id_sistema` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `CATALOGO_SISTEMA_SUBSECCION`
--
ALTER TABLE `CATALOGO_SISTEMA_SUBSECCION`
  MODIFY `id_sistema_subseccion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `CONSULTAS_INTERROGATORIO`
--
ALTER TABLE `CONSULTAS_INTERROGATORIO`
  MODIFY `id_interrogatorio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `CONSULTA_DESCRIPCION`
--
ALTER TABLE `CONSULTA_DESCRIPCION`
  MODIFY `id_consulta_descripcion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `CONSULTA_PADECIMIENTO`
--
ALTER TABLE `CONSULTA_PADECIMIENTO`
  MODIFY `id_consulta_padecimiento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `DIAGNOSTICO`
--
ALTER TABLE `DIAGNOSTICO`
  MODIFY `id_diagnostico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ENFERMEDAD`
--
ALTER TABLE `ENFERMEDAD`
  MODIFY `id_enfermedad` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ENFERMEDAD_TIPO`
--
ALTER TABLE `ENFERMEDAD_TIPO`
  MODIFY `id_enfermedad_tipo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `EXPEDIENTE_PACIENTE`
--
ALTER TABLE `EXPEDIENTE_PACIENTE`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `EXPLORACION`
--
ALTER TABLE `EXPLORACION`
  MODIFY `id_exploracion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `FICHA_HEREDOFAMILIARES`
--
ALTER TABLE `FICHA_HEREDOFAMILIARES`
  MODIFY `id_heredofamiliar` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `FICHA_NOPATOLOGICO_ALERGIA`
--
ALTER TABLE `FICHA_NOPATOLOGICO_ALERGIA`
  MODIFY `id_nopatologico_alergia` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `FICHA_NOPATOLOGICO_GRUPO_OTROS`
--
ALTER TABLE `FICHA_NOPATOLOGICO_GRUPO_OTROS`
  MODIFY `id_nopatologico_grupo_otros` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `FICHA_PATOLOGICO_CATALOGO_INMUNIZACIONES`
--
ALTER TABLE `FICHA_PATOLOGICO_CATALOGO_INMUNIZACIONES`
  MODIFY `id_catalogo_inmunizacion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `FICHA_PATOLOGICO_CATALOGO_PADECIMIENTOS`
--
ALTER TABLE `FICHA_PATOLOGICO_CATALOGO_PADECIMIENTOS`
  MODIFY `id_catalogo_padecimiento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `FICHA_PATOLOGICO_HOSPITALIZACION`
--
ALTER TABLE `FICHA_PATOLOGICO_HOSPITALIZACION`
  MODIFY `id_hospitalizacion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `FICHA_PATOLOGICO_INMUNIZACIONES`
--
ALTER TABLE `FICHA_PATOLOGICO_INMUNIZACIONES`
  MODIFY `id_patologico_inmunizacion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `FICHA_PATOLOGICO_PADECIMIENTO`
--
ALTER TABLE `FICHA_PATOLOGICO_PADECIMIENTO`
  MODIFY `id_patologico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `FICHA_PATOLOGICO_PADECIMIENTO_CATALOGO_HABITO`
--
ALTER TABLE `FICHA_PATOLOGICO_PADECIMIENTO_CATALOGO_HABITO`
  MODIFY `id_catalogo_habito` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `FICHA_PATOLOGICO_PADECIMIENTO_HABITO`
--
ALTER TABLE `FICHA_PATOLOGICO_PADECIMIENTO_HABITO`
  MODIFY `id_habito` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `FICHA_PATOLOGICO_QUIRURGICO`
--
ALTER TABLE `FICHA_PATOLOGICO_QUIRURGICO`
  MODIFY `id_quirurgico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `FICHA_PATOLOGICO_QUIRURGICO_OBSERVACIONES`
--
ALTER TABLE `FICHA_PATOLOGICO_QUIRURGICO_OBSERVACIONES`
  MODIFY `id_observacion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `FICHA_PATOLOGICO_TRAUMA`
--
ALTER TABLE `FICHA_PATOLOGICO_TRAUMA`
  MODIFY `id_trauma` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `LABORATORIO`
--
ALTER TABLE `LABORATORIO`
  MODIFY `id_laboratorio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `MEDICAMENTO`
--
ALTER TABLE `MEDICAMENTO`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `NOTAS`
--
ALTER TABLE `NOTAS`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `NOTA_EVOLUTIVA`
--
ALTER TABLE `NOTA_EVOLUTIVA`
  MODIFY `id_nota_evolutiva` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `NOTA_INTERCONSULTA`
--
ALTER TABLE `NOTA_INTERCONSULTA`
  MODIFY `id_nota_interconsulta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `PACIENTE_GINECO`
--
ALTER TABLE `PACIENTE_GINECO`
  MODIFY `id_gineco` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `RECETA`
--
ALTER TABLE `RECETA`
  MODIFY `id_receta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `SEGURO_MEDICO`
--
ALTER TABLE `SEGURO_MEDICO`
  MODIFY `id_seguro_medico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `TERAPEUTICA`
--
ALTER TABLE `TERAPEUTICA`
  MODIFY `id_terapeutica` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `TRASLADO`
--
ALTER TABLE `TRASLADO`
  MODIFY `id_traslado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `TRATAMIENTO`
--
ALTER TABLE `TRATAMIENTO`
  MODIFY `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ANALISIS_CLINICO`
--
ALTER TABLE `ANALISIS_CLINICO`
  ADD CONSTRAINT `ANALISIS_CLINICO_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE,
  ADD CONSTRAINT `ANALISIS_CLINICO_ibfk_2` FOREIGN KEY (`id_analisis_tipo_fk`) REFERENCES `ANALISIS_TIPO` (`id_analisis_tipo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `CATALOGO_SISTEMA_SUBSECCION`
--
ALTER TABLE `CATALOGO_SISTEMA_SUBSECCION`
  ADD CONSTRAINT `CATALOGO_SISTEMA_SUBSECCION_ibfk_1` FOREIGN KEY (`id_sistema_fk`) REFERENCES `CATALOGO_SISTEMA` (`id_sistema`) ON DELETE CASCADE;

--
-- Filtros para la tabla `CONSULTAS_INTERROGATORIO`
--
ALTER TABLE `CONSULTAS_INTERROGATORIO`
  ADD CONSTRAINT `CONSULTAS_INTERROGATORIO_ibfk_1` FOREIGN KEY (`id_consulta_descripcion_fk`) REFERENCES `CONSULTA_DESCRIPCION` (`id_consulta_descripcion`) ON DELETE CASCADE,
  ADD CONSTRAINT `CONSULTAS_INTERROGATORIO_ibfk_2` FOREIGN KEY (`id_sistema_subseccion_fk`) REFERENCES `CATALOGO_SISTEMA_SUBSECCION` (`id_sistema_subseccion`) ON DELETE CASCADE;

--
-- Filtros para la tabla `CONSULTA_DESCRIPCION`
--
ALTER TABLE `CONSULTA_DESCRIPCION`
  ADD CONSTRAINT `CONSULTA_DESCRIPCION_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `CONSULTA_PADECIMIENTO`
--
ALTER TABLE `CONSULTA_PADECIMIENTO`
  ADD CONSTRAINT `CONSULTA_PADECIMIENTO_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `DIAGNOSTICO`
--
ALTER TABLE `DIAGNOSTICO`
  ADD CONSTRAINT `DIAGNOSTICO_ibfk_1` FOREIGN KEY (`id_consulta_descripcion_fk`) REFERENCES `CONSULTA_DESCRIPCION` (`id_consulta_descripcion`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ENFERMEDAD`
--
ALTER TABLE `ENFERMEDAD`
  ADD CONSTRAINT `ENFERMEDAD_ibfk_1` FOREIGN KEY (`id_enfermedad_tipo_fk`) REFERENCES `ENFERMEDAD_TIPO` (`id_enfermedad_tipo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `EXPLORACION`
--
ALTER TABLE `EXPLORACION`
  ADD CONSTRAINT `EXPLORACION_ibfk_1` FOREIGN KEY (`id_consulta_descripcion_fk`) REFERENCES `CONSULTA_DESCRIPCION` (`id_consulta_descripcion`) ON DELETE CASCADE;

--
-- Filtros para la tabla `FICHA_HEREDOFAMILIARES`
--
ALTER TABLE `FICHA_HEREDOFAMILIARES`
  ADD CONSTRAINT `FICHA_HEREDOFAMILIARES_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `FICHA_NOPATOLOGICO_ALERGIA`
--
ALTER TABLE `FICHA_NOPATOLOGICO_ALERGIA`
  ADD CONSTRAINT `FICHA_NOPATOLOGICO_ALERGIA_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE,
  ADD CONSTRAINT `FICHA_NOPATOLOGICO_ALERGIA_ibfk_2` FOREIGN KEY (`id_medicamento_fk`) REFERENCES `MEDICAMENTO` (`id_medicamento`) ON DELETE CASCADE;

--
-- Filtros para la tabla `FICHA_NOPATOLOGICO_GRUPOSANGUINEO`
--
ALTER TABLE `FICHA_NOPATOLOGICO_GRUPOSANGUINEO`
  ADD CONSTRAINT `FICHA_NOPATOLOGICO_GRUPOSANGUINEO_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`),
  ADD CONSTRAINT `FICHA_NOPATOLOGICO_GRUPOSANGUINEO_ibfk_2` FOREIGN KEY (`id_tipo_sangre_fk`) REFERENCES `FICHA_NOPATOLOGICO_CATALOGOSANGRE` (`id_tipo_sangre`);

--
-- Filtros para la tabla `FICHA_NOPATOLOGICO_GRUPO_OTROS`
--
ALTER TABLE `FICHA_NOPATOLOGICO_GRUPO_OTROS`
  ADD CONSTRAINT `FICHA_NOPATOLOGICO_GRUPO_OTROS_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `FICHA_PATOLOGICO_HOSPITALIZACION`
--
ALTER TABLE `FICHA_PATOLOGICO_HOSPITALIZACION`
  ADD CONSTRAINT `FICHA_PATOLOGICO_HOSPITALIZACION_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `FICHA_PATOLOGICO_INMUNIZACIONES`
--
ALTER TABLE `FICHA_PATOLOGICO_INMUNIZACIONES`
  ADD CONSTRAINT `FICHA_PATOLOGICO_INMUNIZACIONES_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE,
  ADD CONSTRAINT `FICHA_PATOLOGICO_INMUNIZACIONES_ibfk_2` FOREIGN KEY (`id_catalogo_inmunizacion_fk`) REFERENCES `FICHA_PATOLOGICO_CATALOGO_INMUNIZACIONES` (`id_catalogo_inmunizacion`) ON DELETE CASCADE;

--
-- Filtros para la tabla `FICHA_PATOLOGICO_PADECIMIENTO`
--
ALTER TABLE `FICHA_PATOLOGICO_PADECIMIENTO`
  ADD CONSTRAINT `FICHA_PATOLOGICO_PADECIMIENTO_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE,
  ADD CONSTRAINT `FICHA_PATOLOGICO_PADECIMIENTO_ibfk_2` FOREIGN KEY (`id_catalogo_padecimiento_fk`) REFERENCES `FICHA_PATOLOGICO_CATALOGO_PADECIMIENTOS` (`id_catalogo_padecimiento`) ON DELETE CASCADE;

--
-- Filtros para la tabla `FICHA_PATOLOGICO_PADECIMIENTO_HABITO`
--
ALTER TABLE `FICHA_PATOLOGICO_PADECIMIENTO_HABITO`
  ADD CONSTRAINT `FICHA_PATOLOGICO_PADECIMIENTO_HABITO_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE,
  ADD CONSTRAINT `FICHA_PATOLOGICO_PADECIMIENTO_HABITO_ibfk_2` FOREIGN KEY (`id_catalogo_habito_fk`) REFERENCES `FICHA_PATOLOGICO_PADECIMIENTO_CATALOGO_HABITO` (`id_catalogo_habito`) ON DELETE CASCADE;

--
-- Filtros para la tabla `FICHA_PATOLOGICO_QUIRURGICO`
--
ALTER TABLE `FICHA_PATOLOGICO_QUIRURGICO`
  ADD CONSTRAINT `FICHA_PATOLOGICO_QUIRURGICO_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `FICHA_PATOLOGICO_QUIRURGICO_OBSERVACIONES`
--
ALTER TABLE `FICHA_PATOLOGICO_QUIRURGICO_OBSERVACIONES`
  ADD CONSTRAINT `FICHA_PATOLOGICO_QUIRURGICO_OBSERVACIONES_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `FICHA_PATOLOGICO_TRAUMA`
--
ALTER TABLE `FICHA_PATOLOGICO_TRAUMA`
  ADD CONSTRAINT `FICHA_PATOLOGICO_TRAUMA_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `LABORATORIO`
--
ALTER TABLE `LABORATORIO`
  ADD CONSTRAINT `LABORATORIO_ibfk_1` FOREIGN KEY (`id_consulta_descripcion_fk`) REFERENCES `CONSULTA_DESCRIPCION` (`id_consulta_descripcion`) ON DELETE CASCADE,
  ADD CONSTRAINT `LABORATORIO_ibfk_2` FOREIGN KEY (`id_analisis_fk`) REFERENCES `ANALISIS_CLINICO` (`id_analisis`) ON DELETE CASCADE;

--
-- Filtros para la tabla `MULTIMEDIA`
--
ALTER TABLE `MULTIMEDIA`
  ADD CONSTRAINT `MULTIMEDIA_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `NOTAS`
--
ALTER TABLE `NOTAS`
  ADD CONSTRAINT `NOTAS_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `NOTA_EVOLUTIVA`
--
ALTER TABLE `NOTA_EVOLUTIVA`
  ADD CONSTRAINT `NOTA_EVOLUTIVA_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `NOTA_INTERCONSULTA`
--
ALTER TABLE `NOTA_INTERCONSULTA`
  ADD CONSTRAINT `NOTA_INTERCONSULTA_ibfk_1` FOREIGN KEY (`id_consulta_descripcion_fk`) REFERENCES `CONSULTA_DESCRIPCION` (`id_consulta_descripcion`) ON DELETE CASCADE;

--
-- Filtros para la tabla `PACIENTE_GINECO`
--
ALTER TABLE `PACIENTE_GINECO`
  ADD CONSTRAINT `PACIENTE_GINECO_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `RECETA`
--
ALTER TABLE `RECETA`
  ADD CONSTRAINT `RECETA_ibfk_1` FOREIGN KEY (`id_medicamento_fk`) REFERENCES `MEDICAMENTO` (`id_medicamento`) ON DELETE CASCADE;

--
-- Filtros para la tabla `RECETA_TRATAMIENTO`
--
ALTER TABLE `RECETA_TRATAMIENTO`
  ADD CONSTRAINT `RECETA_TRATAMIENTO_ibfk_1` FOREIGN KEY (`id_tratamiento_fk`) REFERENCES `TRATAMIENTO` (`id_tratamiento`) ON DELETE CASCADE,
  ADD CONSTRAINT `RECETA_TRATAMIENTO_ibfk_2` FOREIGN KEY (`id_receta_fk`) REFERENCES `RECETA` (`id_receta`) ON DELETE CASCADE;

--
-- Filtros para la tabla `SEGURO_MEDICO`
--
ALTER TABLE `SEGURO_MEDICO`
  ADD CONSTRAINT `SEGURO_MEDICO_ibfk_1` FOREIGN KEY (`id_paciente_fk`) REFERENCES `EXPEDIENTE_PACIENTE` (`id_paciente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `TERAPEUTICA`
--
ALTER TABLE `TERAPEUTICA`
  ADD CONSTRAINT `TERAPEUTICA_ibfk_1` FOREIGN KEY (`id_tratamiento_fk`) REFERENCES `TRATAMIENTO` (`id_tratamiento`) ON DELETE CASCADE,
  ADD CONSTRAINT `TERAPEUTICA_ibfk_2` FOREIGN KEY (`id_consulta_descripcion_fk`) REFERENCES `CONSULTA_DESCRIPCION` (`id_consulta_descripcion`) ON DELETE CASCADE;

--
-- Filtros para la tabla `TRASLADO`
--
ALTER TABLE `TRASLADO`
  ADD CONSTRAINT `TRASLADO_ibfk_1` FOREIGN KEY (`id_consulta_descripcion_fk`) REFERENCES `CONSULTA_DESCRIPCION` (`id_consulta_descripcion`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
