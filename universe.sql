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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    part_of_galaxy character varying(30)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_cons_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_cons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_cons_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_cons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_cons_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_type character varying(30),
    name character varying(30) NOT NULL,
    num_of_stars_in_mil integer,
    size_in_lightyears integer,
    description text NOT NULL
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
    planet_id integer,
    name character varying(30) NOT NULL,
    size_in_km integer NOT NULL,
    has_atmosphere boolean,
    distance_to_planet_km integer
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
    star_id integer,
    name character varying(30) NOT NULL,
    size_mil_sq_km integer,
    distance_to_earth_mil_km integer NOT NULL,
    has_life boolean,
    num_of_rings integer,
    is_spherical boolean
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
    galaxy_id integer,
    name character varying(30) NOT NULL,
    star_type character varying(30) NOT NULL,
    size_in_mil_km numeric
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_cons_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 1, 'Orion', 'Milky Way');
INSERT INTO public.constellation VALUES (2, 1, 'Ursa Major', 'Milky Way');
INSERT INTO public.constellation VALUES (3, 2, 'Andromeda', 'Andromeda Galaxy');
INSERT INTO public.constellation VALUES (4, 3, 'Triangulum', 'Triangulum Galaxy');
INSERT INTO public.constellation VALUES (5, 1, 'Puppis', 'Milky Way');
INSERT INTO public.constellation VALUES (6, 1, 'Carina', 'Milky Way');
INSERT INTO public.constellation VALUES (7, 1, 'Centaurus', 'Milky Way');
INSERT INTO public.constellation VALUES (8, 1, 'Crux', 'Milky Way');
INSERT INTO public.constellation VALUES (9, 1, 'Scorpius', 'Milky Way');
INSERT INTO public.constellation VALUES (10, 1, 'Sagittarius', 'Milky Way');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Spiral', 'Milky Way', 400, 100000, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Spiral', 'Andromeda', 1000, 220000, 'Our nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Elliptical', 'M87', 100, 150000, 'A small elliptical galaxy');
INSERT INTO public.galaxy VALUES (4, 'Spiral', 'Triangulum', 20, 30000, 'A small spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Irregular', 'Large Megallanic Cloud', 10, 160000, 'A satellite galaxy of the Milky Way');
INSERT INTO public.galaxy VALUES (6, 'Spiral', 'NGC 1365', 100, 200000, 'A spiral galaxy in the constellation Fornax');
INSERT INTO public.galaxy VALUES (7, 'Irregular', 'Small Megallanic Cloud', 1, 20000, 'A satellite galaxy of the Milky Way');
INSERT INTO public.galaxy VALUES (8, 'Spiral', 'NGC 4565', 100, 100000, 'A spiral galaxy in the constellation Coma Berenices');
INSERT INTO public.galaxy VALUES (9, 'Elliptical', 'M100', 100, 150000, 'A giant elliptical galaxy in the constellation Ursa Major');
INSERT INTO public.galaxy VALUES (10, 'Spiral', 'NGC 300', 10, 100000, 'A spiral galaxy in the constellation Sculptor');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 3474, false, 384400);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 22, false, 9377);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 13, false, 23460);
INSERT INTO public.moon VALUES (4, 5, 'Io', 3660, false, 421680);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 3122, false, 671846);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 5268, false, 1070400);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 4821, false, 1882700);
INSERT INTO public.moon VALUES (8, 6, 'Titan', 5150, true, 1221600);
INSERT INTO public.moon VALUES (9, 6, 'Rhea', 1552, false, 527800);
INSERT INTO public.moon VALUES (10, 6, 'Iapetus', 1479, false, 3560800);
INSERT INTO public.moon VALUES (11, 6, 'Tethys', 1066, false, 294600);
INSERT INTO public.moon VALUES (12, 6, 'Dione', 1127, false, 560800);
INSERT INTO public.moon VALUES (13, 7, 'Ariel', 1160, false, 191000);
INSERT INTO public.moon VALUES (14, 7, 'Miranda', 578, false, 129000);
INSERT INTO public.moon VALUES (15, 7, 'Umbriel', 1170, false, 255500);
INSERT INTO public.moon VALUES (16, 7, 'Titania', 1578, false, 436000);
INSERT INTO public.moon VALUES (17, 7, 'Oberon', 1526, false, 583200);
INSERT INTO public.moon VALUES (18, 8, 'Triton', 2706, true, 354800);
INSERT INTO public.moon VALUES (19, 8, 'Proteus', 400, false, 117600);
INSERT INTO public.moon VALUES (20, 8, 'Nereid', 170, false, 5500000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 510, 0, true, 0, true);
INSERT INTO public.planet VALUES (2, 1, 'Mercury', 156, 58, false, 0, true);
INSERT INTO public.planet VALUES (3, 1, 'Venus', 4600, 108, false, 0, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 145, 228, false, 0, true);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 139820, 778, false, 7, true);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 568850, 1429, false, 8, true);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 868800, 2871, false, 2, true);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 1024700, 4495, false, 4, true);
INSERT INTO public.planet VALUES (9, 4, 'Proxima Centauri', 1290, 401100, false, 0, true);
INSERT INTO public.planet VALUES (10, 3, 'Beta Pictoris b', 1429, 596000, false, 0, true);
INSERT INTO public.planet VALUES (11, 4, '70 Ophiuchi b', 6486, 605500, false, 0, true);
INSERT INTO public.planet VALUES (12, 10, 'NGC 1365-1', 6486, 1987000, false, 0, true);
INSERT INTO public.planet VALUES (13, 8, 'R13a1b', 64860, 154200, false, 0, true);
INSERT INTO public.planet VALUES (14, 9, 'TYC 9486-92-1', 6486, 1949000, false, 0, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'G-type main sequence star', 1400000);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 'M-type red dwarf', 1295);
INSERT INTO public.star VALUES (3, 1, 'Rigel', 'B-type supergiant', 79000);
INSERT INTO public.star VALUES (4, 1, 'Betelguese', 'M-type red supergiant', 1420);
INSERT INTO public.star VALUES (5, 5, 'S Doradus', 'LBV hypergiant', 30000000);
INSERT INTO public.star VALUES (6, 1, 'Alpha Centauri A', 'G-type main sequence star', 1200000);
INSERT INTO public.star VALUES (7, 1, 'Alpha Centauri B', 'K-type main sequence star', 1100000);
INSERT INTO public.star VALUES (8, 5, 'Large Magellanic Cloud', 'O-type blue supergiant', 300000);
INSERT INTO public.star VALUES (9, 7, 'Small Magellanic Cloud', 'B-type main-sequence star', 1400000);
INSERT INTO public.star VALUES (10, 6, 'NGC 1365', 'O-type blue supergiant', 300000);


--
-- Name: constellation_cons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_cons_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

