--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Debian 11.7-0+deb10u1)
-- Dumped by pg_dump version 11.7 (Debian 11.7-0+deb10u1)

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

SET default_with_oids = false;

--
-- Name: juegos; Type: TABLE; Schema: public; Owner: erispheria
--

CREATE TABLE public.juegos (
    juego text NOT NULL
);


ALTER TABLE public.juegos OWNER TO REPLACEONINSTALL;

--
-- Name: main; Type: TABLE; Schema: public; Owner: erispheria
--

CREATE TABLE public.main (
    id integer NOT NULL,
    momento timestamp without time zone NOT NULL,
    sesion integer,
    juego text
);


ALTER TABLE public.main OWNER TO REPLACEONINSTALL;

--
-- Name: main_id_seq; Type: SEQUENCE; Schema: public; Owner: erispheria
--

CREATE SEQUENCE public.main_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_id_seq OWNER TO REPLACEONINSTALL;

--
-- Name: main_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erispheria
--

ALTER SEQUENCE public.main_id_seq OWNED BY public.main.id;


--
-- Name: main id; Type: DEFAULT; Schema: public; Owner: erispheria
--

ALTER TABLE ONLY public.main ALTER COLUMN id SET DEFAULT nextval('public.main_id_seq'::regclass);


--
-- Name: main_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erispheria
--

SELECT pg_catalog.setval('public.main_id_seq', 1, true);


--
-- Name: juegos juegos_pk; Type: CONSTRAINT; Schema: public; Owner: erispheria
--

ALTER TABLE ONLY public.juegos
    ADD CONSTRAINT juegos_pk PRIMARY KEY (juego);


--
-- Name: main main_fk; Type: FK CONSTRAINT; Schema: public; Owner: erispheria
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT main_fk FOREIGN KEY (juego) REFERENCES public.juegos(juego);


--
-- PostgreSQL database dump complete
--
