--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)

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

ALTER TABLE IF EXISTS public.resort ALTER COLUMN "resortId" DROP DEFAULT;
ALTER TABLE IF EXISTS public.profile ALTER COLUMN "profileId" DROP DEFAULT;
ALTER TABLE IF EXISTS public.event ALTER COLUMN "eventId" DROP DEFAULT;
DROP SEQUENCE IF EXISTS public."resort_resortId_seq";
DROP TABLE IF EXISTS public.resort;
DROP SEQUENCE IF EXISTS public."profile_profileId_seq";
DROP TABLE IF EXISTS public.profile;
DROP SEQUENCE IF EXISTS public."event_eventId_seq";
DROP TABLE IF EXISTS public.event;
DROP TABLE IF EXISTS public.atendees;
DROP EXTENSION IF EXISTS plpgsql;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: atendees; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.atendees (
    "profileId" integer NOT NULL,
    "eventId" integer NOT NULL,
    "isConfirmed" boolean DEFAULT false NOT NULL,
    "isCheckedIn" boolean DEFAULT false NOT NULL
);


--
-- Name: event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event (
    "eventId" integer NOT NULL,
    description text NOT NULL,
    "resortId" integer NOT NULL,
    "profileId" integer NOT NULL,
    "startDate" date NOT NULL,
    "endDate" date NOT NULL
);


--
-- Name: event_eventId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."event_eventId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_eventId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."event_eventId_seq" OWNED BY public.event."eventId";


--
-- Name: profile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profile (
    "profileId" integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    skill text NOT NULL,
    "imgUrl" text NOT NULL,
    description text NOT NULL
);


--
-- Name: profile_profileId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."profile_profileId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profile_profileId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."profile_profileId_seq" OWNED BY public.profile."profileId";


--
-- Name: resort; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resort (
    "resortId" integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    description text NOT NULL,
    "imgUrl" text NOT NULL
);


--
-- Name: resort_resortId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."resort_resortId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resort_resortId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."resort_resortId_seq" OWNED BY public.resort."resortId";


--
-- Name: event eventId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event ALTER COLUMN "eventId" SET DEFAULT nextval('public."event_eventId_seq"'::regclass);


--
-- Name: profile profileId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profile ALTER COLUMN "profileId" SET DEFAULT nextval('public."profile_profileId_seq"'::regclass);


--
-- Name: resort resortId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resort ALTER COLUMN "resortId" SET DEFAULT nextval('public."resort_resortId_seq"'::regclass);


--
-- Data for Name: atendees; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.atendees ("profileId", "eventId", "isConfirmed", "isCheckedIn") FROM stdin;
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event ("eventId", description, "resortId", "profileId", "startDate", "endDate") FROM stdin;
1	looking for buddy to big bear	2	5	2020-11-20	2020-11-20
2	looking for buddy to big bear	2	5	2020-11-20	2020-11-20
\.


--
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.profile ("profileId", name, email, skill, "imgUrl", description) FROM stdin;
1	test	test	test	test	test
2	test	test	test	test	test
3	test	test	test	test	test
4	test	test	test	test	test
5	mark	someemail	beginner	https://static.wikia.nocookie.net/starwars/images/4/48/Chewbacca_TLJ.png/revision/latest?cb=20190830144754	i like bunny slope
6	mark	someemail	beginner	https://static.wikia.nocookie.net/starwars/images/4/48/Chewbacca_TLJ.png/revision/latest?cb=20190830144754	i like bunny slope
8	jason	jason25@gmail.com	intermediate	https://image.cnbcfm.com/api/v1/image/101524695-457220551.jpg?v=1395781183&w=1400&h=950	I also like bunny slopes
\.


--
-- Data for Name: resort; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.resort ("resortId", name, address, description, "imgUrl") FROM stdin;
2	Bear Mountain	43101 Goldmine Dr, Big Bear Lake, CA 92315	Bear Mountain, formerly Goldmine Mountain, is a ski area in Southern California, United States. When its neighbor, Snow Summit, bought Bear Mountain in 2002, the new entity, Big Bear Mountain Resorts, comprised the two, with a single lift ticket usable at both.	/images/big-bear.jpg
1	Mammoth Mountain	10001 Minaret Rd, Mammoth Lakes, CA 93546	Mammoth Mountain Ski Area is a large ski resort in the western United States, located in eastern California along the east side of the Sierra Nevada mountain range in the Inyo National Forest. Mammoth has more than 3,500 acres of ski-able terrain, serviced by 28 lift.	/images/mammoth-ski.jpg
\.


--
-- Name: event_eventId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."event_eventId_seq"', 2, true);


--
-- Name: profile_profileId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."profile_profileId_seq"', 8, true);


--
-- Name: resort_resortId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."resort_resortId_seq"', 2, true);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

