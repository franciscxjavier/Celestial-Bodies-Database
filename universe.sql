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

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    shape text NOT NULL,
    is_active boolean NOT NULL,
    group_type text,
    unicode_id text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


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
    name character varying NOT NULL,
    is_closest_to_the_earth boolean NOT NULL,
    orbit_type text NOT NULL,
    planet_id integer,
    size integer NOT NULL,
    unicode_id text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


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
    name character varying NOT NULL,
    is_bigger_than_the_sun boolean NOT NULL,
    unicode_id text NOT NULL,
    star_id integer,
    size integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    plane_type_id integer NOT NULL,
    name character varying NOT NULL,
    planet_type_group character varying,
    unicode_id text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_plane_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_plane_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_plane_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_plane_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_plane_type_id_seq OWNED BY public.planet_type.plane_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years numeric,
    is_bigger_than_the_sun boolean NOT NULL,
    system_type text NOT NULL,
    galaxy_id integer,
    unicode_id text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type plane_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN plane_type_id SET DEFAULT nextval('public.planet_type_plane_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'ESO 325-G004', 'Elliptical', true, 'Cluster', NULL);
INSERT INTO public.galaxy VALUES (2, 'M101', 'Spiral', true, 'Cluster', NULL);
INSERT INTO public.galaxy VALUES (3, 'NGC 1569', 'Irregular', true, 'Cluster', NULL);
INSERT INTO public.galaxy VALUES (4, '3C 244.1', 'Elliptical', true, 'Cluster', NULL);
INSERT INTO public.galaxy VALUES (5, 'NGC 1345', 'Spiral', true, 'Cluster', NULL);
INSERT INTO public.galaxy VALUES (6, 'UGC 4459', 'Irregular', true, 'Cluster', NULL);
INSERT INTO public.galaxy VALUES (7, 'Milky Way', 'Spiral', true, 'Group', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', true, 'Regular', 1, 1737, NULL);
INSERT INTO public.moon VALUES (2, 'Moon 2', false, 'Regular', 2, 1200, NULL);
INSERT INTO public.moon VALUES (4, 'Moon 4', false, 'Regular', 4, 1400, NULL);
INSERT INTO public.moon VALUES (5, 'Moon 5', false, 'Regular', 5, 1500, NULL);
INSERT INTO public.moon VALUES (6, 'Moon 6', false, 'Regular', 6, 1600, NULL);
INSERT INTO public.moon VALUES (7, 'Moon', true, 'Regular', 3, 1737, NULL);
INSERT INTO public.moon VALUES (3, 'Moon 3', false, 'Regular', 1, 1300, NULL);
INSERT INTO public.moon VALUES (8, 'Moon 8', true, 'Regular', 8, 1000, NULL);
INSERT INTO public.moon VALUES (9, 'Moon 9', true, 'Regular', 9, 1100, NULL);
INSERT INTO public.moon VALUES (10, 'Moon 10', true, 'Regular', 10, 1100, NULL);
INSERT INTO public.moon VALUES (11, 'Moon 11', true, 'Regular', 11, 1110, NULL);
INSERT INTO public.moon VALUES (12, 'Moon 12', true, 'Regular', 12, 1210, NULL);
INSERT INTO public.moon VALUES (13, 'Moon 13', true, 'Irregular', 1, 1210, NULL);
INSERT INTO public.moon VALUES (14, 'Moon 14', true, 'Irregular', 2, 1210, NULL);
INSERT INTO public.moon VALUES (16, 'Moon 16', true, 'Irregular', 4, 1233, NULL);
INSERT INTO public.moon VALUES (17, 'Moon 17', true, 'Irregular', 4, 1233, NULL);
INSERT INTO public.moon VALUES (18, 'Moon 18', true, 'Irregular', 5, 1233, NULL);
INSERT INTO public.moon VALUES (19, 'Moon 19', true, 'Irregular', 6, 1631, NULL);
INSERT INTO public.moon VALUES (20, 'Moon 20', true, 'Irregular', 6, 1973, NULL);
INSERT INTO public.moon VALUES (15, 'Moon 15', true, 'Irregular', 9, 1210, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 'U+263F', 7, 2440);
INSERT INTO public.planet VALUES (2, 'Venus', false, 'U+2640', 7, 6052);
INSERT INTO public.planet VALUES (3, 'Earth', false, 'U+1F728', 7, 6371);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'U+2642', 7, 3390);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'U+2643', 7, 69911);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'U+2644', 7, 58232);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'U+26E2', 7, 25362);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'U+2646', 7, 24622);
INSERT INTO public.planet VALUES (9, 'Earth', false, 'U+2641', 7, 6371);
INSERT INTO public.planet VALUES (10, 'Uranus', false, 'U+2645', 7, 25362);
INSERT INTO public.planet VALUES (11, 'Neptune', false, 'U+2BC9', 7, 24622);
INSERT INTO public.planet VALUES (12, 'Gliese 876d', false, '', 7, 250500);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Rocky', 'Terrestrial', NULL);
INSERT INTO public.planet_type VALUES (2, 'Hydrogen, Gas, Ice', 'Giant', NULL);
INSERT INTO public.planet_type VALUES (3, 'Small', 'Dwarf', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star ESO 325-G004', 463, true, 'Cluster', 1, NULL);
INSERT INTO public.star VALUES (2, 'Star M101', 21, true, 'Cluster', 2, NULL);
INSERT INTO public.star VALUES (4, 'Star NGC 1569', 1000, true, 'Group', 3, NULL);
INSERT INTO public.star VALUES (5, 'Star ESO 325-G004', 463, true, 'Group', 1, NULL);
INSERT INTO public.star VALUES (6, 'Star M101', 21, true, 'Group', 2, NULL);
INSERT INTO public.star VALUES (7, 'Star Milky Way', 1000, true, 'Group', 3, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_type_plane_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_plane_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unicode_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unicode_id_key UNIQUE (unicode_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unicode_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unicode_id_key UNIQUE (unicode_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (plane_type_id);


--
-- Name: planet_type planet_type_unicode_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_unicode_id_key UNIQUE (unicode_id);


--
-- Name: planet planet_unicode_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unicode_id_key UNIQUE (unicode_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unicode_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unicode_id_key UNIQUE (unicode_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

