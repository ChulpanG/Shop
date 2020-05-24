--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

-- Started on 2020-05-24 19:42:45 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3202 (class 0 OID 0)
-- Dependencies: 3201
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 2 (class 3079 OID 13241)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3205 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 209 (class 1259 OID 83490)
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE app_user (
    id integer NOT NULL,
    sso_id character varying(30) NOT NULL,
    password character varying(100) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(30) NOT NULL,
    state character varying(30) NOT NULL,
    door_no character varying(20) DEFAULT NULL::character varying,
    area_name character varying(20) DEFAULT NULL::character varying,
    state_name character varying(50) DEFAULT NULL::character varying,
    country character varying(25) DEFAULT NULL::character varying,
    zip_code character varying(15) DEFAULT NULL::character varying,
    phone_number character varying(15) DEFAULT NULL::character varying,
    street_name character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.app_user OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 83488)
-- Name: app_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_id_seq OWNER TO postgres;

--
-- TOC entry 3206 (class 0 OID 0)
-- Dependencies: 208
-- Name: app_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_user_id_seq OWNED BY public.app_user.id;


--
-- TOC entry 198 (class 1259 OID 83423)
-- Name: app_user_user_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user_user_profile (
    user_id integer NOT NULL,
    user_profile_id integer NOT NULL
);


ALTER TABLE public.app_user_user_profile OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 83430)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    category_name character varying(40) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 83428)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3207 (class 0 OID 0)
-- Dependencies: 199
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 201 (class 1259 OID 83436)
-- Name: order_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_product (
    order_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.order_product OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 83441)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 83439)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3208 (class 0 OID 0)
-- Dependencies: 202
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 205 (class 1259 OID 83449)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    product_description character varying(255) NOT NULL,
    product_name character varying(40),
    product_price numeric(10,2) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_product_price_check CHECK ((product_price >= (0)::numeric))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 83447)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3209 (class 0 OID 0)
-- Dependencies: 204
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 207 (class 1259 OID 83458)
-- Name: user_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_profile (
    id integer NOT NULL,
    type character varying(15) NOT NULL
);


ALTER TABLE public.user_profile OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 83456)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_profile_id_seq OWNER TO postgres;

--
-- TOC entry 3210 (class 0 OID 0)
-- Dependencies: 206
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_profile_id_seq OWNED BY public.user_profile.id;





--
-- TOC entry 3030 (class 2604 OID 83493)
-- Name: app_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user ALTER COLUMN id SET DEFAULT nextval('public.app_user_id_seq'::regclass);


--
-- TOC entry 3025 (class 2604 OID 83433)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3026 (class 2604 OID 83444)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3027 (class 2604 OID 83452)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3029 (class 2604 OID 83461)
-- Name: user_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile ALTER COLUMN id SET DEFAULT nextval('public.user_profile_id_seq'::regclass);


--
-- TOC entry 3195 (class 0 OID 83490)
-- Dependencies: 209
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.app_user (id, sso_id, password, first_name, last_name, email, state, door_no, area_name, state_name, country, zip_code, phone_number, street_name) VALUES (1, 'asd', '$2a$10$avnn5qOmLIh0JfUjk5DbKO3raCARqDVVGZNbyqOow7ZuG1M692SRO', 'asd', 'asd', 'asd@bb', 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.app_user (id, sso_id, password, first_name, last_name, email, state, door_no, area_name, state_name, country, zip_code, phone_number, street_name) VALUES (2, 'user', '$2a$10$9HUYLyikxTkI3tVxbEmM5OfiyxP./5shQ.rRU7/v8fjNjGuEWrMue', 'asda', 'asd', 'a@d', 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.app_user (id, sso_id, password, first_name, last_name, email, state, door_no, area_name, state_name, country, zip_code, phone_number, street_name) VALUES (3, 'admin', '$2a$10$hHyvL8Gu07J5LFL2A.OAnuHIQ.JwnAX90H.JIXM0Lul4ZCnFzqPUy', 'sdg', 'adsf', 'a@g', 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 3184 (class 0 OID 83423)
-- Dependencies: 198
-- Data for Name: app_user_user_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.app_user_user_profile (user_id, user_profile_id) VALUES (3, 1);
INSERT INTO public.app_user_user_profile (user_id, user_profile_id) VALUES (1, 2);
INSERT INTO public.app_user_user_profile (user_id, user_profile_id) VALUES (2, 2);


--
-- TOC entry 3186 (class 0 OID 83430)
-- Dependencies: 200
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, category_name) VALUES (1, 'Breakfast');
INSERT INTO public.category (id, category_name) VALUES (2, 'Lanch');
INSERT INTO public.category (id, category_name) VALUES (3, 'Dinner');
INSERT INTO public.category (id, category_name) VALUES (4, 'Other');


--
-- TOC entry 3187 (class 0 OID 83436)
-- Dependencies: 201
-- Data for Name: order_product; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3189 (class 0 OID 83441)
-- Dependencies: 203
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3191 (class 0 OID 83449)
-- Dependencies: 205
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, product_description, product_name, product_price, category_id) VALUES (2, 'This is dish', 'Dish', 12.00, 1);
INSERT INTO public.product (id, product_description, product_name, product_price, category_id) VALUES (3, 'Soup', 'Soup', 23.00, 2);
INSERT INTO public.product (id, product_description, product_name, product_price, category_id) VALUES (4, 'Meat', 'Meat', 14.00, 3);
INSERT INTO public.product (id, product_description, product_name, product_price, category_id) VALUES (5, 'Other', 'Other', 178.00, 4);


--
-- TOC entry 3193 (class 0 OID 83458)
-- Dependencies: 207
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_profile (id, type) VALUES (1, 'ADMIN');
INSERT INTO public.user_profile (id, type) VALUES (2, 'USER');
INSERT INTO public.user_profile (id, type) VALUES (3, 'DBA');



--
-- TOC entry 3211 (class 0 OID 0)
-- Dependencies: 208
-- Name: app_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_user_id_seq', 3, true);


--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 199
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 4, true);


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 202
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 204
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 5, true);


--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 206
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_profile_id_seq', 3, true);


--
-- TOC entry 3053 (class 2606 OID 83502)
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3055 (class 2606 OID 83504)
-- Name: app_user app_user_sso_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_sso_id_key UNIQUE (sso_id);


--
-- TOC entry 3039 (class 2606 OID 83427)
-- Name: app_user_user_profile app_user_user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_user_profile
    ADD CONSTRAINT app_user_user_profile_pkey PRIMARY KEY (user_id, user_profile_id);


--
-- TOC entry 3041 (class 2606 OID 83435)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3045 (class 2606 OID 83446)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3047 (class 2606 OID 83455)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3049 (class 2606 OID 83467)
-- Name: user_profile uk_cva7m2blp7ekclxworqxau1l7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT uk_cva7m2blp7ekclxworqxau1l7 UNIQUE (type);


--
-- TOC entry 3043 (class 2606 OID 83465)
-- Name: category uk_krhdtxhxmd2b1kbcbnqck48di; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT uk_krhdtxhxmd2b1kbcbnqck48di UNIQUE (category_name);


--
-- TOC entry 3051 (class 2606 OID 83463)
-- Name: user_profile user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (id);


--
-- TOC entry 3058 (class 2606 OID 83473)
-- Name: order_product fk2mf2y4acvw0ols2p4nmsg5ifi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT fk2mf2y4acvw0ols2p4nmsg5ifi FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3061 (class 2606 OID 83483)
-- Name: product fk7u438kvwr308xcwr4wbx36uiw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk7u438kvwr308xcwr4wbx36uiw FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3056 (class 2606 OID 83468)
-- Name: app_user_user_profile fk8w1hjq4mgw8b6xx41bb3q9yqk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_user_profile
    ADD CONSTRAINT fk8w1hjq4mgw8b6xx41bb3q9yqk FOREIGN KEY (user_profile_id) REFERENCES public.user_profile(id);


--
-- TOC entry 3060 (class 2606 OID 83510)
-- Name: orders fkelvc7sesonbiu26opu18q0vkr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fkelvc7sesonbiu26opu18q0vkr FOREIGN KEY (user_id) REFERENCES public.app_user(id);


--
-- TOC entry 3059 (class 2606 OID 83478)
-- Name: order_product fkf0sghmn59s14cxrjtrvkvi5yk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT fkf0sghmn59s14cxrjtrvkvi5yk FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 3057 (class 2606 OID 83505)
-- Name: app_user_user_profile fkt3cvepgn2tno4f85jvkauv71o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_user_profile
    ADD CONSTRAINT fkt3cvepgn2tno4f85jvkauv71o FOREIGN KEY (user_id) REFERENCES public.app_user(id);


-- Completed on 2020-05-24 19:42:46 MSK

--
-- PostgreSQL database dump complete
--

