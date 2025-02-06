--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: gymapp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE gymapp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE gymapp OWNER TO postgres;

\connect gymapp

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido_paterno character varying(255) NOT NULL,
    apellido_materno character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    telefono character varying(15),
    password character varying(255) NOT NULL,
    token character varying(255) DEFAULT NULL::character varying,
    confirmado boolean DEFAULT false,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: asistencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asistencias (
    id integer NOT NULL,
    cliente_id integer NOT NULL,
    fecha_asistencia timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.asistencias OWNER TO postgres;

--
-- Name: asistencias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asistencias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asistencias_id_seq OWNER TO postgres;

--
-- Name: asistencias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asistencias_id_seq OWNED BY public.asistencias.id;


--
-- Name: categorias_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias_productos (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    eliminado boolean DEFAULT false
);


ALTER TABLE public.categorias_productos OWNER TO postgres;

--
-- Name: categorias_productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorias_productos_id_seq OWNER TO postgres;

--
-- Name: categorias_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_productos_id_seq OWNED BY public.categorias_productos.id;


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido_paterno character varying(255) NOT NULL,
    apellido_materno character varying(255) NOT NULL,
    telefono character varying(10) NOT NULL,
    nacimiento date NOT NULL,
    email character varying(255) NOT NULL,
    matricula character varying(50) NOT NULL,
    img_public_id character varying(255),
    img_secure_url character varying(255),
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    eliminado boolean DEFAULT false
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_seq OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- Name: compras_membresias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compras_membresias (
    id integer NOT NULL,
    cliente_id integer NOT NULL,
    membresia_id integer NOT NULL,
    fecha_compra timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_expiracion timestamp without time zone NOT NULL,
    fecha_renovacion timestamp with time zone
);


ALTER TABLE public.compras_membresias OWNER TO postgres;

--
-- Name: compras_membresias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compras_membresias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.compras_membresias_id_seq OWNER TO postgres;

--
-- Name: compras_membresias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compras_membresias_id_seq OWNED BY public.compras_membresias.id;


--
-- Name: configuracion_gym; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuracion_gym (
    id integer NOT NULL,
    nombre_gimnasio character varying(255) NOT NULL,
    horario_apertura time without time zone NOT NULL,
    horario_cierre time without time zone NOT NULL,
    precio_visita numeric(10,2) NOT NULL,
    email_envio_reportes character varying(255) NOT NULL,
    direccion character varying(255),
    telefono character varying(15),
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.configuracion_gym OWNER TO postgres;

--
-- Name: configuracion_gym_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.configuracion_gym_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.configuracion_gym_id_seq OWNER TO postgres;

--
-- Name: configuracion_gym_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.configuracion_gym_id_seq OWNED BY public.configuracion_gym.id;


--
-- Name: detalles_ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalles_ventas (
    id integer NOT NULL,
    venta_id integer NOT NULL,
    producto_id integer NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    subtotal numeric(10,2) NOT NULL
);


ALTER TABLE public.detalles_ventas OWNER TO postgres;

--
-- Name: detalles_ventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalles_ventas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.detalles_ventas_id_seq OWNER TO postgres;

--
-- Name: detalles_ventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalles_ventas_id_seq OWNED BY public.detalles_ventas.id;


--
-- Name: entrenadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrenadores (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido_paterno character varying(255) NOT NULL,
    apellido_materno character varying(255) NOT NULL,
    especialidad character varying(255) NOT NULL,
    telefono character varying(15),
    email character varying(255),
    activo boolean DEFAULT true,
    img_public_id character varying(255),
    img_secure_url character varying(255)
);


ALTER TABLE public.entrenadores OWNER TO postgres;

--
-- Name: entrenadores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entrenadores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entrenadores_id_seq OWNER TO postgres;

--
-- Name: entrenadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entrenadores_id_seq OWNED BY public.entrenadores.id;


--
-- Name: membresias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membresias (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    beneficios character varying[] NOT NULL,
    duracion_dias integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    disponible boolean DEFAULT true,
    eliminado boolean DEFAULT false
);


ALTER TABLE public.membresias OWNER TO postgres;

--
-- Name: membresias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.membresias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membresias_id_seq OWNER TO postgres;

--
-- Name: membresias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.membresias_id_seq OWNED BY public.membresias.id;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    marca character varying(255) NOT NULL,
    categoria_id integer DEFAULT 0,
    stock integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    descuento numeric(5,2) DEFAULT 0.00,
    total numeric(10,2) NOT NULL,
    img_public_id character varying(255),
    img_secure_url character varying(255),
    disponible boolean DEFAULT true,
    eliminado boolean DEFAULT false,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_id_seq OWNER TO postgres;

--
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas (
    id integer NOT NULL,
    cliente_id integer,
    cliente_externo character varying(255),
    fecha_venta timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total numeric(10,2) NOT NULL,
    CONSTRAINT chk_cliente CHECK ((((cliente_id IS NOT NULL) AND (cliente_externo IS NULL)) OR ((cliente_id IS NULL) AND (cliente_externo IS NOT NULL))))
);


ALTER TABLE public.ventas OWNER TO postgres;

--
-- Name: ventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ventas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ventas_id_seq OWNER TO postgres;

--
-- Name: ventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_id_seq OWNED BY public.ventas.id;


--
-- Name: visitas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visitas (
    id integer NOT NULL,
    cliente_id integer,
    cliente_externo character varying(255),
    fecha_visita timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    tipo character varying(20) DEFAULT 'cliente'::character varying NOT NULL,
    precio numeric(10,2) NOT NULL
);


ALTER TABLE public.visitas OWNER TO postgres;

--
-- Name: visitas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visitas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.visitas_id_seq OWNER TO postgres;

--
-- Name: visitas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visitas_id_seq OWNED BY public.visitas.id;


--
-- Name: vista_asistencias; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_asistencias AS
 SELECT a.fecha_asistencia,
    c.nombre,
    c.apellido_paterno,
    c.apellido_materno,
    c.img_secure_url,
    c.telefono,
    c.matricula
   FROM (public.asistencias a
     JOIN public.clientes c ON ((a.cliente_id = c.id)));


ALTER VIEW public.vista_asistencias OWNER TO postgres;

--
-- Name: vista_clientes_sin_membresia; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_clientes_sin_membresia AS
 SELECT c.id AS cliente_id,
    c.nombre AS cliente_nombre,
    c.apellido_paterno AS cliente_apellido_paterno,
    c.apellido_materno AS cliente_apellido_materno,
    c.telefono AS cliente_telefono,
    c.email AS cliente_email,
    c.img_secure_url AS cliente_img_secure_url
   FROM (public.clientes c
     LEFT JOIN public.compras_membresias cm ON (((c.id = cm.cliente_id) AND (cm.fecha_expiracion >= now()))))
  WHERE ((cm.id IS NULL) AND (c.eliminado = false));


ALTER VIEW public.vista_clientes_sin_membresia OWNER TO postgres;

--
-- Name: vista_compras_membresias; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_compras_membresias AS
 SELECT cm.id AS compra_id,
    c.id AS cliente_id,
    c.nombre AS cliente_nombre,
    c.apellido_paterno AS cliente_apellido_paterno,
    c.apellido_materno AS cliente_apellido_materno,
    c.telefono AS cliente_telefono,
    c.matricula AS cliente_matricula,
    c.email AS cliente_email,
    c.img_secure_url AS cliente_img_secure_url,
    m.id AS membresia_id,
    m.nombre AS membresia_nombre,
    m.beneficios AS membresia_beneficios,
    m.precio AS membresia_precio,
    cm.fecha_compra,
    cm.fecha_expiracion,
    cm.fecha_renovacion,
    GREATEST((0)::numeric, EXTRACT(day FROM ((cm.fecha_expiracion)::timestamp with time zone - now()))) AS dias_restantes,
        CASE
            WHEN ((cm.fecha_expiracion)::date = CURRENT_DATE) THEN 'Vence hoy'::text
            WHEN ((cm.fecha_expiracion)::date > CURRENT_DATE) THEN
            CASE
                WHEN ((cm.fecha_expiracion)::date <= (CURRENT_DATE + '7 days'::interval)) THEN 'Por vencer'::text
                ELSE 'Activa'::text
            END
            ELSE 'Vencida'::text
        END AS estado
   FROM ((public.compras_membresias cm
     JOIN public.clientes c ON ((cm.cliente_id = c.id)))
     JOIN public.membresias m ON ((cm.membresia_id = m.id)));


ALTER VIEW public.vista_compras_membresias OWNER TO postgres;

--
-- Name: vista_compras_visitas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_compras_visitas AS
 SELECT v.id AS visita_id,
    v.fecha_visita,
    v.precio,
    v.tipo,
        CASE
            WHEN (v.cliente_id IS NOT NULL) THEN json_build_object('nombre', c.nombre, 'apellidoPaterno', c.apellido_paterno, 'apellidoMaterno', c.apellido_materno, 'email', c.email, 'telefono', c.telefono)
            WHEN (v.cliente_externo IS NOT NULL) THEN json_build_object('nombre', v.cliente_externo)
            ELSE NULL::json
        END AS cliente
   FROM (public.visitas v
     LEFT JOIN public.clientes c ON ((v.cliente_id = c.id)));


ALTER VIEW public.vista_compras_visitas OWNER TO postgres;

--
-- Name: vista_membresias_clientes; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_membresias_clientes AS
 WITH ranked_compras AS (
         SELECT cm_1.id,
            cm_1.cliente_id,
            cm_1.membresia_id,
            cm_1.fecha_compra,
            cm_1.fecha_expiracion,
            cm_1.fecha_renovacion,
            row_number() OVER (PARTITION BY cm_1.cliente_id ORDER BY cm_1.fecha_compra DESC) AS rn
           FROM public.compras_membresias cm_1
        )
 SELECT cm.id AS compra_id,
    c.id AS cliente_id,
    c.nombre AS cliente_nombre,
    c.apellido_paterno AS cliente_apellido_paterno,
    c.apellido_materno AS cliente_apellido_materno,
    c.matricula AS cliente_matricula,
    c.telefono AS cliente_telefono,
    c.email AS cliente_email,
    c.img_secure_url AS cliente_img_secure_url,
    m.id AS membresia_id,
    m.nombre AS membresia_nombre,
    m.beneficios AS membresia_beneficios,
    m.precio AS membresia_precio,
    cm.fecha_compra,
    cm.fecha_expiracion,
    cm.fecha_renovacion,
    GREATEST((0)::numeric, EXTRACT(day FROM ((cm.fecha_expiracion)::timestamp with time zone - now()))) AS dias_restantes,
        CASE
            WHEN ((cm.fecha_expiracion)::date < CURRENT_DATE) THEN 'Vencida'::text
            WHEN ((cm.fecha_expiracion)::date = CURRENT_DATE) THEN 'Vence hoy'::text
            WHEN ((cm.fecha_expiracion)::date > CURRENT_DATE) THEN
            CASE
                WHEN ((cm.fecha_expiracion)::date <= (CURRENT_DATE + '7 days'::interval)) THEN 'Por vencer'::text
                ELSE 'Activa'::text
            END
            ELSE NULL::text
        END AS estado
   FROM ((ranked_compras cm
     JOIN public.clientes c ON ((cm.cliente_id = c.id)))
     JOIN public.membresias m ON ((cm.membresia_id = m.id)))
  WHERE ((cm.rn = 1) AND (c.eliminado = false));


ALTER VIEW public.vista_membresias_clientes OWNER TO postgres;

--
-- Name: vista_nivel_stock; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_nivel_stock AS
 SELECT p.id,
    p.nombre,
    p.marca,
    p.categoria_id,
    c.nombre AS categoria,
    p.stock,
    p.precio,
    p.descuento,
    p.total,
    p.img_public_id,
    p.img_secure_url,
    p.fecha_creacion,
    p.disponible,
        CASE
            WHEN (p.stock > 20) THEN 'Suficiente'::text
            WHEN ((p.stock >= 10) AND (p.stock <= 20)) THEN 'Medio'::text
            WHEN (p.stock < 10) THEN 'Bajo'::text
            ELSE 'Sin definir'::text
        END AS nivel_stock
   FROM (public.productos p
     LEFT JOIN public.categorias_productos c ON ((p.categoria_id = c.id)))
  WHERE (p.eliminado = false);


ALTER VIEW public.vista_nivel_stock OWNER TO postgres;

--
-- Name: vista_ultima_compra_membresia; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_ultima_compra_membresia AS
 SELECT cm.id AS compra_id,
    cm.cliente_id,
    cm.membresia_id,
    c.nombre AS cliente_nombre,
    m.nombre AS membresia_nombre,
    cm.fecha_compra,
    cm.fecha_expiracion,
    cm.fecha_renovacion,
        CASE
            WHEN ((cm.fecha_expiracion)::date = CURRENT_DATE) THEN 'vence hoy'::text
            WHEN ((cm.fecha_expiracion)::date > CURRENT_DATE) THEN
            CASE
                WHEN ((cm.fecha_expiracion)::date <= (CURRENT_DATE + '7 days'::interval)) THEN 'por vencer'::text
                ELSE 'activa'::text
            END
            ELSE 'vencida'::text
        END AS estado
   FROM ((public.compras_membresias cm
     JOIN public.clientes c ON ((cm.cliente_id = c.id)))
     JOIN public.membresias m ON ((cm.membresia_id = m.id)));


ALTER VIEW public.vista_ultima_compra_membresia OWNER TO postgres;

--
-- Name: vista_ventas_productos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_ventas_productos AS
SELECT
    NULL::integer AS venta_id,
    NULL::timestamp without time zone AS fecha_venta,
    NULL::numeric(10,2) AS total,
    NULL::json AS cliente,
    NULL::json AS detalles_productos;


ALTER VIEW public.vista_ventas_productos OWNER TO postgres;

--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: asistencias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencias ALTER COLUMN id SET DEFAULT nextval('public.asistencias_id_seq'::regclass);


--
-- Name: categorias_productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias_productos ALTER COLUMN id SET DEFAULT nextval('public.categorias_productos_id_seq'::regclass);


--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- Name: compras_membresias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_membresias ALTER COLUMN id SET DEFAULT nextval('public.compras_membresias_id_seq'::regclass);


--
-- Name: configuracion_gym id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_gym ALTER COLUMN id SET DEFAULT nextval('public.configuracion_gym_id_seq'::regclass);


--
-- Name: detalles_ventas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_ventas ALTER COLUMN id SET DEFAULT nextval('public.detalles_ventas_id_seq'::regclass);


--
-- Name: entrenadores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores ALTER COLUMN id SET DEFAULT nextval('public.entrenadores_id_seq'::regclass);


--
-- Name: membresias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias ALTER COLUMN id SET DEFAULT nextval('public.membresias_id_seq'::regclass);


--
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- Name: ventas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas ALTER COLUMN id SET DEFAULT nextval('public.ventas_id_seq'::regclass);


--
-- Name: visitas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitas ALTER COLUMN id SET DEFAULT nextval('public.visitas_id_seq'::regclass);


--
-- Name: admins admins_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key UNIQUE (email);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: asistencias asistencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencias
    ADD CONSTRAINT asistencias_pkey PRIMARY KEY (id);


--
-- Name: categorias_productos categorias_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias_productos
    ADD CONSTRAINT categorias_productos_pkey PRIMARY KEY (id);


--
-- Name: clientes clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);


--
-- Name: clientes clientes_matricula_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_matricula_key UNIQUE (matricula);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: compras_membresias compras_membresias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_membresias
    ADD CONSTRAINT compras_membresias_pkey PRIMARY KEY (id);


--
-- Name: configuracion_gym configuracion_gym_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_gym
    ADD CONSTRAINT configuracion_gym_pkey PRIMARY KEY (id);


--
-- Name: detalles_ventas detalles_ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_ventas
    ADD CONSTRAINT detalles_ventas_pkey PRIMARY KEY (id);


--
-- Name: entrenadores entrenadores_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_email_key UNIQUE (email);


--
-- Name: entrenadores entrenadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_pkey PRIMARY KEY (id);


--
-- Name: membresias membresias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_pkey PRIMARY KEY (id);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- Name: ventas ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id);


--
-- Name: visitas visitas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT visitas_pkey PRIMARY KEY (id);


--
-- Name: vista_ventas_productos _RETURN; Type: RULE; Schema: public; Owner: postgres
--

CREATE OR REPLACE VIEW public.vista_ventas_productos AS
 SELECT v.id AS venta_id,
    v.fecha_venta,
    v.total,
        CASE
            WHEN (v.cliente_id IS NOT NULL) THEN json_build_object('nombre', c.nombre, 'apellido_paterno', c.apellido_paterno, 'apellido_materno', c.apellido_materno, 'email', c.email, 'telefono', c.telefono)
            WHEN (v.cliente_externo IS NOT NULL) THEN json_build_object('nombre', v.cliente_externo)
            ELSE NULL::json
        END AS cliente,
    json_agg(json_build_object('nombre_producto', p.nombre, 'marca', p.marca, 'cantidad', dv.cantidad, 'precio_unitario', dv.precio_unitario, 'subtotal', dv.subtotal, 'img', p.img_secure_url, 'categoria', cat.nombre)) AS detalles_productos
   FROM ((((public.detalles_ventas dv
     JOIN public.ventas v ON ((dv.venta_id = v.id)))
     LEFT JOIN public.clientes c ON ((v.cliente_id = c.id)))
     LEFT JOIN public.productos p ON ((dv.producto_id = p.id)))
     LEFT JOIN public.categorias_productos cat ON ((p.categoria_id = cat.id)))
  GROUP BY v.id, v.fecha_venta, v.total, v.cliente_id, v.cliente_externo, c.id;


--
-- Name: productos fk_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES public.categorias_productos(id) ON DELETE SET DEFAULT;


--
-- Name: compras_membresias fk_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_membresias
    ADD CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE CASCADE;


--
-- Name: asistencias fk_cliente_asistencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencias
    ADD CONSTRAINT fk_cliente_asistencia FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE CASCADE;


--
-- Name: visitas fk_cliente_visita; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT fk_cliente_visita FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE SET NULL;


--
-- Name: compras_membresias fk_membresia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_membresias
    ADD CONSTRAINT fk_membresia FOREIGN KEY (membresia_id) REFERENCES public.membresias(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

