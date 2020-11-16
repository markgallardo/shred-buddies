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
4	hello there	1	2	2020-11-10	2020-11-15
12	asdfasfd	1	0	2020-11-12	2020-11-14
13	hello mark	1	0	2020-11-28	2020-11-29
15	fadfsad	2	2	2020-11-11	2020-11-19
16	fsadfsadfasdf	2	6	2020-11-17	2020-11-24
17	asdfasdfsa	1	6	2020-11-15	2020-11-17
18	it is saturday night	1	5	2020-11-22	2020-11-23
19	dsgfadg	1	6	2020-11-24	2020-11-24
20	dasdfasdf	1	6	2020-11-17	2020-11-19
21	re	1	7	2020-11-24	2020-11-25
22	dfasdfsadf	1	6	2020-11-17	2020-11-25
23	fasdfsaf	1	5	2020-11-15	2020-11-17
24	dsafsaf	1	6	2020-11-17	2020-11-17
25	yo yo	1	2	2020-11-01	2020-11-02
26	afasdfafdafdas	1	3	2020-11-17	2020-11-18
27	dasdfasdf	1	6	2020-11-17	2020-11-25
28	dadsfsadfs	1	2	2020-11-17	2020-11-27
29	lollllllllllll	1	6	2020-11-24	2020-11-24
30	qqqqqqqqqqqqqqq	1	2	2020-11-17	2020-11-20
31	dfgadfadgds	1	6	2020-11-17	2020-11-24
32	eqtrewrteqrte	1	6	2020-11-17	2020-11-20
33	dfasdfs	1	6	2020-11-10	2020-11-11
34	adfgdgfd	1	6	2020-11-17	2020-11-24
35	fadsf	1	6	2020-11-24	2020-11-18
36	dasfsadf	1	5	2020-11-24	2020-11-24
37	vbczb	1	6	2020-11-24	2020-11-24
38	dfasdfsadfsadfsadfsadfsafsadfsafsa	1	6	2020-11-24	2020-11-25
39	dadadsf	1	6	2020-11-24	2020-11-25
40	sfhrh	1	6	2020-11-23	2020-11-24
41	i like to eat fried chicken	1	6	2020-11-02	2020-11-04
42	dadfadf	1	6	2020-11-24	2020-11-24
43	dasdfad	2	6	2020-11-23	2020-11-25
44	fasdfasdf	1	5	2020-11-16	2020-11-17
45	dadfasdfa	1	6	2020-11-17	2020-11-19
46	dadsfasdfasfda	1	6	2020-11-24	2020-11-24
47	fffffffffffffffffffffffffff	1	6	2020-11-17	2020-11-24
48	dfasdfasdfasdfasdfasdfa	1	6	2020-11-17	2020-12-01
49	i like fried chicken	1	6	2020-11-24	2020-11-24
50	ooooooooooooooooooooo	1	3	2020-11-17	2020-11-26
51	99999999999999999999999999999	1	6	2020-11-30	2020-12-04
52	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	7	2020-11-17	2020-12-02
53	first thing in the morning	1	3	2020-11-16	2020-11-19
54	gdsasdfadsfdf	1	6	2020-11-17	2020-11-17
55	dasdfadsf	1	5	2020-11-17	2020-11-17
56	lkjlklkl	2	3	2020-11-17	2020-11-18
57	sdfg	2	5	2020-11-17	2020-11-19
58	dsafsadf	2	3	2020-11-16	2020-11-17
59	sdafsadf	2	6	2020-11-17	2020-11-18
61	dsfsadfasfdf	1	6	2020-11-17	2020-11-19
62	adsfsadfsadfsadfsadfsafdsafdsadfsaf	1	6	2020-11-16	2020-11-17
63	lllll	1	5	2020-11-17	2020-11-17
64	dsfds	1	5	2020-11-16	2020-11-18
65	pppppp	1	6	2020-11-17	2020-11-17
66	qqqq	1	6	2020-11-16	2020-11-17
67	qqqq	1	5	2020-11-17	2020-11-19
68	cdfdf	1	5	2020-11-17	2020-11-18
69	qqqqq	1	6	2020-11-17	2020-11-17
70	vvvvv	1	5	2020-11-17	2020-11-19
71	uuuu	1	6	2020-11-24	2020-11-20
72	vvvv	1	5	2020-11-17	2020-11-20
73	qqqq	2	6	2020-11-18	2020-11-20
74	ssss	2	5	2020-11-17	2020-11-19
75	q22	1	5	2020-11-17	2020-11-19
76	bbb	1	6	2020-11-17	2020-11-19
77	dfafd	1	6	2020-11-17	2020-11-17
78	qqq	1	6	2020-11-17	2020-11-21
79	bbbbb	2	5	2020-11-18	2020-11-20
80	bbbbbbb	1	5	2020-11-17	2020-11-19
81	sadfsfd	1	6	2020-11-17	2020-11-17
82	dfasdf	1	6	2020-11-16	2020-11-17
83	sadfsfd	2	6	2020-11-17	2020-11-25
84	wwwww	1	6	2020-11-17	2020-11-19
85	bbbbbbb	2	5	2020-11-17	2020-11-19
86	gadsdfasdf	1	5	2020-11-24	2020-11-24
87	werwrew	1	6	2020-11-17	2020-11-17
88	bbb	1	5	2020-11-17	2020-11-18
100	gg	1	5	2020-11-17	2020-11-26
105	We would like to leave first thing in the morning.	1	5	2020-11-16	2020-11-18
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

SELECT pg_catalog.setval('public."event_eventId_seq"', 105, true);


--
-- Name: profile_profileId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."profile_profileId_seq"', 64, true);


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

