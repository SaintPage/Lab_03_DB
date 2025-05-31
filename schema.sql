--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-25 23:26:23

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 855 (class 1247 OID 21022)
-- Name: enum_Cursos_nivel; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_Cursos_nivel" AS ENUM (
    'basico',
    'intermedio',
    'avanzado'
);


ALTER TYPE public."enum_Cursos_nivel" OWNER TO postgres;

--
-- TOC entry 861 (class 1247 OID 21037)
-- Name: enum_Estudiantes_estado; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_Estudiantes_estado" AS ENUM (
    'activo',
    'suspendido',
    'graduado'
);


ALTER TYPE public."enum_Estudiantes_estado" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 21030)
-- Name: Cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cursos" (
    id integer NOT NULL,
    nombre character varying(255),
    nivel public."enum_Cursos_nivel" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Cursos" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 21029)
-- Name: Cursos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Cursos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Cursos_id_seq" OWNER TO postgres;

--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 218
-- Name: Cursos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Cursos_id_seq" OWNED BY public."Cursos".id;


--
-- TOC entry 221 (class 1259 OID 21044)
-- Name: Estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Estudiantes" (
    id integer NOT NULL,
    nombre character varying(255),
    estado public."enum_Estudiantes_estado" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Estudiantes" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 21043)
-- Name: Estudiantes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Estudiantes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Estudiantes_id_seq" OWNER TO postgres;

--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 220
-- Name: Estudiantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Estudiantes_id_seq" OWNED BY public."Estudiantes".id;


--
-- TOC entry 223 (class 1259 OID 21051)
-- Name: Inscripcions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Inscripcions" (
    id integer NOT NULL,
    "CursoId" integer,
    "EstudianteId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Inscripcions" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 21050)
-- Name: Inscripcions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Inscripcions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Inscripcions_id_seq" OWNER TO postgres;

--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 222
-- Name: Inscripcions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Inscripcions_id_seq" OWNED BY public."Inscripcions".id;


--
-- TOC entry 217 (class 1259 OID 21016)
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- TOC entry 4715 (class 2604 OID 21033)
-- Name: Cursos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cursos" ALTER COLUMN id SET DEFAULT nextval('public."Cursos_id_seq"'::regclass);


--
-- TOC entry 4716 (class 2604 OID 21047)
-- Name: Estudiantes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estudiantes" ALTER COLUMN id SET DEFAULT nextval('public."Estudiantes_id_seq"'::regclass);


--
-- TOC entry 4717 (class 2604 OID 21054)
-- Name: Inscripcions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inscripcions" ALTER COLUMN id SET DEFAULT nextval('public."Inscripcions_id_seq"'::regclass);


--
-- TOC entry 4721 (class 2606 OID 21035)
-- Name: Cursos Cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cursos"
    ADD CONSTRAINT "Cursos_pkey" PRIMARY KEY (id);


--
-- TOC entry 4723 (class 2606 OID 21049)
-- Name: Estudiantes Estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estudiantes"
    ADD CONSTRAINT "Estudiantes_pkey" PRIMARY KEY (id);


--
-- TOC entry 4725 (class 2606 OID 21056)
-- Name: Inscripcions Inscripcions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inscripcions"
    ADD CONSTRAINT "Inscripcions_pkey" PRIMARY KEY (id);


--
-- TOC entry 4719 (class 2606 OID 21020)
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- TOC entry 4726 (class 2606 OID 21057)
-- Name: Inscripcions Inscripcions_CursoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inscripcions"
    ADD CONSTRAINT "Inscripcions_CursoId_fkey" FOREIGN KEY ("CursoId") REFERENCES public."Cursos"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4727 (class 2606 OID 21062)
-- Name: Inscripcions Inscripcions_EstudianteId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inscripcions"
    ADD CONSTRAINT "Inscripcions_EstudianteId_fkey" FOREIGN KEY ("EstudianteId") REFERENCES public."Estudiantes"(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2025-05-25 23:26:24

--
-- PostgreSQL database dump complete
--

