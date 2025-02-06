--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-06 11:37:36

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
-- TOC entry 218 (class 1259 OID 24806)
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
-- TOC entry 217 (class 1259 OID 24805)
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
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 217
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- TOC entry 246 (class 1259 OID 33040)
-- Name: asistencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asistencias (
    id integer NOT NULL,
    cliente_id integer NOT NULL,
    fecha_asistencia timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.asistencias OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 33039)
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
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 245
-- Name: asistencias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asistencias_id_seq OWNED BY public.asistencias.id;


--
-- TOC entry 222 (class 1259 OID 24834)
-- Name: categorias_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias_productos (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    eliminado boolean DEFAULT false
);


ALTER TABLE public.categorias_productos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24833)
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
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 221
-- Name: categorias_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_productos_id_seq OWNED BY public.categorias_productos.id;


--
-- TOC entry 220 (class 1259 OID 24820)
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
-- TOC entry 219 (class 1259 OID 24819)
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
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 219
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 231 (class 1259 OID 32851)
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
-- TOC entry 230 (class 1259 OID 32850)
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
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 230
-- Name: compras_membresias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compras_membresias_id_seq OWNED BY public.compras_membresias.id;


--
-- TOC entry 234 (class 1259 OID 32945)
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
-- TOC entry 233 (class 1259 OID 32944)
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
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 233
-- Name: configuracion_gym_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.configuracion_gym_id_seq OWNED BY public.configuracion_gym.id;


--
-- TOC entry 238 (class 1259 OID 32969)
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
-- TOC entry 237 (class 1259 OID 32968)
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
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 237
-- Name: detalles_ventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalles_ventas_id_seq OWNED BY public.detalles_ventas.id;


--
-- TOC entry 229 (class 1259 OID 32839)
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
-- TOC entry 228 (class 1259 OID 32838)
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
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 228
-- Name: entrenadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entrenadores_id_seq OWNED BY public.entrenadores.id;


--
-- TOC entry 227 (class 1259 OID 32826)
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
-- TOC entry 226 (class 1259 OID 32825)
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
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 226
-- Name: membresias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.membresias_id_seq OWNED BY public.membresias.id;


--
-- TOC entry 224 (class 1259 OID 24859)
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
-- TOC entry 223 (class 1259 OID 24858)
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
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 223
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 236 (class 1259 OID 32955)
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
-- TOC entry 235 (class 1259 OID 32954)
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
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 235
-- Name: ventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_id_seq OWNED BY public.ventas.id;


--
-- TOC entry 244 (class 1259 OID 33026)
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
-- TOC entry 243 (class 1259 OID 33025)
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
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 243
-- Name: visitas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visitas_id_seq OWNED BY public.visitas.id;


--
-- TOC entry 248 (class 1259 OID 33057)
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
-- TOC entry 241 (class 1259 OID 33015)
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
-- TOC entry 239 (class 1259 OID 33000)
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
-- TOC entry 247 (class 1259 OID 33052)
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
-- TOC entry 240 (class 1259 OID 33010)
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
-- TOC entry 225 (class 1259 OID 32820)
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
-- TOC entry 232 (class 1259 OID 32923)
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
-- TOC entry 242 (class 1259 OID 33020)
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
-- TOC entry 4829 (class 2604 OID 24809)
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- TOC entry 4859 (class 2604 OID 33043)
-- Name: asistencias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencias ALTER COLUMN id SET DEFAULT nextval('public.asistencias_id_seq'::regclass);


--
-- TOC entry 4836 (class 2604 OID 24837)
-- Name: categorias_productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias_productos ALTER COLUMN id SET DEFAULT nextval('public.categorias_productos_id_seq'::regclass);


--
-- TOC entry 4833 (class 2604 OID 24823)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 4849 (class 2604 OID 32854)
-- Name: compras_membresias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_membresias ALTER COLUMN id SET DEFAULT nextval('public.compras_membresias_id_seq'::regclass);


--
-- TOC entry 4851 (class 2604 OID 32948)
-- Name: configuracion_gym id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_gym ALTER COLUMN id SET DEFAULT nextval('public.configuracion_gym_id_seq'::regclass);


--
-- TOC entry 4855 (class 2604 OID 32972)
-- Name: detalles_ventas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_ventas ALTER COLUMN id SET DEFAULT nextval('public.detalles_ventas_id_seq'::regclass);


--
-- TOC entry 4847 (class 2604 OID 32842)
-- Name: entrenadores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores ALTER COLUMN id SET DEFAULT nextval('public.entrenadores_id_seq'::regclass);


--
-- TOC entry 4844 (class 2604 OID 32829)
-- Name: membresias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias ALTER COLUMN id SET DEFAULT nextval('public.membresias_id_seq'::regclass);


--
-- TOC entry 4838 (class 2604 OID 24862)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 4853 (class 2604 OID 32958)
-- Name: ventas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas ALTER COLUMN id SET DEFAULT nextval('public.ventas_id_seq'::regclass);


--
-- TOC entry 4856 (class 2604 OID 33029)
-- Name: visitas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitas ALTER COLUMN id SET DEFAULT nextval('public.visitas_id_seq'::regclass);


--
-- TOC entry 4863 (class 2606 OID 24818)
-- Name: admins admins_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key UNIQUE (email);


--
-- TOC entry 4865 (class 2606 OID 24816)
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- TOC entry 4893 (class 2606 OID 33046)
-- Name: asistencias asistencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencias
    ADD CONSTRAINT asistencias_pkey PRIMARY KEY (id);


--
-- TOC entry 4873 (class 2606 OID 24839)
-- Name: categorias_productos categorias_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias_productos
    ADD CONSTRAINT categorias_productos_pkey PRIMARY KEY (id);


--
-- TOC entry 4867 (class 2606 OID 24830)
-- Name: clientes clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);


--
-- TOC entry 4869 (class 2606 OID 24832)
-- Name: clientes clientes_matricula_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_matricula_key UNIQUE (matricula);


--
-- TOC entry 4871 (class 2606 OID 24828)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 4883 (class 2606 OID 32857)
-- Name: compras_membresias compras_membresias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_membresias
    ADD CONSTRAINT compras_membresias_pkey PRIMARY KEY (id);


--
-- TOC entry 4885 (class 2606 OID 32953)
-- Name: configuracion_gym configuracion_gym_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_gym
    ADD CONSTRAINT configuracion_gym_pkey PRIMARY KEY (id);


--
-- TOC entry 4889 (class 2606 OID 32974)
-- Name: detalles_ventas detalles_ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_ventas
    ADD CONSTRAINT detalles_ventas_pkey PRIMARY KEY (id);


--
-- TOC entry 4879 (class 2606 OID 32849)
-- Name: entrenadores entrenadores_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_email_key UNIQUE (email);


--
-- TOC entry 4881 (class 2606 OID 32847)
-- Name: entrenadores entrenadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_pkey PRIMARY KEY (id);


--
-- TOC entry 4877 (class 2606 OID 32835)
-- Name: membresias membresias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_pkey PRIMARY KEY (id);


--
-- TOC entry 4875 (class 2606 OID 24871)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 4887 (class 2606 OID 32962)
-- Name: ventas ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id);


--
-- TOC entry 4891 (class 2606 OID 33033)
-- Name: visitas visitas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT visitas_pkey PRIMARY KEY (id);


--
-- TOC entry 5049 (class 2618 OID 33023)
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
-- TOC entry 4894 (class 2606 OID 24872)
-- Name: productos fk_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES public.categorias_productos(id) ON DELETE SET DEFAULT;


--
-- TOC entry 4895 (class 2606 OID 32858)
-- Name: compras_membresias fk_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_membresias
    ADD CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE CASCADE;


--
-- TOC entry 4898 (class 2606 OID 33047)
-- Name: asistencias fk_cliente_asistencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencias
    ADD CONSTRAINT fk_cliente_asistencia FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE CASCADE;


--
-- TOC entry 4897 (class 2606 OID 33034)
-- Name: visitas fk_cliente_visita; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT fk_cliente_visita FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE SET NULL;


--
-- TOC entry 4896 (class 2606 OID 32863)
-- Name: compras_membresias fk_membresia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_membresias
    ADD CONSTRAINT fk_membresia FOREIGN KEY (membresia_id) REFERENCES public.membresias(id) ON DELETE CASCADE;


-- Completed on 2025-02-06 11:37:36

--
-- PostgreSQL database dump complete
--

