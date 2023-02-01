--
-- PostgreSQL database dump
--
-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
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
DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--
CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';
ALTER DATABASE universe OWNER TO freecodecamp;
\ connect universe
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
-- Name: constelacao; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.constelacao (
    constelacao_id integer NOT NULL,
    name character varying(170),
    estrelas integer NOT NULL
);
ALTER TABLE public.constelacao OWNER TO freecodecamp;
--
-- Name: constelacao_constelacao_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.constelacao_constelacao_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.constelacao_constelacao_id_seq OWNER TO freecodecamp;
--
-- Name: constelacao_constelacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.constelacao_constelacao_id_seq OWNED BY public.constelacao.constelacao_id;
--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    constelacao text,
    distancia_em_kpc numeric,
    ano integer,
    name character varying(150) NOT NULL,
    espiral boolean NOT NULL,
    eliptica boolean NOT NULL,
    irregular boolean NOT NULL
);
ALTER TABLE public.galaxy OWNER TO freecodecamp;
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;
--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(150),
    diametro numeric NOT NULL,
    ano_descoberta integer,
    planet_id integer
);
ALTER TABLE public.moon OWNER TO freecodecamp;
--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;
--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;
--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(150),
    diametro numeric NOT NULL,
    possui_aneis boolean NOT NULL,
    tipo_planeta text,
    satelites_naturais integer,
    star_id integer
);
ALTER TABLE public.planet OWNER TO freecodecamp;
--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;
--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;
--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(150),
    tipo_estrela text NOT NULL,
    magnitude numeric,
    constelacao text,
    galaxy_id integer
);
ALTER TABLE public.star OWNER TO freecodecamp;
--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;
--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;
--
-- Name: constelacao constelacao_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.constelacao
ALTER COLUMN constelacao_id
SET DEFAULT nextval(
        'public.constelacao_constelacao_id_seq'::regclass
    );
--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.galaxy
ALTER COLUMN galaxy_id
SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);
--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
ALTER COLUMN moon_id
SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);
--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.planet
ALTER COLUMN planet_id
SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);
--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ALTER COLUMN star_id
SET DEFAULT nextval('public.star_star_id_seq'::regclass);
--
-- Data for Name: constelacao; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.constelacao
VALUES (1, 'andromeda', 999);
INSERT INTO public.constelacao
VALUES (2, 'aquarius', 2);
INSERT INTO public.constelacao
VALUES (3, 'apus', 80);
INSERT INTO public.constelacao
VALUES (4, 'centaurus', 280);
INSERT INTO public.constelacao
VALUES (5, 'sagitarius', 12);
INSERT INTO public.constelacao
VALUES (6, 'carina', 9);
--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.galaxy
VALUES (
        1,
        'sagittarius',
        0,
        1,
        'via lactea',
        true,
        false,
        false
    );
INSERT INTO public.galaxy
VALUES (
        2,
        'dorado/mensa',
        50,
        1520,
        'grande nuvem magalhaes',
        false,
        false,
        true
    );
INSERT INTO public.galaxy
VALUES (
        3,
        'tucana',
        60,
        1520,
        'pequena nuvem magalhaes',
        false,
        false,
        true
    );
INSERT INTO public.galaxy
VALUES (
        4,
        'andromeda',
        780,
        1786,
        'galaxia de andromeda',
        true,
        false,
        false
    );
INSERT INTO public.galaxy
VALUES (
        5,
        'triangulum',
        900,
        1654,
        'galaxia do triangulo',
        true,
        false,
        false
    );
INSERT INTO public.galaxy
VALUES (
        6,
        'centaurus',
        14,
        1826,
        'centaurus a',
        true,
        false,
        false
    );
INSERT INTO public.galaxy
VALUES (
        7,
        'ursa major',
        4,
        1774,
        'galaxia de bode',
        true,
        false,
        false
    );
--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.moon
VALUES (1, 'lua', 27.32, 1, NULL);
INSERT INTO public.moon
VALUES (2, 'fobos', 0.319, 1877, NULL);
INSERT INTO public.moon
VALUES (3, 'deimos', 1.262, 1877, NULL);
INSERT INTO public.moon
VALUES (4, 'ganimedes', 7.155, 1610, NULL);
INSERT INTO public.moon
VALUES (5, 'europa', 3.551, 1610, NULL);
INSERT INTO public.moon
VALUES (6, 'calisto', 16.69, 1610, NULL);
INSERT INTO public.moon
VALUES (7, 'amalteia', 0.498, 1892, NULL);
INSERT INTO public.moon
VALUES (8, 'himalaia', 250.56, 1904, NULL);
INSERT INTO public.moon
VALUES (9, 'elara', 259.64, 1905, NULL);
INSERT INTO public.moon
VALUES (10, 'leda', 240.92, 1974, NULL);
INSERT INTO public.moon
VALUES (11, 'mimas', 0.942, 1789, NULL);
INSERT INTO public.moon
VALUES (42, 'tetis', 1.888, 1684, NULL);
INSERT INTO public.moon
VALUES (43, 'dione', 2.737, 1684, NULL);
INSERT INTO public.moon
VALUES (44, 'jano', 0.695, 1966, NULL);
INSERT INTO public.moon
VALUES (45, 'epitemeu', 0.694, 1980, NULL);
INSERT INTO public.moon
VALUES (46, 'helene', 2.737, 1980, NULL);
INSERT INTO public.moon
VALUES (47, 'telesto', 1.888, 1980, NULL);
INSERT INTO public.moon
VALUES (48, 'calipso', 1.888, 1980, NULL);
INSERT INTO public.moon
VALUES (49, 'ariel', 2.520, 1851, NULL);
INSERT INTO public.moon
VALUES (50, 'umbriel', 4.144, 1851, NULL);
--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.planet
VALUES (
        9,
        'amateru',
        1.18,
        false,
        'extrasolar',
        NULL,
        NULL
    );
INSERT INTO public.planet
VALUES (
        10,
        'taphao thong',
        2.20,
        false,
        'extrasolar',
        NULL,
        NULL
    );
INSERT INTO public.planet
VALUES (
        11,
        'taphao kaew',
        3.36,
        false,
        'extrasolar',
        NULL,
        NULL
    );
INSERT INTO public.planet
VALUES (
        12,
        'arkas',
        0.81,
        false,
        'extrasolar',
        NULL,
        NULL
    );
INSERT INTO public.planet
VALUES (1, 'mercurio', 0.383, false, 'terrestre', 0, 1);
INSERT INTO public.planet
VALUES (2, 'venus', 0.949, false, 'terrestre', 0, 1);
INSERT INTO public.planet
VALUES (3, 'terra', 1.0, false, 'terrestre', 1, 1);
INSERT INTO public.planet
VALUES (4, 'marte', 0.532, false, 'terrestre', 2, 1);
INSERT INTO public.planet
VALUES (
        5,
        'jupiter',
        11.209,
        true,
        'gigante gasoso',
        79,
        1
    );
INSERT INTO public.planet
VALUES (
        6,
        'saturno',
        9.449,
        true,
        'gigante gasoso',
        82,
        1
    );
INSERT INTO public.planet
VALUES (7, 'urano', 4.007, true, 'gigante gasoso', 27, 1);
INSERT INTO public.planet
VALUES (
        8,
        'netuno',
        3.883,
        true,
        'gigante gasoso',
        14,
        1
    );
--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.star
VALUES (2, 'sirius', 'A1V', -1.46, 'cao maior', NULL);
INSERT INTO public.star
VALUES (3, 'canopus', 'A9', -0.74, 'quilha', NULL);
INSERT INTO public.star
VALUES (5, 'arcturus', 'A0', -0.05, 'boieiro', NULL);
INSERT INTO public.star
VALUES (6, 'vega', 'A0', 0.03, 'lira', NULL);
INSERT INTO public.star
VALUES (1, 'sol', 'G2', -26.74, 'nenhuma', 1);
INSERT INTO public.star
VALUES (4, 'alpha centauri', 'G2', -0.27, 'centauro', 6);
--
-- Name: constelacao_constelacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.constelacao_constelacao_id_seq', 6, true);
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);
--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.moon_moon_id_seq', 50, true);
--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);
--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);
--
-- Name: constelacao constelacao_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.constelacao
ADD CONSTRAINT constelacao_pkey PRIMARY KEY (constelacao_id);
--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.galaxy
ADD CONSTRAINT galaxy_name_key UNIQUE (name);
--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.galaxy
ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);
--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
ADD CONSTRAINT moon_name_key UNIQUE (name);
--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);
--
-- Name: constelacao name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.constelacao
ADD CONSTRAINT name_unique UNIQUE (name);
--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.planet
ADD CONSTRAINT planet_name_key UNIQUE (name);
--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.planet
ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);
--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ADD CONSTRAINT star_name_key UNIQUE (name);
--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);
--
-- Name: star galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ADD CONSTRAINT galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);
--
-- Name: moon planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
ADD CONSTRAINT planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);
--
-- Name: planet star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.planet
ADD CONSTRAINT star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);
--
-- PostgreSQL database dump complete
--