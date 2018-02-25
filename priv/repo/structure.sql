--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE accounts_users (
    id bigint NOT NULL,
    email character varying(255),
    full_name character varying(255),
    password_hash character varying(255),
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: accounts_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE accounts_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accounts_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE accounts_users_id_seq OWNED BY accounts_users.id;


--
-- Name: sales_carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sales_carts (
    id bigint NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sales_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sales_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sales_carts_id_seq OWNED BY sales_carts.id;


--
-- Name: sales_line_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sales_line_items (
    id bigint NOT NULL,
    quantity integer DEFAULT 0,
    book_id bigint,
    cart_id bigint,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sales_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sales_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sales_line_items_id_seq OWNED BY sales_line_items.id;


--
-- Name: sales_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sales_orders (
    id bigint NOT NULL,
    address character varying(255),
    user_id bigint,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sales_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sales_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sales_orders_id_seq OWNED BY sales_orders.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp without time zone
);


--
-- Name: store_books; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE store_books (
    id bigint NOT NULL,
    title character varying(255),
    description text,
    price numeric(4,2),
    image_url character varying(255),
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: store_books_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE store_books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: store_books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE store_books_id_seq OWNED BY store_books.id;


--
-- Name: accounts_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY accounts_users ALTER COLUMN id SET DEFAULT nextval('accounts_users_id_seq'::regclass);


--
-- Name: sales_carts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_carts ALTER COLUMN id SET DEFAULT nextval('sales_carts_id_seq'::regclass);


--
-- Name: sales_line_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_line_items ALTER COLUMN id SET DEFAULT nextval('sales_line_items_id_seq'::regclass);


--
-- Name: sales_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_orders ALTER COLUMN id SET DEFAULT nextval('sales_orders_id_seq'::regclass);


--
-- Name: store_books id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_books ALTER COLUMN id SET DEFAULT nextval('store_books_id_seq'::regclass);


--
-- Name: accounts_users accounts_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY accounts_users
    ADD CONSTRAINT accounts_users_pkey PRIMARY KEY (id);


--
-- Name: sales_carts sales_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_carts
    ADD CONSTRAINT sales_carts_pkey PRIMARY KEY (id);


--
-- Name: sales_line_items sales_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_line_items
    ADD CONSTRAINT sales_line_items_pkey PRIMARY KEY (id);


--
-- Name: sales_orders sales_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_orders
    ADD CONSTRAINT sales_orders_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: store_books store_books_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_books
    ADD CONSTRAINT store_books_pkey PRIMARY KEY (id);


--
-- Name: accounts_users_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX accounts_users_email_index ON accounts_users USING btree (email);


--
-- Name: sales_line_items_book_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sales_line_items_book_id_index ON sales_line_items USING btree (book_id);


--
-- Name: sales_line_items_cart_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sales_line_items_cart_id_index ON sales_line_items USING btree (cart_id);


--
-- Name: sales_orders_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sales_orders_user_id_index ON sales_orders USING btree (user_id);


--
-- Name: sales_line_items sales_line_items_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_line_items
    ADD CONSTRAINT sales_line_items_book_id_fkey FOREIGN KEY (book_id) REFERENCES store_books(id);


--
-- Name: sales_line_items sales_line_items_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_line_items
    ADD CONSTRAINT sales_line_items_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES sales_carts(id);


--
-- Name: sales_orders sales_orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_orders
    ADD CONSTRAINT sales_orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES accounts_users(id);


--
-- PostgreSQL database dump complete
--

INSERT INTO "schema_migrations" (version) VALUES (20180217063210), (20180218174349), (20180218185627), (20180222051132), (20180225031535);

