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
9	mark justin gallardo	markgallardo1221@gmail.com	intermediate	asdasdasdasd	qweqweqwe
10	mark justin gallardo	markgallardo1221@gmail.com	intermediate	qweqwe	qweqwe
11	mark justin gallardo	markgallardo1221@gmail.com	intermediate	https://ca.slack-edge.com/T1EHQUJ8J-U016NP1639T-9d2bb904061b-512	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap 
12	mark justin gallardo	markgallardo1221@gmail.com	beginner	https://ca.slack-edge.com/T1EHQUJ8J-U016NP1639T-9d2bb904061b-512	hello 
13	mark justin gallardo	markgallardo1221@gmail.com	beginner	https://ca.slack-edge.com/T1EHQUJ8J-U016NP1639T-9d2bb904061b-512	hey there
14	mark justin gallardo	markgallardo1221@gmail.com	beginner	https://ca.slack-edge.com/T1EHQUJ8J-U016NP1639T-9d2bb904061b-512	asdasdqwe
15	kira	kirabud@gaymail.com	expert	data:image/jpeg;base64,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	im a good bud but poops everywhere
16	mark justin gallardo	qweqwe	intermediate	qweqwe	qweqweqw
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

SELECT pg_catalog.setval('public."event_eventId_seq"', 36, true);


--
-- Name: profile_profileId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."profile_profileId_seq"', 16, true);


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

