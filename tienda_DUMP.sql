--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: detalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle (
    num_detalle integer NOT NULL,
    num_factura integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer NOT NULL,
    precio real NOT NULL
);


ALTER TABLE public.detalle OWNER TO postgres;

--
-- Name: detalle_num_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_num_detalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_num_detalle_seq OWNER TO postgres;

--
-- Name: detalle_num_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_num_detalle_seq OWNED BY public.detalle.num_detalle;


--
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura (
    num_factura integer NOT NULL,
    id_cliente character varying(50) NOT NULL,
    fecha timestamp without time zone NOT NULL,
    monto_total real,
    igv real,
    precio_total real
);


ALTER TABLE public.factura OWNER TO postgres;

--
-- Name: factura_num_factura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factura_num_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.factura_num_factura_seq OWNER TO postgres;

--
-- Name: factura_num_factura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factura_num_factura_seq OWNED BY public.factura.num_factura;


--
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id_producto integer NOT NULL,
    nombre character varying(100) NOT NULL,
    precio real NOT NULL,
    stock integer
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- Name: producto_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_id_producto_seq OWNER TO postgres;

--
-- Name: producto_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_id_producto_seq OWNED BY public.producto.id_producto;


--
-- Name: detalle num_detalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle ALTER COLUMN num_detalle SET DEFAULT nextval('public.detalle_num_detalle_seq'::regclass);


--
-- Name: factura num_factura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura ALTER COLUMN num_factura SET DEFAULT nextval('public.factura_num_factura_seq'::regclass);


--
-- Name: producto id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN id_producto SET DEFAULT nextval('public.producto_id_producto_seq'::regclass);


--
-- Data for Name: detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle (num_detalle, num_factura, id_producto, cantidad, precio) FROM stdin;
\.


--
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factura (num_factura, id_cliente, fecha, monto_total, igv, precio_total) FROM stdin;
23	40880382	2021-01-25 00:24:18	600	108	708
\.


--
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (id_producto, nombre, precio, stock) FROM stdin;
1	leche	4	50
\.


--
-- Name: detalle_num_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_num_detalle_seq', 5, true);


--
-- Name: factura_num_factura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factura_num_factura_seq', 24, true);


--
-- Name: producto_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_id_producto_seq', 2, true);


--
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (num_factura);


--
-- Name: detalle pk_detalle; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle
    ADD CONSTRAINT pk_detalle PRIMARY KEY (num_detalle) INCLUDE (num_detalle);


--
-- Name: producto pk_producto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT pk_producto PRIMARY KEY (id_producto) INCLUDE (id_producto);


--
-- Name: fki_fk_detalle_2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_detalle_2 ON public.detalle USING btree (id_producto);


--
-- Name: detalle fk_detalle_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle
    ADD CONSTRAINT fk_detalle_1 FOREIGN KEY (num_factura) REFERENCES public.factura(num_factura) ON DELETE CASCADE NOT VALID;


--
-- Name: detalle fk_detalle_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle
    ADD CONSTRAINT fk_detalle_2 FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto) ON DELETE CASCADE NOT VALID;


--
-- PostgreSQL database dump complete
--

