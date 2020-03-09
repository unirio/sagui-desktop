-- CRIACAO DE TABELAS

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE aluno (
    id bigint NOT NULL,
    deleted integer,
    email character varying(255),
    nome character varying(255) NOT NULL,
    permissao integer,
    cr double precision,
    matricula character varying(255),
    precisa_plano_integralizacao boolean,
    quantidade_semestres_cursados integer,
    versao_norma_integralizacao integer,
    historico_id bigint,
    periodo_ingresso_id bigint
);


ALTER TABLE aluno OWNER TO postgres;

--
-- Name: aluno_situacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE aluno_situacao (
    aluno_id bigint NOT NULL,
    situacao character varying(255)
);


ALTER TABLE aluno_situacao OWNER TO postgres;

--
-- Name: arquivo_plano_integralizacaopdf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE arquivo_plano_integralizacaopdf (
    id bigint NOT NULL,
    arquivopdf bytea,
    nome_arquivo character varying(255)
);


ALTER TABLE arquivo_plano_integralizacaopdf OWNER TO postgres;

--
-- Name: arquivo_plano_integralizacaopdf_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE arquivo_plano_integralizacaopdf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE arquivo_plano_integralizacaopdf_id_seq OWNER TO postgres;

--
-- Name: arquivo_plano_integralizacaopdf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE arquivo_plano_integralizacaopdf_id_seq OWNED BY arquivo_plano_integralizacaopdf.id;


--
-- Name: arquivopdf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE arquivopdf (
    id bigint NOT NULL,
    arquivopdf bytea,
    nome_arquivo character varying(255)
);


ALTER TABLE arquivopdf OWNER TO postgres;

--
-- Name: arquivopdf_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE arquivopdf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE arquivopdf_id_seq OWNER TO postgres;

--
-- Name: arquivopdf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE arquivopdf_id_seq OWNED BY arquivopdf.id;


--
-- Name: confirmacao_matricula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE confirmacao_matricula (
    id bigint NOT NULL,
    conteudo character varying(2000),
    data_da_confirmacao date,
    aluno_id bigint,
    professor_id bigint
);


ALTER TABLE confirmacao_matricula OWNER TO postgres;

--
-- Name: confirmacao_matricula_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE confirmacao_matricula_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE confirmacao_matricula_id_seq OWNER TO postgres;

--
-- Name: confirmacao_matricula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE confirmacao_matricula_id_seq OWNED BY confirmacao_matricula.id;


--
-- Name: disciplina_bsi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE disciplina_bsi (
    id bigint NOT NULL,
    carga_horaria integer,
    codigo character varying(255) NOT NULL,
    creditos integer,
    nome character varying(255),
    periodo_recomendado integer,
    sigla character varying(255),
    tipo_disciplina integer,
    versaoppc integer
);


ALTER TABLE disciplina_bsi OWNER TO postgres;

--
-- Name: disciplina_bsi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE disciplina_bsi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE disciplina_bsi_id_seq OWNER TO postgres;

--
-- Name: disciplina_bsi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE disciplina_bsi_id_seq OWNED BY disciplina_bsi.id;


--
-- Name: disciplina_cursada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE disciplina_cursada (
    id bigint NOT NULL,
    carga_horaria integer,
    codigo character varying(255) NOT NULL,
    creditos integer,
    nome character varying(255),
    sigla character varying(255),
    tipo_disciplina integer,
    versaoppc integer
);


ALTER TABLE disciplina_cursada OWNER TO postgres;

--
-- Name: disciplina_cursada_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE disciplina_cursada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE disciplina_cursada_id_seq OWNER TO postgres;

--
-- Name: disciplina_cursada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE disciplina_cursada_id_seq OWNED BY disciplina_cursada.id;


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: historico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE historico (
    id bigint NOT NULL,
    data_atualizacao date,
    versaoppc integer,
    arquivopdf_id bigint
);


ALTER TABLE historico OWNER TO postgres;

--
-- Name: historico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE historico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE historico_id_seq OWNER TO postgres;

--
-- Name: historico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE historico_id_seq OWNED BY historico.id;


--
-- Name: historico_processamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE historico_processamento (
    id bigint NOT NULL,
    data_hora_processamento timestamp without time zone,
    descricao_erro character varying(3000),
    nome_do_arquivo character varying(255),
    sucesso boolean,
    usuario_responsavel_id bigint
);


ALTER TABLE historico_processamento OWNER TO postgres;

--
-- Name: historico_processamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE historico_processamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE historico_processamento_id_seq OWNER TO postgres;

--
-- Name: historico_processamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE historico_processamento_id_seq OWNED BY historico_processamento.id;


--
-- Name: matricula_disciplina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE matricula_disciplina (
    id bigint NOT NULL,
    ano integer,
    deleted integer,
    periodo integer,
    status_da_matricula integer,
    tipo_disciplina integer,
    ultima_atualizacao timestamp without time zone,
    disciplina_id bigint,
    historico_id bigint
);


ALTER TABLE matricula_disciplina OWNER TO postgres;

--
-- Name: matricula_disciplina_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE matricula_disciplina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE matricula_disciplina_id_seq OWNER TO postgres;

--
-- Name: matricula_disciplina_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE matricula_disciplina_id_seq OWNED BY matricula_disciplina.id;


--
-- Name: periodo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE periodo (
    id bigint NOT NULL,
    ano integer,
    semestre integer
);


ALTER TABLE periodo OWNER TO postgres;

--
-- Name: periodo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE periodo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE periodo_id_seq OWNER TO postgres;

--
-- Name: periodo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE periodo_id_seq OWNED BY periodo.id;


--
-- Name: plano_integralizacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE plano_integralizacao (
    id bigint NOT NULL,
    data_de_envio date,
    plano character varying(1000),
    aluno_id bigint,
    arquivo_plano_empdf_id bigint,
    usuario_responsavel_id bigint
);


ALTER TABLE plano_integralizacao OWNER TO postgres;

--
-- Name: plano_integralizacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plano_integralizacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plano_integralizacao_id_seq OWNER TO postgres;

--
-- Name: plano_integralizacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plano_integralizacao_id_seq OWNED BY plano_integralizacao.id;


--
-- Name: professor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE professor (
    id bigint NOT NULL,
    deleted integer,
    email character varying(255),
    nome character varying(255) NOT NULL,
    permissao integer,
    pertence_comissao_de_matricula boolean NOT NULL
);


ALTER TABLE professor OWNER TO postgres;

--
-- Name: professor_periodos_como_tutor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE professor_periodos_como_tutor (
    professor_id bigint NOT NULL,
    periodos_como_tutor_id bigint NOT NULL
);


ALTER TABLE professor_periodos_como_tutor OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id bigint NOT NULL,
    deleted integer,
    email character varying(255),
    nome character varying(255) NOT NULL,
    permissao integer
);


ALTER TABLE usuario OWNER TO postgres;

--
-- Name: arquivo_plano_integralizacaopdf id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY arquivo_plano_integralizacaopdf ALTER COLUMN id SET DEFAULT nextval('arquivo_plano_integralizacaopdf_id_seq'::regclass);


--
-- Name: arquivopdf id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY arquivopdf ALTER COLUMN id SET DEFAULT nextval('arquivopdf_id_seq'::regclass);


--
-- Name: confirmacao_matricula id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY confirmacao_matricula ALTER COLUMN id SET DEFAULT nextval('confirmacao_matricula_id_seq'::regclass);


--
-- Name: disciplina_bsi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disciplina_bsi ALTER COLUMN id SET DEFAULT nextval('disciplina_bsi_id_seq'::regclass);


--
-- Name: disciplina_cursada id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disciplina_cursada ALTER COLUMN id SET DEFAULT nextval('disciplina_cursada_id_seq'::regclass);


--
-- Name: historico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historico ALTER COLUMN id SET DEFAULT nextval('historico_id_seq'::regclass);


--
-- Name: historico_processamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historico_processamento ALTER COLUMN id SET DEFAULT nextval('historico_processamento_id_seq'::regclass);


--
-- Name: matricula_disciplina id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matricula_disciplina ALTER COLUMN id SET DEFAULT nextval('matricula_disciplina_id_seq'::regclass);


--
-- Name: periodo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY periodo ALTER COLUMN id SET DEFAULT nextval('periodo_id_seq'::regclass);


--
-- Name: plano_integralizacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plano_integralizacao ALTER COLUMN id SET DEFAULT nextval('plano_integralizacao_id_seq'::regclass);


--
-- Name: aluno aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (id);


--
-- Name: arquivo_plano_integralizacaopdf arquivo_plano_integralizacaopdf_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY arquivo_plano_integralizacaopdf
    ADD CONSTRAINT arquivo_plano_integralizacaopdf_pkey PRIMARY KEY (id);


--
-- Name: arquivopdf arquivopdf_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY arquivopdf
    ADD CONSTRAINT arquivopdf_pkey PRIMARY KEY (id);


--
-- Name: confirmacao_matricula confirmacao_matricula_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY confirmacao_matricula
    ADD CONSTRAINT confirmacao_matricula_pkey PRIMARY KEY (id);


--
-- Name: disciplina_bsi disciplina_bsi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disciplina_bsi
    ADD CONSTRAINT disciplina_bsi_pkey PRIMARY KEY (id);


--
-- Name: disciplina_cursada disciplina_cursada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disciplina_cursada
    ADD CONSTRAINT disciplina_cursada_pkey PRIMARY KEY (id);


--
-- Name: historico historico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historico
    ADD CONSTRAINT historico_pkey PRIMARY KEY (id);


--
-- Name: historico_processamento historico_processamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historico_processamento
    ADD CONSTRAINT historico_processamento_pkey PRIMARY KEY (id);


--
-- Name: matricula_disciplina matricula_disciplina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matricula_disciplina
    ADD CONSTRAINT matricula_disciplina_pkey PRIMARY KEY (id);


--
-- Name: periodo periodo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT periodo_pkey PRIMARY KEY (id);


--
-- Name: plano_integralizacao plano_integralizacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plano_integralizacao
    ADD CONSTRAINT plano_integralizacao_pkey PRIMARY KEY (id);


--
-- Name: professor professor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (id);


--
-- Name: professor_periodos_como_tutor uk_3kqondv5u0e2mt8ii2lskgyuh; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY professor_periodos_como_tutor
    ADD CONSTRAINT uk_3kqondv5u0e2mt8ii2lskgyuh UNIQUE (periodos_como_tutor_id);


--
-- Name: aluno uk_3wpes15e0anbfaa4do0pey97k; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aluno
    ADD CONSTRAINT uk_3wpes15e0anbfaa4do0pey97k UNIQUE (email);


--
-- Name: usuario uk_5171l57faosmj8myawaucatdw; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT uk_5171l57faosmj8myawaucatdw UNIQUE (email);


--
-- Name: aluno uk_prosr3jo55p8vlcu7e0g7s2ov; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aluno
    ADD CONSTRAINT uk_prosr3jo55p8vlcu7e0g7s2ov UNIQUE (matricula);


--
-- Name: professor uk_qjm28ojevoom770jyieljec3e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY professor
    ADD CONSTRAINT uk_qjm28ojevoom770jyieljec3e UNIQUE (email);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: plano_integralizacao fk2mx5o4ur8rylvxwai4k8w8wud; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plano_integralizacao
    ADD CONSTRAINT fk2mx5o4ur8rylvxwai4k8w8wud FOREIGN KEY (aluno_id) REFERENCES aluno(id);


--
-- Name: matricula_disciplina fk5ume5lnvtfi7g92rbj7u52ow9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matricula_disciplina
    ADD CONSTRAINT fk5ume5lnvtfi7g92rbj7u52ow9 FOREIGN KEY (disciplina_id) REFERENCES disciplina_cursada(id);


--
-- Name: historico fkbsxtxjd9chncu68142arxs08v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historico
    ADD CONSTRAINT fkbsxtxjd9chncu68142arxs08v FOREIGN KEY (arquivopdf_id) REFERENCES arquivopdf(id);


--
-- Name: professor_periodos_como_tutor fkdet8t8njancdaukd3lm617j6b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY professor_periodos_como_tutor
    ADD CONSTRAINT fkdet8t8njancdaukd3lm617j6b FOREIGN KEY (periodos_como_tutor_id) REFERENCES periodo(id);


--
-- Name: aluno_situacao fkeeof5eu7ehrqo5ikew250wdw6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aluno_situacao
    ADD CONSTRAINT fkeeof5eu7ehrqo5ikew250wdw6 FOREIGN KEY (aluno_id) REFERENCES aluno(id);


--
-- Name: matricula_disciplina fkf7jxvdvhyux49vydxsmudnomw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matricula_disciplina
    ADD CONSTRAINT fkf7jxvdvhyux49vydxsmudnomw FOREIGN KEY (historico_id) REFERENCES historico(id);


--
-- Name: professor_periodos_como_tutor fkgg670ym7ltnegwi3ksl7d0gje; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY professor_periodos_como_tutor
    ADD CONSTRAINT fkgg670ym7ltnegwi3ksl7d0gje FOREIGN KEY (professor_id) REFERENCES professor(id);


--
-- Name: plano_integralizacao fkiw3vg9s95binmhy2hmw0olo0m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plano_integralizacao
    ADD CONSTRAINT fkiw3vg9s95binmhy2hmw0olo0m FOREIGN KEY (arquivo_plano_empdf_id) REFERENCES arquivo_plano_integralizacaopdf(id);


--
-- Name: aluno fkk5no9705q9ad5b9obxgiolav3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aluno
    ADD CONSTRAINT fkk5no9705q9ad5b9obxgiolav3 FOREIGN KEY (periodo_ingresso_id) REFERENCES periodo(id);


--
-- Name: aluno fks22y95qgn6yibhke2jdydl93a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aluno
    ADD CONSTRAINT fks22y95qgn6yibhke2jdydl93a FOREIGN KEY (historico_id) REFERENCES historico(id);


--
-- Name: confirmacao_matricula fktahdjsugglxgyd1xi6pxcy126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY confirmacao_matricula
    ADD CONSTRAINT fktahdjsugglxgyd1xi6pxcy126 FOREIGN KEY (aluno_id) REFERENCES aluno(id);


--
-- PostgreSQL database dump complete
--






-- INSERTS INICIAIS

-- Disciplinas de BSI

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

SELECT pg_catalog.setval('disciplina_bsi_id_seq', 65, true);


-- Completed on 2018-10-21 13:07:17

--
-- PostgreSQL database dump complete
--

-- Periodos Letivos
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

-- Secretaria

INSERT INTO usuario VALUES (1, 0, 'douglas.brito@uniriotec.br', 'Douglas Brito', 2);


-- Professores

INSERT INTO professor VALUES (2, 0, 'raquel.almeida@uniriotec.br', 'Professor Admin', 1, true);
INSERT INTO professor VALUES (3, 0, 'gleison.santos@uniriotec.br', 'Gleison Santos', 1, true);
INSERT INTO professor VALUES (4, 0, 'marcio.barros@uniriotec.br', 'Marcio Barros', 1, true);
INSERT INTO professor VALUES (5, 0, 'morganna@uniriotec.br', 'Morganna Diniz', 1, true);

SELECT pg_catalog.setval('hibernate_sequence', 5, true);
