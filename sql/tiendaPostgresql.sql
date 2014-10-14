--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.1
-- Started on 2014-09-18 08:46:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 191 (class 3079 OID 11757)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2080 (class 0 OID 0)
-- Dependencies: 191
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 17335)
-- Name: ciudades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ciudades (
    id_ciudad integer NOT NULL,
    nombreciudad character varying(25),
    id_departamento integer NOT NULL
);


--
-- TOC entry 173 (class 1259 OID 17345)
-- Name: clientes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE clientes (
    id_cliente numeric(20,0) NOT NULL,
    tel_cliente numeric(16,0),
    nombre_cliente character varying(100),
    id_ciudad integer NOT NULL,
    date_cliente date DEFAULT now()
);


--
-- TOC entry 176 (class 1259 OID 17368)
-- Name: compra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE compra (
    id_compra integer NOT NULL,
    id_proveedor numeric(10,0),
    fecha_compra date,
    ref_compra numeric(16,0)
);


--
-- TOC entry 175 (class 1259 OID 17366)
-- Name: compra_id_compra_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE compra_id_compra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2081 (class 0 OID 0)
-- Dependencies: 175
-- Name: compra_id_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE compra_id_compra_seq OWNED BY compra.id_compra;


--
-- TOC entry 180 (class 1259 OID 17399)
-- Name: compra_producto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE compra_producto (
    id_compra integer NOT NULL,
    id_producto numeric NOT NULL,
    cant_compra_producto numeric(16,0),
    valor_compra__producto numeric(16,0)
);


--
-- TOC entry 179 (class 1259 OID 17397)
-- Name: compra_producto_id_compra_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE compra_producto_id_compra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2082 (class 0 OID 0)
-- Dependencies: 179
-- Name: compra_producto_id_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE compra_producto_id_compra_seq OWNED BY compra_producto.id_compra;


--
-- TOC entry 190 (class 1259 OID 17480)
-- Name: cuotas_compra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cuotas_compra (
    id_cuota_compra numeric(10,0) NOT NULL,
    id_compra integer NOT NULL,
    num_cuota numeric(10,0),
    fecha_cuota date,
    estado_couta character(1)
);


--
-- TOC entry 189 (class 1259 OID 17478)
-- Name: cuotas_compra_id_compra_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cuotas_compra_id_compra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2083 (class 0 OID 0)
-- Dependencies: 189
-- Name: cuotas_compra_id_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cuotas_compra_id_compra_seq OWNED BY cuotas_compra.id_compra;


--
-- TOC entry 171 (class 1259 OID 17330)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE departamentos (
    id_departamento integer NOT NULL,
    nombredepartamento character varying(25)
);


--
-- TOC entry 170 (class 1259 OID 16798)
-- Name: empleados; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE empleados (
    idempleado numeric NOT NULL,
    departamento character varying(25),
    salario numeric(8,0),
    edad character varying(3)
);


--
-- TOC entry 188 (class 1259 OID 17467)
-- Name: forma_pagos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE forma_pagos (
    id_formapago numeric(10,0) NOT NULL,
    id_compra integer NOT NULL,
    desc_formapago character varying(50)
);


--
-- TOC entry 187 (class 1259 OID 17465)
-- Name: forma_pagos_id_compra_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE forma_pagos_id_compra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2084 (class 0 OID 0)
-- Dependencies: 187
-- Name: forma_pagos_id_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE forma_pagos_id_compra_seq OWNED BY forma_pagos.id_compra;


--
-- TOC entry 178 (class 1259 OID 17384)
-- Name: productos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE productos (
    id_producto numeric NOT NULL,
    id_tipoproducto numeric(10,0),
    descripcion_producto character varying(100),
    precio_producto numeric(8,0),
    ref_producto numeric(10,0),
    presentacion_producto character varying(30)
);


--
-- TOC entry 174 (class 1259 OID 17356)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE proveedores (
    id_proveedor numeric(10,0) NOT NULL,
    nombre_proveedor character varying(100),
    nit_proveedor numeric(20,0),
    id_ciudad integer NOT NULL,
    tel_proveedor numeric(16,0),
    direccion_proveedor character varying(100)
);


--
-- TOC entry 186 (class 1259 OID 17454)
-- Name: stock_productos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stock_productos (
    id_stockproductos numeric(10,0) NOT NULL,
    id_compra integer NOT NULL,
    cant_productos numeric(10,0),
    fecha_actualizaion date
);


--
-- TOC entry 185 (class 1259 OID 17452)
-- Name: stock_productos_id_compra_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stock_productos_id_compra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2085 (class 0 OID 0)
-- Dependencies: 185
-- Name: stock_productos_id_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stock_productos_id_compra_seq OWNED BY stock_productos.id_compra;


--
-- TOC entry 177 (class 1259 OID 17379)
-- Name: tipo_productos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipo_productos (
    id_tipoproducto numeric(10,0) NOT NULL,
    desc_tipoproducto character varying(100),
    perecedero_tipoproducto character(1)
);


--
-- TOC entry 182 (class 1259 OID 17420)
-- Name: venta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE venta (
    id_venta integer NOT NULL,
    id_cliente numeric(20,0),
    fecha_venta date,
    ref_venta numeric(16,0)
);


--
-- TOC entry 181 (class 1259 OID 17418)
-- Name: venta_id_venta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE venta_id_venta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2086 (class 0 OID 0)
-- Dependencies: 181
-- Name: venta_id_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE venta_id_venta_seq OWNED BY venta.id_venta;


--
-- TOC entry 184 (class 1259 OID 17433)
-- Name: venta_producto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE venta_producto (
    id_producto numeric NOT NULL,
    id_venta integer NOT NULL,
    cant_venta numeric(3,0)
);


--
-- TOC entry 183 (class 1259 OID 17431)
-- Name: venta_producto_id_venta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE venta_producto_id_venta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2087 (class 0 OID 0)
-- Dependencies: 183
-- Name: venta_producto_id_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE venta_producto_id_venta_seq OWNED BY venta_producto.id_venta;


--
-- TOC entry 1898 (class 2604 OID 17371)
-- Name: id_compra; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY compra ALTER COLUMN id_compra SET DEFAULT nextval('compra_id_compra_seq'::regclass);


--
-- TOC entry 1899 (class 2604 OID 17402)
-- Name: id_compra; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY compra_producto ALTER COLUMN id_compra SET DEFAULT nextval('compra_producto_id_compra_seq'::regclass);


--
-- TOC entry 1904 (class 2604 OID 17483)
-- Name: id_compra; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cuotas_compra ALTER COLUMN id_compra SET DEFAULT nextval('cuotas_compra_id_compra_seq'::regclass);


--
-- TOC entry 1903 (class 2604 OID 17470)
-- Name: id_compra; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY forma_pagos ALTER COLUMN id_compra SET DEFAULT nextval('forma_pagos_id_compra_seq'::regclass);


--
-- TOC entry 1902 (class 2604 OID 17457)
-- Name: id_compra; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY stock_productos ALTER COLUMN id_compra SET DEFAULT nextval('stock_productos_id_compra_seq'::regclass);


--
-- TOC entry 1900 (class 2604 OID 17423)
-- Name: id_venta; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY venta ALTER COLUMN id_venta SET DEFAULT nextval('venta_id_venta_seq'::regclass);


--
-- TOC entry 1901 (class 2604 OID 17436)
-- Name: id_venta; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY venta_producto ALTER COLUMN id_venta SET DEFAULT nextval('venta_producto_id_venta_seq'::regclass);


--
-- TOC entry 2055 (class 0 OID 17335)
-- Dependencies: 172
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (5001, 'MEDELLIN', 5);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (5002, 'ABEJORRAL', 5);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (5004, 'ABRIAQUI', 5);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (5021, 'ALEJANDRIA', 5);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (81001, 'ARAUCA', 81);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (81065, 'ARAUQUITA', 81);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (810220, 'CRAVO NORTE', 81);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (8001, 'BARRANQUILLA', 8);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (8078, 'BARANOA', 8);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (80137, 'CAMPO DE LA CRUZ', 8);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (11001, 'BOGOTA D.C', 11);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (13001, 'CARTAGENA', 13);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (13006, 'ACHI', 13);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (13030, 'ALTOS DEL ROSARIO', 13);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (15001, 'TUNJA', 15);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (15022, 'ALMEIDA', 15);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (15047, 'AQUITANIA', 15);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (17001, 'MANIZALES', 17);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (17013, 'AGUADAS', 17);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (17042, 'ANSERMA', 17);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (18001, 'FLORENCIA', 18);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (18029, 'ALBANIA', 18);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (18094, 'BELEN DE LOS ANDAQUIES', 18);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (85001, 'YOPAL', 85);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (85010, 'AGUAZUL', 85);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (85015, 'CHAMEZA', 85);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (19001, 'POPAYAN', 19);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (19022, 'ALMAGUER', 19);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (19050, 'ARGELIA', 19);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (20001, 'VALLEDUPAR', 20);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (20011, 'AGUACHICA', 20);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (20013, 'AGUSTIN CODAZZI', 20);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (27001, 'QUIBDO', 27);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (27006, 'ACANDI', 27);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (27025, 'ALTO BAUDO', 27);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (23001, 'MONTERIA', 23);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (23068, 'AYAPEL', 23);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (23079, 'BUENAVISTA', 23);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (25001, 'AGUA DE DIOS', 25);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (25019, 'ALBAN', 25);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (25035, 'ANAPOIMA', 25);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (94001, 'INIRIDA', 94);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (94343, 'BARRANCO MINAS', 94);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (94663, 'MAPIRIPANA', 94);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (95001, 'SAN JOSE DEL GUAVIARE', 95);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (95015, 'CALAMAR', 95);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (95025, 'EL RETORNO', 95);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (41001, 'NEIVA', 41);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (41006, 'ACEVEDO', 41);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (41013, 'AGRADO', 41);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (44001, 'RIOHACHA', 44);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (44035, 'ALBANIA', 44);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (44078, 'BARRANCAS', 44);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (47001, 'SANTA MARTA', 47);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (47030, 'ALGARROBO', 47);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (47053, 'ARACATACA', 47);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (50001, 'VILLAVICENCIO', 50);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (50006, 'ACACIAS', 50);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (50110, 'BARRANCA DE UPIA', 50);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (52001, 'PASTO', 52);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (52019, 'ALBAN', 52);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (52022, 'ALDANA', 52);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (54001, 'CUCUTA', 54);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (54003, 'ABREGO', 54);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (54051, 'ARBOLEDAS', 54);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (86001, 'MOCOA', 86);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (860219, 'COLON', 86);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (860320, 'ORITO', 86);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (63001, 'ARMENIA', 63);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (63111, 'BUENAVISTA', 63);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (63130, 'CALARCA', 63);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (66001, 'PEREIRA', 66);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (66045, 'APIA', 66);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (66075, 'BALBOA', 66);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (88001, 'SAN ANDRES', 88);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (88564, 'PROVIDENCIA', 88);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (68001, 'BUCARAMANGA', 68);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (68013, 'AGUADA', 68);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (68020, 'ALBANIA', 68);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (70001, 'SINCELEJO', 70);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (70110, 'BUENAVISTA', 70);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (70124, 'CAIMITO', 70);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (73001, 'IBAGUE', 73);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (73024, 'ALPUJARRA', 73);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (73026, 'ALVARADO', 73);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (76001, 'CALI', 76);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (76020, 'ALCALA', 76);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (76036, 'ANDALUCIA', 76);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (97001, 'MITU', 97);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (97161, 'CARURU', 97);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (97511, 'PACOA', 97);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (99001, 'PUERTO CARREÑO', 99);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (99524, 'LA PRIMAVERA', 99);
INSERT INTO ciudades (id_ciudad, nombreciudad, id_departamento) VALUES (99624, 'SANTA ROSALIA', 99);


--
-- TOC entry 2056 (class 0 OID 17345)
-- Dependencies: 173
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (890287487, 2374683, 'Andres Martinez', 8001, '2014-09-05');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (898392749, 2873644, 'Maria Luisa Perez', 66001, '2014-09-05');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (863476387, 58567234, 'Martha Lucia Lopez', 11001, '2014-09-05');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (4653456234, 3135775595, 'Steven Certuche', 11001, '2014-09-05');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (6278346, 31187977, 'Felipe Gutierres', 5001, '2014-09-03');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (7873631, 345527892, 'Luisa Maria Certuche', 11001, '2014-08-05');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (10656356, 56266354, 'Eugenia Andrade', 66001, '2013-09-05');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (11046748, 31466894, 'Roberto Lopez', 11001, '2014-01-02');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (17938794, 355607963, 'Carlos Gomez', 76001, '2013-06-05');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (20708389, 473878, 'Ruben Londoño', 5001, '2014-02-05');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (20732445, 4523234, 'Martin Londoño', 5001, '2012-07-05');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (23462425, 6607963, 'Marlene Palacios', 76001, '2013-03-20');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (61253707, 4757367, 'Julian Palacios', 76001, '2014-04-04');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (82734872, 2374322, 'Andrea Martinez', 8001, '2014-05-05');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (106873980, 56267090, 'Maria Andrade', 66001, '2013-09-05');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (111668983, 3128768763344, 'Hans Gordon', 8001, '2012-09-05');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (115467389, 3128765632, 'Juan Gordon', 8001, '2013-08-05');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (125865497, 6474839, 'Andres Lopez', 66001, '2013-09-15');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (238479723, 4564778, 'Mario Hernandez', 5001, '2013-01-05');
INSERT INTO clientes (id_cliente, tel_cliente, nombre_cliente, id_ciudad, date_cliente) VALUES (928734987, 4254672, 'Federico Hernandez', 76001, '2012-09-05');


--
-- TOC entry 2059 (class 0 OID 17368)
-- Dependencies: 176
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (1, 1, '2014-08-27', 10100);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (2, 1, '2014-07-27', 10101);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (3, 10, '2014-06-07', 10102);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (4, 6, '2014-04-27', 10103);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (5, 8, '2014-05-27', 10104);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (6, 3, '2014-08-27', 10105);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (7, 21, '2014-02-27', 10106);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (8, 11, '2014-03-27', 10107);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (9, 20, '2014-04-07', 10108);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (10, 16, '2014-05-27', 10109);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (11, 18, '2014-06-27', 10110);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (12, 13, '2014-07-27', 10111);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (13, 11, '2014-08-27', 10112);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (14, 11, '2014-09-27', 10113);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (15, 10, '2014-09-07', 10114);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (16, 26, '2014-08-27', 10115);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (17, 28, '2014-07-27', 10114);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (18, 13, '2014-06-27', 10115);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (19, 11, '2014-05-27', 10116);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (20, 21, '2014-04-27', 10117);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (21, 20, '2014-03-07', 10118);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (22, 16, '2014-02-27', 10119);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (23, 18, '2014-01-27', 10120);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (24, 13, '2014-02-27', 10121);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (25, 11, '2014-03-27', 10122);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (26, 21, '2014-04-27', 10123);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (27, 20, '2014-05-07', 10124);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (28, 16, '2014-06-27', 10125);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (29, 28, '2014-07-27', 10126);
INSERT INTO compra (id_compra, id_proveedor, fecha_compra, ref_compra) VALUES (30, 13, '2014-08-27', 10127);


--
-- TOC entry 2088 (class 0 OID 0)
-- Dependencies: 175
-- Name: compra_id_compra_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('compra_id_compra_seq', 1, false);


--
-- TOC entry 2063 (class 0 OID 17399)
-- Dependencies: 180
-- Data for Name: compra_producto; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (1, 1000, 10, 250000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (2, 1001, 2, 90000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (3, 1004, 1, 65000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (4, 1006, 1, 250000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (5, 1010, 2, 30000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (6, 1009, 1, 50000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (7, 1033, 1, 250000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (8, 1021, 20, 90000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (9, 1014, 11, 65000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (10, 1026, 1, 250000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (11, 1018, 12, 30000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (12, 1029, 10, 50000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (13, 1030, 20, 250000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (14, 1041, 22, 90000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (15, 1034, 11, 65000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (16, 1026, 1, 250000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (17, 1020, 21, 30000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (18, 1019, 18, 50000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (19, 1010, 6, 250000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (20, 1021, 9, 90000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (21, 1034, 5, 65000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (22, 1016, 4, 250000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (23, 1020, 7, 30000);
INSERT INTO compra_producto (id_compra, id_producto, cant_compra_producto, valor_compra__producto) VALUES (24, 1019, 9, 50000);


--
-- TOC entry 2089 (class 0 OID 0)
-- Dependencies: 179
-- Name: compra_producto_id_compra_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('compra_producto_id_compra_seq', 1, false);


--
-- TOC entry 2073 (class 0 OID 17480)
-- Dependencies: 190
-- Data for Name: cuotas_compra; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (2, 2, 3, '2014-10-27', 'Y');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (1, 1, 1, '2014-08-27', 'N');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (3, 3, 4, '2014-10-07', 'Y');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (4, 4, 2, '2014-06-27', 'Y');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (5, 5, 1, '2014-05-27', 'N');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (6, 6, 1, '2014-08-27', 'N');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (7, 7, 3, '2014-09-27', 'Y');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (8, 8, 1, '2014-07-27', 'N');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (9, 9, 4, '2014-06-07', 'Y');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (10, 10, 2, '2014-05-27', 'Y');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (11, 11, 1, '2014-04-27', 'N');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (12, 12, 1, '2014-03-27', 'N');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (13, 13, 3, '2014-02-27', 'Y');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (14, 14, 1, '2014-01-27', 'N');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (15, 15, 4, '2014-09-07', 'Y');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (16, 16, 2, '2014-05-27', 'Y');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (17, 17, 1, '2014-04-27', 'N');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (18, 18, 1, '2014-03-27', 'N');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (19, 19, 3, '2014-02-27', 'Y');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (20, 20, 1, '2014-07-27', 'N');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (21, 21, 4, '2014-09-07', 'Y');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (22, 22, 2, '2014-05-27', 'Y');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (23, 23, 1, '2014-04-27', 'N');
INSERT INTO cuotas_compra (id_cuota_compra, id_compra, num_cuota, fecha_cuota, estado_couta) VALUES (24, 24, 1, '2014-07-27', 'N');


--
-- TOC entry 2090 (class 0 OID 0)
-- Dependencies: 189
-- Name: cuotas_compra_id_compra_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cuotas_compra_id_compra_seq', 1, false);


--
-- TOC entry 2054 (class 0 OID 17330)
-- Dependencies: 171
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (91, 'Amazonas');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (5, 'Antioquia');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (81, 'Arauca');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (8, 'Atlantico');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (11, 'Bogota D.C');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (13, 'Bolivar');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (15, 'Boyaca');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (17, 'Caldas');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (18, 'Caqueta');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (85, 'Casanare');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (19, 'Cauca');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (20, 'Cesar');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (27, 'Choco');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (23, 'Cordoba');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (25, 'Cundinamarca');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (94, 'Guainia');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (95, 'Guaviare');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (41, 'Huila');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (44, 'La guajira');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (47, 'Magdalena');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (50, 'Meta');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (52, 'Nariño');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (54, 'Norte de santander');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (86, 'Putumayo');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (63, 'Quindio');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (66, 'Risaralda');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (88, 'San andres');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (68, 'Santander');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (70, 'Sucre');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (73, 'Tolima');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (76, 'Valle del cauca');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (97, 'Vaupes');
INSERT INTO departamentos (id_departamento, nombredepartamento) VALUES (99, 'Vichada');


--
-- TOC entry 2053 (class 0 OID 16798)
-- Dependencies: 170
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO empleados (idempleado, departamento, salario, edad) VALUES (1, 'ventas', 3000, '24');
INSERT INTO empleados (idempleado, departamento, salario, edad) VALUES (2, 'ventas', 3200, '26');
INSERT INTO empleados (idempleado, departamento, salario, edad) VALUES (3, 'ventas', 3500, '35');
INSERT INTO empleados (idempleado, departamento, salario, edad) VALUES (4, 'distribucion', 2000, '22');
INSERT INTO empleados (idempleado, departamento, salario, edad) VALUES (5, 'distribucion', 2100, '42');
INSERT INTO empleados (idempleado, departamento, salario, edad) VALUES (6, 'distribucion', 2400, '40');
INSERT INTO empleados (idempleado, departamento, salario, edad) VALUES (7, 'produccion', 2800, '41');
INSERT INTO empleados (idempleado, departamento, salario, edad) VALUES (8, 'produccion', 2400, '29');
INSERT INTO empleados (idempleado, departamento, salario, edad) VALUES (9, 'produccion', 1900, '19');
INSERT INTO empleados (idempleado, departamento, salario, edad) VALUES (10, 'produccion', 3000, '45');
INSERT INTO empleados (idempleado, departamento, salario, edad) VALUES (11, 'produccion', 3000, '40');


--
-- TOC entry 2071 (class 0 OID 17467)
-- Dependencies: 188
-- Data for Name: forma_pagos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO forma_pagos (id_formapago, id_compra, desc_formapago) VALUES (1, 1, 'Efectivo');
INSERT INTO forma_pagos (id_formapago, id_compra, desc_formapago) VALUES (2, 2, 'Tarjeta Credito');
INSERT INTO forma_pagos (id_formapago, id_compra, desc_formapago) VALUES (4, 4, 'Cheque');
INSERT INTO forma_pagos (id_formapago, id_compra, desc_formapago) VALUES (3, 3, 'Efectivo+Cheque');
INSERT INTO forma_pagos (id_formapago, id_compra, desc_formapago) VALUES (5, 5, 'Efectivo+Tarjeta');
INSERT INTO forma_pagos (id_formapago, id_compra, desc_formapago) VALUES (6, 6, 'Tarjeta Debito');


--
-- TOC entry 2091 (class 0 OID 0)
-- Dependencies: 187
-- Name: forma_pagos_id_compra_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('forma_pagos_id_compra_seq', 1, false);


--
-- TOC entry 2061 (class 0 OID 17384)
-- Dependencies: 178
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1003, 5, 'Soporte', 100000, 97649, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1004, 4, 'Aceite', 65000, 92650, 'Galon');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1005, 5, 'Limpiador', 20000, 9236597, 'Galon');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1006, 2, 'Taladro', 250000, 297657, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1007, 2, 'Pulidora', 300000, 347568, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1008, 2, 'Cortadora', 185000, 3945672, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1009, 2, 'Juego Destornilladores', 50000, 293497, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1010, 5, 'Silicona', 15000, 394593, 'Tubo');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1000, 1, 'Accesorios Industriales', 25000, 93476, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1001, 3, 'Pegante', 45000, 23423, 'Tubo');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1002, 2, 'Juego Llaves', 55000, 9623, 'Individual');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1011, 6, 'Soporte Mecanico', 120000, 97650, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1012, 9, 'Aceite Especial', 75000, 92660, 'Galon');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1013, 10, 'Limpiador Penetrante', 22000, 9236598, 'Galon');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1014, 7, 'Taladro Industrial', 350000, 297658, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1015, 6, 'Pulidora', 400000, 347569, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1016, 6, 'Cortadora Industrial', 285000, 3945673, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1017, 2, 'Juego Alicates', 50000, 293497, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1018, 5, 'Silicona Grande', 25000, 394594, 'Tubo');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1019, 13, 'Accesorios Electricos', 25000, 93476, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1020, 8, 'Pegante Fuerte', 55000, 23424, 'Tubo');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1021, 7, 'Juego Llaves Aleman', 65000, 9624, 'Individual');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1022, 12, 'Soporte Electromencanico', 100000, 97649, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1023, 14, 'Aceite Mutigrado', 75000, 92651, 'Galon');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1024, 15, 'Limpiador', 30000, 9236599, 'Galon');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1025, 11, 'Taladro Industrial', 350000, 297660, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1026, 11, 'Pulidora Neumatica', 360000, 347570, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1027, 12, 'Cortadora Electrica', 195000, 3945680, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1028, 7, 'Juego Destornilladores Magneticos', 60000, 293500, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1029, 5, 'Silicona Negra', 25000, 394595, 'Tubo');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1030, 10, 'Accesorios Industriales', 25000, 93476, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1031, 8, 'Pegante Sintetico', 55000, 23430, 'Tubo');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1032, 7, 'Juego Llaves Estrella', 65000, 96230, 'Individual');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1033, 11, 'Soporte Hidraulico', 200000, 97660, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1034, 14, 'Aceite Alta Temperatura', 75000, 92670, 'Galon');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1035, 15, 'Limpiador Electronico', 30000, 9236620, 'Galon');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1036, 11, 'Taladro Neumatico', 350000, 297700, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1037, 12, 'Pulidora Electrica Pesada', 400000, 347578, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1038, 12, 'Cortadora Electrica Automatica', 285000, 3945682, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1039, 7, 'Juego Destornilladores Punta Diamante', 60000, 293407, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1040, 15, 'Silicona Gris', 25000, 39483, 'Tubo');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1041, 13, 'Accesorios Electricos Industriales', 35000, 93496, 'Caja');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1042, 8, 'Pegante Rapido', 55000, 23433, 'Tubo');
INSERT INTO productos (id_producto, id_tipoproducto, descripcion_producto, precio_producto, ref_producto, presentacion_producto) VALUES (1043, 2, 'Juego Llaves Finas', 65000, 96443, 'Individual');


--
-- TOC entry 2057 (class 0 OID 17356)
-- Dependencies: 174
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (1, 'Dsitribuciones Cali', 890327682, 76001, 3664484949, 'cra1#376-45');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (2, 'Alimentos el Paisa S.A', 8003568899, 66001, 64783889, 'av8N#68-144');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (3, 'INternacional de Cosas Ltda', 8967355378, 5001, 467484, 'Calle 25#878-346');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (4, 'La Cosa Rica S.A.S', 87653989, 11001, 8964534, 'Clla 45#34-120');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (5, 'La confianza Ltda', 879579873, 76001, 9236792, 'Clla54#346-34');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (6, 'Productos el canario S.A', 890768768, 8001, 9287970, 'Cra67A#45-234');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (7, 'Comercializadora la quinta', 880235376, 66001, 923697799, 'Cra5#345-345');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (8, 'Productos especiales S.A', 8609762376, 5001, 2639852398, 'Cra23#36-35');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (9, 'Internacional de suministros', 890923776, 11001, 58782973, 'Cra23#36-35');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (10, 'Producto Colombia S.A', 800763387, 8001, 34587988, 'Calle 65#34-23');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (11, 'Altecnica Cali', 8999238768, 8001, 3662345, 'cra1#36-55');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (12, 'Implementos el Paisa S.A', 8005435729, 11001, 64723542, 'av9N#68-14');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (13, 'Internacional de Herramientas Ltda', 8905765733, 5001, 46748423, 'Calle 5#78-46');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (14, 'La Maquina S.A.S', 8608768723, 66001, 865764754, 'Calle 5#34-120');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (15, 'Distribuidor Industrial Ltda', 880876787, 8001, 67572882, 'Calle 54#46-34');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (16, 'Productos el canario S.A', 890768768, 76001, 9287970, 'Cra67a#45-234');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (17, 'Comercializadora Mecanica', 880235376, 11001, 314767984, 'Cra15#35-35');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (18, 'Productos Industriales S.A', 870976376, 5001, 314852398, 'Cra3#36-3');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (19, 'Internacional de suministros2 Ltda', 880923776, 66001, 315382973, 'Cra3#3-35');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (20, 'Colombiana de Solucionez S.A', 880763387, 76001, 314587988, 'Calle 6#3-23');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (21, 'Altecnica Bogota', 8999238620, 11001, 4662345, 'cra2#36-55');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (22, 'Implementos S.A', 8005435354, 8001, 64723234, 'av10N#68-14');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (23, 'Internacional Ltda', 8905765234, 5001, 46748345, 'Calle 8#78-46');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (24, 'La Maquina S.A', 8608768234, 66001, 865764765, 'Calle 15#34-120');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (25, 'Distribuidor Ltda', 88087653456, 8001, 675723456, 'Calle 14#146-34');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (26, 'Productos S.A', 8907682345, 76001, 9287567, 'Cra7#45-234');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (27, 'Comercializadora Ltda.', 8802355467, 11001, 3147675678, 'Cra5#65-35');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (28, 'Industriales S.A', 870976234, 5001, 314852398, 'Cra33#3-3');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (29, 'Suministros Ltda', 880927857, 66001, 315382767, 'Cra3#3-35');
INSERT INTO proveedores (id_proveedor, nombre_proveedor, nit_proveedor, id_ciudad, tel_proveedor, direccion_proveedor) VALUES (30, 'Soluciones S.A', 880123345, 76001, 314587988, 'Calle 66#35-3');


--
-- TOC entry 2069 (class 0 OID 17454)
-- Dependencies: 186
-- Data for Name: stock_productos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (1, 5, 2, '2014-08-27');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (2, 2, 1, '2014-07-17');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (3, 4, 10, '2014-06-07');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (4, 6, 20, '2014-08-20');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (5, 1, 4, '2014-05-12');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (6, 3, 12, '2014-04-14');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (7, 7, 2, '2014-07-27');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (8, 8, 1, '2014-06-17');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (9, 9, 10, '2014-05-07');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (10, 10, 20, '2014-07-20');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (11, 11, 4, '2014-04-12');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (12, 12, 12, '2014-03-14');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (13, 13, 2, '2014-07-27');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (14, 14, 1, '2014-06-17');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (15, 15, 10, '2014-05-07');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (16, 16, 20, '2014-07-20');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (17, 17, 4, '2014-04-12');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (18, 18, 12, '2014-03-14');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (19, 19, 2, '2014-07-27');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (20, 20, 1, '2014-06-17');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (21, 21, 10, '2014-05-07');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (22, 22, 20, '2014-07-20');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (23, 23, 4, '2014-04-12');
INSERT INTO stock_productos (id_stockproductos, id_compra, cant_productos, fecha_actualizaion) VALUES (24, 24, 12, '2014-03-14');


--
-- TOC entry 2092 (class 0 OID 0)
-- Dependencies: 185
-- Name: stock_productos_id_compra_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('stock_productos_id_compra_seq', 1, false);


--
-- TOC entry 2060 (class 0 OID 17379)
-- Dependencies: 177
-- Data for Name: tipo_productos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (1, 'accesorios', 'N');
INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (2, 'herramientas', 'N');
INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (3, 'pegantes', 'Y');
INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (4, 'lubricantes', 'Y');
INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (5, 'otros', 'N');
INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (6, 'Accesorios Electricos', 'N');
INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (7, 'Herramienta Liviana', 'N');
INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (8, 'Pegantes Especiales', 'Y');
INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (9, 'Lubricantes Industriales', 'Y');
INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (10, 'otros Accesorios', 'N');
INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (11, 'Herramienta Pesada', 'N');
INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (12, 'Herramienta Electrica', 'N');
INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (13, 'Accesorios Electricos', 'Y');
INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (14, 'lubricantes Especiales', 'Y');
INSERT INTO tipo_productos (id_tipoproducto, desc_tipoproducto, perecedero_tipoproducto) VALUES (15, 'Varios', 'N');


--
-- TOC entry 2065 (class 0 OID 17420)
-- Dependencies: 182
-- Data for Name: venta; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (1, 61253707, '2014-06-14', 10000);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (2, 7873631, '2014-08-10', 10001);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (3, 106873980, '2014-08-10', 10002);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (4, 115467389, '2014-07-15', 10003);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (6, 17938794, '2014-05-05', 10005);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (5, 890287487, '2014-07-05', 10004);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (7, 20708389, '2014-02-05', 10006);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (8, 17938794, '2014-03-05', 10007);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (9, 125865497, '2014-04-25', 10008);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (10, 6278346, '2014-06-25', 10009);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (11, 111668983, '2014-05-14', 10010);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (12, 898392749, '2014-07-10', 10011);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (13, 238479723, '2014-07-10', 10012);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (14, 863476387, '2014-06-15', 10013);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (15, 23462425, '2014-04-05', 10014);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (16, 82734872, '2014-06-05', 10015);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (17, 10656356, '2014-03-05', 10016);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (18, 17938794, '2014-04-05', 10017);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (19, 125865497, '2014-05-25', 10018);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (20, 6278346, '2014-07-25', 10019);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (21, 61253707, '2014-07-14', 10020);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (22, 7873631, '2014-09-10', 10021);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (23, 106873980, '2014-07-10', 10022);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (24, 115467389, '2014-06-15', 10023);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (25, 17938794, '2014-04-05', 10024);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (26, 890287487, '2014-06-05', 10025);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (27, 20732445, '2014-03-05', 10026);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (28, 17938794, '2014-04-05', 10027);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (29, 125865497, '2014-05-25', 10028);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (30, 6278346, '2014-05-25', 10029);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (31, 61253707, '2014-07-14', 10030);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (32, 7873631, '2014-09-10', 10031);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (33, 106873980, '2014-09-10', 10032);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (34, 115467389, '2014-06-15', 10033);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (35, 17938794, '2014-04-05', 10034);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (36, 890287487, '2014-08-05', 10035);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (37, 20708389, '2014-03-05', 10036);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (38, 17938794, '2014-04-05', 10037);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (39, 111668983, '2014-05-25', 10038);
INSERT INTO venta (id_venta, id_cliente, fecha_venta, ref_venta) VALUES (40, 4653456234, '2014-07-25', 10039);


--
-- TOC entry 2093 (class 0 OID 0)
-- Dependencies: 181
-- Name: venta_id_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('venta_id_venta_seq', 1, false);


--
-- TOC entry 2067 (class 0 OID 17433)
-- Dependencies: 184
-- Data for Name: venta_producto; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1001, 3, 5);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1003, 6, 1);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1003, 10, 2);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1004, 7, 4);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1005, 4, 6);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1006, 9, 1);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1007, 1, 9);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1007, 5, 3);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1008, 8, 6);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1010, 2, 12);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1013, 11, 4);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1013, 16, 3);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1014, 17, 9);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1016, 19, 1);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1017, 15, 9);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1017, 21, 3);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1018, 18, 2);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1020, 12, 2);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1023, 20, 5);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1023, 26, 6);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1024, 17, 8);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1024, 27, 1);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1025, 14, 4);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1026, 29, 1);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1027, 21, 1);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1028, 28, 3);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1030, 32, 1);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1031, 33, 4);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1033, 30, 7);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1033, 36, 4);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1035, 34, 6);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1035, 38, 1);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1036, 29, 1);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1037, 25, 1);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1037, 31, 5);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1037, 35, 2);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1038, 28, 1);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1040, 32, 5);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1041, 33, 2);
INSERT INTO venta_producto (id_producto, id_venta, cant_venta) VALUES (1042, 33, 7);


--
-- TOC entry 2094 (class 0 OID 0)
-- Dependencies: 183
-- Name: venta_producto_id_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('venta_producto_id_venta_seq', 1, false);


--
-- TOC entry 1910 (class 2606 OID 17339)
-- Name: ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (id_ciudad);


--
-- TOC entry 1912 (class 2606 OID 17350)
-- Name: clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 1916 (class 2606 OID 17373)
-- Name: compra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id_compra);


--
-- TOC entry 1922 (class 2606 OID 17407)
-- Name: compra_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compra_producto
    ADD CONSTRAINT compra_producto_pkey PRIMARY KEY (id_compra, id_producto);


--
-- TOC entry 1932 (class 2606 OID 17485)
-- Name: cuotas_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cuotas_compra
    ADD CONSTRAINT cuotas_compra_pkey PRIMARY KEY (id_cuota_compra);


--
-- TOC entry 1908 (class 2606 OID 17334)
-- Name: departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id_departamento);


--
-- TOC entry 1906 (class 2606 OID 16805)
-- Name: empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empleados
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (idempleado);


--
-- TOC entry 1930 (class 2606 OID 17472)
-- Name: pk_forma_pagos; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forma_pagos
    ADD CONSTRAINT pk_forma_pagos PRIMARY KEY (id_formapago);


--
-- TOC entry 1920 (class 2606 OID 17391)
-- Name: productos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 1914 (class 2606 OID 17360)
-- Name: proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id_proveedor);


--
-- TOC entry 1928 (class 2606 OID 17459)
-- Name: stock_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stock_productos
    ADD CONSTRAINT stock_productos_pkey PRIMARY KEY (id_stockproductos);


--
-- TOC entry 1918 (class 2606 OID 17383)
-- Name: tipo_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_productos
    ADD CONSTRAINT tipo_productos_pkey PRIMARY KEY (id_tipoproducto);


--
-- TOC entry 1924 (class 2606 OID 17425)
-- Name: venta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id_venta);


--
-- TOC entry 1926 (class 2606 OID 17441)
-- Name: venta_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY venta_producto
    ADD CONSTRAINT venta_producto_pkey PRIMARY KEY (id_producto, id_venta);


--
-- TOC entry 1933 (class 2606 OID 17340)
-- Name: ciudades_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ciudades
    ADD CONSTRAINT ciudades_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento);


--
-- TOC entry 1934 (class 2606 OID 17351)
-- Name: clientes_id_ciudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_id_ciudad_fkey FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad);


--
-- TOC entry 1936 (class 2606 OID 17374)
-- Name: compra_id_proveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_id_proveedor_fkey FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor);


--
-- TOC entry 1938 (class 2606 OID 17408)
-- Name: compra_producto_id_compra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compra_producto
    ADD CONSTRAINT compra_producto_id_compra_fkey FOREIGN KEY (id_compra) REFERENCES compra(id_compra);


--
-- TOC entry 1939 (class 2606 OID 17413)
-- Name: compra_producto_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compra_producto
    ADD CONSTRAINT compra_producto_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES productos(id_producto);


--
-- TOC entry 1945 (class 2606 OID 17486)
-- Name: cuotas_compra_id_compra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cuotas_compra
    ADD CONSTRAINT cuotas_compra_id_compra_fkey FOREIGN KEY (id_compra) REFERENCES compra(id_compra);


--
-- TOC entry 1944 (class 2606 OID 17473)
-- Name: fk_forma_compra; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forma_pagos
    ADD CONSTRAINT fk_forma_compra FOREIGN KEY (id_compra) REFERENCES compra(id_compra);


--
-- TOC entry 1937 (class 2606 OID 17392)
-- Name: productos_id_tipoproducto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT productos_id_tipoproducto_fkey FOREIGN KEY (id_tipoproducto) REFERENCES tipo_productos(id_tipoproducto);


--
-- TOC entry 1935 (class 2606 OID 17361)
-- Name: proveedores_id_ciudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_id_ciudad_fkey FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad);


--
-- TOC entry 1943 (class 2606 OID 17460)
-- Name: stock_productos_id_compra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stock_productos
    ADD CONSTRAINT stock_productos_id_compra_fkey FOREIGN KEY (id_compra) REFERENCES compra(id_compra);


--
-- TOC entry 1940 (class 2606 OID 17426)
-- Name: venta_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT venta_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);


--
-- TOC entry 1941 (class 2606 OID 17442)
-- Name: venta_producto_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY venta_producto
    ADD CONSTRAINT venta_producto_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES productos(id_producto);


--
-- TOC entry 1942 (class 2606 OID 17447)
-- Name: venta_producto_id_venta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY venta_producto
    ADD CONSTRAINT venta_producto_id_venta_fkey FOREIGN KEY (id_venta) REFERENCES venta(id_venta);


-- Completed on 2014-09-18 08:46:24

--
-- PostgreSQL database dump complete
--

