--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean NOT NULL,
    description text,
    galaxy_type character varying(50)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_clusters; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_clusters (
    galaxy_clusters_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    number_of_galaxies integer,
    galaxy_id integer NOT NULL,
    distance_from_earth integer NOT NULL
);


ALTER TABLE public.galaxy_clusters OWNER TO freecodecamp;

--
-- Name: galaxy_clusters_galaxy_clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_clusters_galaxy_clusters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_clusters_galaxy_clusters_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_clusters_galaxy_clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_clusters_galaxy_clusters_id_seq OWNED BY public.galaxy_clusters.galaxy_clusters_id;


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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    is_inhabitable boolean,
    diameter numeric,
    has_rings boolean
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    distance_from_star numeric NOT NULL,
    planet_type character varying(50)
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    size numeric,
    is_spherical boolean,
    distance_from_earth integer NOT NULL
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
-- Name: galaxy_clusters galaxy_clusters_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_clusters ALTER COLUMN galaxy_clusters_id SET DEFAULT nextval('public.galaxy_clusters_galaxy_clusters_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, true, 'A spiral galaxy containing the Solar System', 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, false, 'A spiral galaxy neighboring the Milky Way', 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 13000, false, 'A massive elliptical galaxy in the Virgo Cluster', 'Elliptical');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 10000, false, 'A famous elliptical galaxy in the Virgo Cluster', 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 12000, false, 'An elliptical galaxy that has been distorted by a past collision with a smaller galaxy', 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 12000, false, 'One of the most prominent galaxies visible from Earth', 'Spiral');


--
-- Data for Name: galaxy_clusters; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_clusters VALUES (1, 'Virgo Cluster', 'A large cluster of galaxies located near the center of Laniakea supercluster', 1300, 3, 50000000);
INSERT INTO public.galaxy_clusters VALUES (2, 'Coma Cluster', 'A large cluster of galaxies located in the constellation of Coma Berencies', 1000, 4, 30000000);
INSERT INTO public.galaxy_clusters VALUES (3, 'Fornax Cluster', 'A smaller galaxy cluster located in the Fornax constellation', 60, 2, 65000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 3474, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, 22, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, 12, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, false, 3643, false);
INSERT INTO public.moon VALUES (5, 'Europa', 3, false, 3122, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, false, 5268, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, false, 4800, false);
INSERT INTO public.moon VALUES (8, 'Titan', 4, false, 5150, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, false, 1528, true);
INSERT INTO public.moon VALUES (10, 'Enceladus', 4, false, 504, true);
INSERT INTO public.moon VALUES (11, 'Iapetus', 4, false, 1469, true);
INSERT INTO public.moon VALUES (12, 'Triton', 5, false, 2706, true);
INSERT INTO public.moon VALUES (13, 'Charon', 6, false, 1212, false);
INSERT INTO public.moon VALUES (14, 'Mimas', 4, false, 396, true);
INSERT INTO public.moon VALUES (15, 'Hyperion', 4, false, 360, true);
INSERT INTO public.moon VALUES (16, 'Miranda', 5, false, 471, true);
INSERT INTO public.moon VALUES (17, 'Ariel', 5, false, 1157, true);
INSERT INTO public.moon VALUES (18, 'Umbriel', 5, false, 1170, true);
INSERT INTO public.moon VALUES (19, 'Rannoch', 1, true, 13000, false);
INSERT INTO public.moon VALUES (20, 'Omega', 10, false, 8000, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 1.0, 'Terrestial');
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 1.52, 'Terrestial');
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 0.72, 'Terrestial');
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, false, 5.2, 'Gas Giant');
INSERT INTO public.planet VALUES (5, 'Saturn', 1, false, 9.58, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Uranus', 1, false, 19.2, 'Ice Giant');
INSERT INTO public.planet VALUES (7, 'Neptune', 1, false, 30.1, 'Ice Giant');
INSERT INTO public.planet VALUES (8, 'Mercury', 1, false, 0.39, 'Terrestial');
INSERT INTO public.planet VALUES (9, 'Pluto', 1, false, 39.5, 'Dwarf Planet');
INSERT INTO public.planet VALUES (10, 'Thessia', 1, true, 94861650, 'Terrestial');
INSERT INTO public.planet VALUES (11, 'Palaven', 1, true, 53753935, 'Terrestial');
INSERT INTO public.planet VALUES (12, 'Sur''Kesh', 1, true, 37945635, 'Terrestial');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, true, 0);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 1.71, true, 9);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 1.5, true, 4);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 10.0, true, 643);
INSERT INTO public.star VALUES (5, 'Rigel', 3, 21.0, true, 860);
INSERT INTO public.star VALUES (6, 'Arcturus', 3, 26.4, true, 37);


--
-- Name: galaxy_clusters_galaxy_clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_clusters_galaxy_clusters_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_clusters galaxy_clusters_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_clusters
    ADD CONSTRAINT galaxy_clusters_name_key UNIQUE (name);


--
-- Name: galaxy_clusters galaxy_clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_clusters
    ADD CONSTRAINT galaxy_clusters_pkey PRIMARY KEY (galaxy_clusters_id);


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
-- Name: galaxy_clusters galaxy_clusters_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_clusters
    ADD CONSTRAINT galaxy_clusters_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

