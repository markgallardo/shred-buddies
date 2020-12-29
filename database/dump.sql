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
163	we are excited!	3	9	2020-12-29	2020-12-31
164	next year will be a better year	3	6	2021-01-06	2021-01-07
165	I miss shredding	1	9	2020-12-29	2021-01-01
166	2020 has been a crazy year!	1	5	2020-12-29	2021-01-01
167	lol	2	3	2020-12-14	2020-12-18
168	what is going on	3	10	2021-01-04	2021-01-07
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
9	Jason Gonzales	jasongonzo25@gmail.com	expert	dfadf	dfdfasfasdf
10	Kobe Bryant	jasongonzo25@gmail.com	beginner	dfadf	dfasfd
11	Jason Gonzales	jasongonzo25@gmail.com	expert	img url	frffff
12	Jason Gonzales	jasongonzo25@gmail.com	expert	fff	fff
13	Jason Gonzales	jasongonzo25@gmail.com	intermediate	fdgfd	ll
14	dfadf	dfadf	expert	adf	dfadsf
15	Jason Gonzales	jasongonzo25@gmail.com	expert	asdfafd	dfsaf
16	Jason Gonzales	jasongonzo25@gmail.com	expert	img url	llll
17	Jason Gonzales	jasongonzo25@gmail.com	expert	xZxc	cccc
18	Jason Gonzales	jasongonzo25@gmail.com	expert	asdfafd	ll
19	Jason Gonzales	jasongonzo25@gmail.com	expert	df	sadffd
20	Jason Gonzales	jasongonzo25@gmail.com	expert	dfadf	dfadf
21	Jason Gonzales	jasongonzo25@gmail.com	expert	asdfsaf	i like bunny slopes
22	Jason Gonzales	jasongonzo25@gmail.com	expert	afd	dfasdf
23	Jason Gonzales	jasongonzo25@gmail.com	expert	ff	ffff
24	Jason Gonzales	jasongonzo25@gmail.com	expert	adf	dsaf
25	Jason Gonzales	jasongonzo25@gmail.com	expert	adf	daf
26	Jason Gonzales	jasongonzo25@gmail.com	expert	dfadf	fasdfasfd
27	Jason Gonzales	jasongonzo25@gmail.com	expert	adf	dfa
28	Jason Gonzales	jasongonzo25@gmail.com	expert	dsf	dfasdf
29	Jason Gonzales	jasongonzo25@gmail.com	expert	asdfsaf	asdfadsf
30	Jason Gonzales	jasongonzo25@gmail.com	expert	qewr	ewr
31	Jason Gonzales	jasongonzo25@gmail.com	expert	asdf	adfadsf
32	Jason Gonzales	jasongonzo25@gmail.com	expert	asdf	adsf
33	Jason Gonzales	jasongonzo25@gmail.com	expert	fasdf	asdfasdf
34	Mark Justin Gallardo	mj23@gmail.com	expert	https://ca.slack-edge.com/T1EHQUJ8J-U016NP1639T-9d2bb904061b-512	i like bunny slopes
35	Jason Gonzales	jasongonzo25@gmail.com	expert	adfa	asdfasdf
36	S			https://img.bleacherreport.net/img/images/photos/003/837/262/hi-res-898820109b89ef00942b098ff10379b6_crop_north.jpg?1573244951&w=3072&h=2048	
37	Steph Curry	stephcurrychampion@gmail.com	expert	https://img.bleacherreport.net/img/images/photos/003/837/262/hi-res-898820109b89ef00942b098ff10379b6_crop_north.jpg?1573244951&w=3072&h=2048	I like to shoot hoops and shred first thing in the morning. I like to go to Mammoth because of how big the runs are  and because its usually not as packed as the other resorts in California.
38	Jason Gonzales	jasongonzo25@gmail.com	beginner	dfadf	dsads
39	Jason Gonzales	jasongonzo25@gmail.com	beginner	dfasdf	sadfsadfsfd
40	Kobe Bryant	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	I like bunny slopes and big jumps.
41	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	sadfsadfdsf
42	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	jakdsjfksajfaslkjfksadjflksajfaksfjsafsafasfdjaskjfajfa;ldfjasfjkfjkdajflksajfakjfijfsakfjkdsajfkfkjsalf;safkasjf
43	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recentl
44	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	dasfdafaf
45	Jason Gonzales	jasongonzo25@gmail.com	expert	asdf	dsasd
46	Jason Gonzales	jasongonzo25@gmail.com	expert		
47	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	adsfadsfasdf
48	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	lasfhksadjfksajfsakdfjskdjfsalfjfjs;dlfjskjfaksdjfkdsjfksajfksajfdklsaj;flkjsakfjsakfjsakjfksajflksajflsajfksajfksajflksajffd
49	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	asdfasdfsadfasdfsadfasdfsadfsafsadfsafsa
50	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	dfasdfasdfsadfasdfasdf
51	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	dsfsdsadfsafd
52	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	fff
53				https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	
54				https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	
55				https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	
56				https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	
57	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	
58	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	fasdf
59	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	I love bunny slopes
60	Jason Gonzales	jasongonzo25@gmail.com	intermediate		dadf
61	Mark Justin Gallardo	mark@yahoo.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	I like bunny slopes
62	Jason Gonzales	jasongonzo25@gmail.com	beginner	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	I love coding and snowboarding at the same time.
63	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	cccc
64	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	vvvv
65	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	asdfasdfa
66	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	ffff
67	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	ooooo
68	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	l
69	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	fdfdf
70	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	dfsdf
71	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	dasfd
72	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	adfdsf
73	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	adsfadsf
74	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	I love coding and snowboarding
75	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	I love babyshee
76	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	I love to code and snowboard
77	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	ffdfdf
78	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	dfasdfd
79	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type spec
80	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unch
81	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unch
99	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	https://ca.slack-edge.com/T1EHQUJ8J-U016NP1639T-9d2bb904061b-512
82	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unch
83	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unch
84	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unch
85	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unch
86	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unch
87	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unch
88	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unch
89	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unch
90	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://ca.slack-edge.com/T1EHQUJ8J-U016NP1639T-9d2bb904061b-512	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen boo
91	Sunday	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	dfafdsadfasdfsafd
92	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	      console.log('this.props.profile',this.props.profile)\n
93	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen boo
94	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	   console.log('this.props.profile', this.props.profile);
95	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	    console.log('this.props.profile', this.props.profile);
96	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	    console.log('this.props.profile', this.props.profile);
97	Steph	curry@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen boo
98	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://ca.slack-edge.com/T1EHQUJ8J-U016NP1639T-9d2bb904061b-512	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen boo
100	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	I love to code and snowboard on the weekends
101	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-77f7d0cee7ba-512	i love to code and snowboard
102	Jason Gonzales	jasongonzo25@gmail.com	beginner	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-77f7d0cee7ba-512	i love snowboarding and coding
103	Jason Gonzales	jasongonzo25@gmail.com	intermediate		
104	Jason Gonzales	jasongonzo25@gmail.com	beginner	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-77f7d0cee7ba-512	i love coding and snowboarding
105	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	I like to board and code
106	Jason Gonzales	jasongonzo25@gmail.com	expert		
107	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	I love to eat
108	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	
109	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	dsfsafdasd
110				https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	
111				https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	
112	Jason Gonzales	jasongonzo25@gmail.com		https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	
113	Jason Gonzales	jasongonzo25@gmail.com			
114	Jason Gonzales	jasongonzo25@gmail.com			
115	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	dfadsfafd
116	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	dsafsadf
117	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	i like to eat
118	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	dafd
119	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	adfasdfasdfsadf
120	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in
121	Jason Gonzales	jasongonzo25@gmail.com	expert	asdfsaf	
122	Jason Gonzales	jasongonzo25@gmail.com	beginner	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	
123	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	dadasfadsfsadfsadf
124	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	dafdasdf
125	Jason Gonzales	jasongonzo25@gmail.com	intermediate	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	dafdadfadsf
126	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	I like to eat and snowboard. Then on my free time I like to code.
127				https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	
128				https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	
129	Jason Gonzales	jasongonzo25@gmail.com	expert	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	hello there team
130	Jason Gonzales	jasongonzo25@gmail.com	expert	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	dafdadsfadf
131	Jason Gonzales	jasongonzo25@gmail.com	expert	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	lets go shred and eat
132	Jason Gonzales	jasongonzo25@gmail.com		https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	
133	Jason Gonzales	jasongonzo25@gmail.com	expert	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	24242424242424
134	Jason Gonzales	jasongonzo25@gmail.com	expert	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	adfsadfas
135	Jason Gonzales	jasongonzo25@gmail.com	expert	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	I like boarding and food and coding!!!
136	Jason Gonzales	jasongonzo25@gmail.com	expert	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	I like to eat a lot
137	Jason Gonzales	jasongonzo25@gmail.com	expert	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	i like to eat a lot
138	Jason Gonzales	jasongonzo25@gmail.com	expert	https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200824175931-kobe-bryant-file.jpg	its almost new years so I really wanna go snowboarding very soon.
139	Jason Gonzales	jasongonzo25@gmail.com	expert	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	helloooo
140	Jason Gonzales	jasongonzo25@gmail.com	expert	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	I like to eat a lot
141	Jason Gonzales	jasongonzo25@gmail.com		https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	
142	Jason Gonzales	jasongonzo25@gmail.com	expert	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	its almost a new year
143	Jason Gonzales	jasongonzo25@gmail.com	expert	https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512	adfasdfafd
\.


--
-- Data for Name: resort; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.resort ("resortId", name, address, description, "imgUrl") FROM stdin;
2	Bear Mountain	43101 Goldmine Dr, Big Bear Lake, CA 92315	Bear Mountain, formerly Goldmine Mountain, is a ski area in Southern California, United States. When its neighbor, Snow Summit, bought Bear Mountain in 2002, the new entity, Big Bear Mountain Resorts, comprised the two, with a single lift ticket usable at both.	/images/big-bear.jpg
1	Mammoth Mountain	10001 Minaret Rd, Mammoth Lakes, CA 93546	Mammoth Mountain Ski Area is a large ski resort in the western United States, located in eastern California along the east side of the Sierra Nevada mountain range in the Inyo National Forest. Mammoth has more than 3,500 acres of ski-able terrain, serviced by 28 lift.	/images/mammoth-ski.jpg
3	Mountain High	 24510 CA-2, Wrightwood, CA 92397	Mountain High resort is a winter resort in the San Gabriel Mountains in Los Angeles County in California. Mountain High is one of the most-visited resorts in Southern California. The resort is located along State Route 2 west of Wrightwood, California.	/images/mountain-high.jpg
\.


--
-- Name: event_eventId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."event_eventId_seq"', 168, true);


--
-- Name: profile_profileId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."profile_profileId_seq"', 143, true);


--
-- Name: resort_resortId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."resort_resortId_seq"', 3, true);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

