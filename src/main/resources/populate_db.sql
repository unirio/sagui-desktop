--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

-- Started on 2018-10-21 13:07:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2835 (class 0 OID 45310)
-- Dependencies: 202
-- Data for Name: disciplina_bsi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO disciplina_bsi VALUES (1, 60, 'TIN0054', 4, 'ATIVIDADES CURRICULARES DE EXTENSÃO 1', 1, 'ACE1', 0, 1);
INSERT INTO disciplina_bsi VALUES (2, 60, 'TIN0055', 4, 'ATIVIDADES CURRICULARES DE EXTENSÃO 2', 1, 'ACE2', 0, 1);
INSERT INTO disciplina_bsi VALUES (3, 60, 'TIN0056', 4, 'ATIVIDADES CURRICULARES DE EXTENSÃO 3', 1, 'ACE3', 0, 1);
INSERT INTO disciplina_bsi VALUES (4, 60, 'TIN0057', 4, 'ATIVIDADES CURRICULARES DE EXTENSÃO 4', 1, 'ACE4', 0, 1);
INSERT INTO disciplina_bsi VALUES (5, 60, 'TIN0117', 4, 'ADMINISTRAÇÃO FINANCEIRA', 1, 'DIS1', 0, 1);
INSERT INTO disciplina_bsi VALUES (6, 60, 'TME0015', 4, 'ÁLGEBRA LINEAR', 1, 'DIS2', 0, 1);
INSERT INTO disciplina_bsi VALUES (7, 60, 'TIN0118', 4, 'ANÁLISE DE ALGORITMO', 1, 'DIS3', 0, 1);
INSERT INTO disciplina_bsi VALUES (8, 60, 'TIN0115', 4, 'ANÁLISE DE SISTEMAS', 2, 'DIS4', 0, 1);
INSERT INTO disciplina_bsi VALUES (9, 60, 'TIN0013', 4, 'ANÁLISE EMPRESARIAL E ADMIN', 2, 'DIS5', 0, 1);
INSERT INTO disciplina_bsi VALUES (10, 60, 'TIN0120', 4, 'BANCO DE DADOS I', 2, 'DIS6', 0, 1);
INSERT INTO disciplina_bsi VALUES (11, 60, 'TIN0169', 4, 'BANCO DE DADOS II', 2, 'DIS7', 0, 1);
INSERT INTO disciplina_bsi VALUES (12, 60, 'TME0112', 4, 'CÁLCULO DIFERENCIAL E INTEGRAL I', 2, 'DIS8', 0, 1);
INSERT INTO disciplina_bsi VALUES (13, 60, 'TME0113', 4, 'CÁLCULO DIFERENCIAL E INTEGRAL II', 2, 'DIS9', 0, 1);
INSERT INTO disciplina_bsi VALUES (14, 60, 'TIN0106', 4, 'DESENVOLVIMENTO DE PÁGINAS WEB', 3, 'DIS10', 0, 1);
INSERT INTO disciplina_bsi VALUES (15, 60, 'TIN0130', 4, 'EMPREENDEDORISMO', 3, 'DIS11', 0, 1);
INSERT INTO disciplina_bsi VALUES (16, 60, 'TME0115', 4, 'ESTATÍSTICA', 3, 'DIS12', 0, 1);
INSERT INTO disciplina_bsi VALUES (17, 60, 'TIN0114', 4, 'ESTRUTURAS DE DADOS I', 3, 'DIS13', 0, 1);
INSERT INTO disciplina_bsi VALUES (18, 60, 'TIN0168', 4, 'ESTRUTURAS DE DADOS II', 3, 'DIS14', 0, 1);
INSERT INTO disciplina_bsi VALUES (19, 60, 'TIN0109', 4, 'ESTRUTURAS DISCRETAS', 3, 'DIS15', 0, 1);
INSERT INTO disciplina_bsi VALUES (20, 60, 'TIN0112', 4, 'FUNDAMENTOS DE SISTEMAS DE INFORMAÇÃO', 3, 'DIS16', 0, 1);
INSERT INTO disciplina_bsi VALUES (21, 60, 'TIN0132', 4, 'GERÊNCIA DE PROJ. DE INFORMAT', 4, 'DIS17', 0, 1);
INSERT INTO disciplina_bsi VALUES (22, 60, 'TIN0010', 4, 'INTERAÇÃO HUMANO-COMPUTADOR', 4, 'DIS18', 0, 1);
INSERT INTO disciplina_bsi VALUES (23, 60, 'TIN0105', 4, 'INTRODUÇÃO À LÓGICA COMPUTAC', 4, 'DIS19', 0, 1);
INSERT INTO disciplina_bsi VALUES (24, 60, 'TIN0119', 4, 'LINGUAG. FORMAIS E AUTÔMATOS', 4, 'DIS20', 0, 1);
INSERT INTO disciplina_bsi VALUES (25, 60, 'TME0101', 4, 'MATEMÁTICA BÁSICA', 5, 'DIS21', 0, 1);
INSERT INTO disciplina_bsi VALUES (26, 60, 'TIN0108', 4, 'ORGANIZAÇÃO DE COMPUTADORES', 5, 'DIS22', 0, 1);
INSERT INTO disciplina_bsi VALUES (27, 60, 'TME0114', 4, 'PROBABILIDADE', 5, 'DIS23', 0, 1);
INSERT INTO disciplina_bsi VALUES (28, 60, 'TIN0122', 4, 'PROCESSOS DE SOFTWARE', 5, 'DIS24', 0, 1);
INSERT INTO disciplina_bsi VALUES (29, 60, 'TIN0121', 4, 'PROGRAMAÇÃO MODULAR', 5, 'DIS25', 0, 1);
INSERT INTO disciplina_bsi VALUES (30, 60, 'TIN0131', 4, 'PROJETO DE GRADUAÇÃO I', 5, 'DIS26', 0, 1);
INSERT INTO disciplina_bsi VALUES (31, 60, 'TIN0133', 4, 'PROJETO DE GRADUAÇÃO II', 6, 'DIS27', 0, 1);
INSERT INTO disciplina_bsi VALUES (32, 60, 'TIN0171', 4, 'PROJETO E CONSTRUÇÃO DE SISTEMAS', 6, 'DIS28', 0, 1);
INSERT INTO disciplina_bsi VALUES (33, 60, 'TIN0125', 4, 'PROJETO E CONSTRUÇÃO DE SISTEMAS COM SGBD', 6, 'DIS29', 0, 1);
INSERT INTO disciplina_bsi VALUES (34, 60, 'TIN0123', 4, 'REDES DE COMPUTADORES I', 6, 'DIS30', 0, 1);
INSERT INTO disciplina_bsi VALUES (35, 60, 'TIN0126', 4, 'REDES DE COMPUTADORES II', 6, 'DIS31', 0, 1);
INSERT INTO disciplina_bsi VALUES (36, 60, 'TIN0116', 4, 'SISTEMAS OPERACIONAIS', 6, 'DIS32', 0, 1);
INSERT INTO disciplina_bsi VALUES (37, 60, 'TIN0107', 4, 'TÉCNICAS DE PROGRAMAÇÃO I', 6, 'DIS33', 0, 1);
INSERT INTO disciplina_bsi VALUES (38, 60, 'TIN0011', 4, 'TÉCNICAS DE PROGRAMAÇÃO II', 7, 'DIS34', 0, 1);
INSERT INTO disciplina_bsi VALUES (39, 60, 'HTD0058', 4, 'TEORIAS E PRÁTICAS DISCURSIVAS', 7, 'DIS35', 0, 1);
INSERT INTO disciplina_bsi VALUES (40, 60, 'TIN0135', 4, 'ADMINISTRAÇÃO DE BANCO DE DADOS', 7, 'DIS36', 1, 1);
INSERT INTO disciplina_bsi VALUES (41, 60, 'TIN0144', 4, 'ALGORITMOS PARA PROBLEMAS COMBINATÓRIOS', 7, 'DIS37', 1, 1);
INSERT INTO disciplina_bsi VALUES (42, 60, 'TIN0150', 4, 'AMBIENTE OPERACIONAL UNIX', 7, 'DIS38', 1, 1);
INSERT INTO disciplina_bsi VALUES (43, 60, 'TIN0146', 4, 'COMPILADORES', 7, 'DIS39', 1, 1);
INSERT INTO disciplina_bsi VALUES (44, 60, 'TIN0149', 4, 'COMPUTAÇÃO GRÁFICA', 7, 'DIS40', 1, 1);
INSERT INTO disciplina_bsi VALUES (45, 60, 'TIN0138', 4, 'COMUNICAÇÃO E SEGURANÇA DE DADOS', 7, 'DIS41', 1, 1);
INSERT INTO disciplina_bsi VALUES (46, 60, 'TIN0158', 4, 'DESENVOLVIMENTO DE SERVIDOR WEB', 7, 'DIS42', 1, 1);
INSERT INTO disciplina_bsi VALUES (47, 60, 'TIN0143', 4, 'FLUXOS EM REDES', 8, 'DIS43', 1, 1);
INSERT INTO disciplina_bsi VALUES (48, 60, 'TIN0147', 4, 'FUNDAMENTOS DE REPRESENTAÇÃO DE CONHECIMENTO E RACIOCÍNIO', 8, 'DIS44', 1, 1);
INSERT INTO disciplina_bsi VALUES (49, 60, 'TIN0136', 4, 'GERÊNCIA DE DADOS EM AMBIENTES DISTRIBUÍDOS E PARALELOS', 8, 'DIS45', 1, 1);
INSERT INTO disciplina_bsi VALUES (50, 60, 'TIN0160', 4, 'GESTÃO DE PROCESSOS DE NEGÓCIOS', 8, 'DIS46', 1, 1);
INSERT INTO disciplina_bsi VALUES (51, 60, 'TIN0128', 4, 'INFORMÁTICA NA EDUCAÇÃO', 8, 'DIS47', 1, 1);
INSERT INTO disciplina_bsi VALUES (52, 60, 'TIN0172', 4, 'INTELIGÊNCIA ARTIFICIAL', 8, 'DIS48', 1, 1);
INSERT INTO disciplina_bsi VALUES (53, 60, 'TIN0142', 4, 'PROGRAMAÇÃO LINEAR', 8, 'DIS49', 1, 1);
INSERT INTO disciplina_bsi VALUES (54, 60, 'TIN0159', 4, 'SISTEMAS COLABORATIVOS', 8, 'DIS50', 1, 1);
INSERT INTO disciplina_bsi VALUES (55, 60, 'TIN0148', 4, 'SISTEMAS MULTIMÍDIA', 8, 'DIS51', 1, 1);
INSERT INTO disciplina_bsi VALUES (56, 60, 'TIN0145', 4, 'TÓPICOS AVANÇADOS EM ALGORITMOS I', 8, 'DIS52', 1, 1);
INSERT INTO disciplina_bsi VALUES (57, 60, 'TIN0137', 4, 'TÓPICOS AVANÇADOS EM BANCO DE DADOS I', 8, 'DIS53', 1, 1);
INSERT INTO disciplina_bsi VALUES (58, 60, 'TIN0162', 4, 'TÓPICOS AVANÇADOS EM BANCO DE DADOS II', 8, 'DIS54', 1, 1);
INSERT INTO disciplina_bsi VALUES (59, 60, 'TIN0163', 4, 'TÓPICOS AVANÇADOS EM BANCO DE DADOS III', 8, 'DIS55', 1, 1);
INSERT INTO disciplina_bsi VALUES (60, 60, 'TIN0161', 4, 'TÓPICOS AVANÇADOS EM ENGENHARIA DE SOFTWARE I', 8, 'DIS56', 1, 1);
INSERT INTO disciplina_bsi VALUES (61, 60, 'TIN0166', 4, 'TÓPICOS AVANÇADOS EM ENGENHARIA DE SOFTWARE II', 8, 'DIS57', 1, 1);
INSERT INTO disciplina_bsi VALUES (62, 60, 'TIN0141', 4, 'TÓPICOS AVANÇADOS EM REDES DE COMPUTADORES I', 8, 'DIS58', 1, 1);
INSERT INTO disciplina_bsi VALUES (63, 60, 'TIN0164', 4, 'TÓPICOS AVANÇADOS EM REDES DE COMPUTADORES II', 8, 'DIS59', 1, 1);
INSERT INTO disciplina_bsi VALUES (64, 60, 'TIN0165', 4, 'TÓPICOS AVANÇADOS EM REDES DE COMPUTADORES III', 8, 'DIS60', 1, 1);
INSERT INTO disciplina_bsi VALUES (65, 60, 'TIN0110', 4, 'INTERAÇÃO HUMANO-COMPUTADOR', 4, 'DIS18', 0, 1);


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 201
-- Name: disciplina_bsi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('disciplina_bsi_id_seq', 64, true);


-- Completed on 2018-10-21 13:07:17

--
-- PostgreSQL database dump complete
--
INSERT INTO periodo VALUES (1, 2008, 1);
INSERT INTO periodo VALUES (2, 2008, 2);
INSERT INTO periodo VALUES (3, 2009, 1);
INSERT INTO periodo VALUES (4, 2009, 2);
INSERT INTO periodo VALUES (5, 2010, 1);
INSERT INTO periodo VALUES (6, 2010, 2);
INSERT INTO periodo VALUES (7, 2011, 1);
INSERT INTO periodo VALUES (8, 2011, 2);
INSERT INTO periodo VALUES (9, 2012, 1);
INSERT INTO periodo VALUES (10, 2012, 2);
INSERT INTO periodo VALUES (11, 2013, 1);
INSERT INTO periodo VALUES (12, 2013, 2);
INSERT INTO periodo VALUES (13, 2014, 1);
INSERT INTO periodo VALUES (14, 2014, 2);
INSERT INTO periodo VALUES (15, 2015, 1);
INSERT INTO periodo VALUES (16, 2015, 2);
INSERT INTO periodo VALUES (17, 2016, 1);
INSERT INTO periodo VALUES (18, 2016, 2);
INSERT INTO periodo VALUES (19, 2017, 1);
INSERT INTO periodo VALUES (20, 2017, 2);
INSERT INTO periodo VALUES (21, 2018, 1);
INSERT INTO periodo VALUES (22, 2018, 2);


--
-- TOC entry 2860 (class 0 OID 0)
-- Dependencies: 213
-- Name: periodo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('periodo_id_seq', 22, true);

