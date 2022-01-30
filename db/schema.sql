

-- SCHEMA: pywordbook

-- DROP SCHEMA pywordbook ;

CREATE SCHEMA pywordbook
    AUTHORIZATION postgres;

-- Table: pywordbook.users

-- DROP TABLE pywordbook.users;

CREATE TABLE pywordbook.users
(
    name text COLLATE pg_catalog."default" NOT NULL,
    email text COLLATE pg_catalog."default" NOT NULL,
    password text COLLATE pg_catalog."default" NOT NULL,
    date_created timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    id bigserial PRIMARY KEY,
    CONSTRAINT users_email_key UNIQUE (email)
)

TABLESPACE pg_default;

ALTER TABLE pywordbook.users
    OWNER to postgres;

-- Table: pywordbook.wordbooks

-- DROP TABLE pywordbook.wordbooks;

CREATE TABLE pywordbook.wordbooks
(
    user_id integer NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    date_created timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    id bigserial PRIMARY KEY,
    CONSTRAINT wordbooks_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES pywordbook.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE pywordbook.wordbooks
    OWNER to postgres;

-- Table: pywordbook.words

-- DROP TABLE pywordbook.words;

CREATE TABLE pywordbook.words
(
    workbook_id integer NOT NULL,
    source text COLLATE pg_catalog."default" NOT NULL,
    translation text COLLATE pg_catalog."default",
    date_created time without time zone NOT NULL,
    id bigserial PRIMARY KEY,
    CONSTRAINT words_workbook_id_fkey FOREIGN KEY (workbook_id)
        REFERENCES pywordbook.wordbooks (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE pywordbook.words
    OWNER to postgres;

-- Table: pywordbook.settings

-- DROP TABLE pywordbook.settings;

CREATE TABLE pywordbook.settings
(
    user_id integer,
    name text COLLATE pg_catalog."default" NOT NULL,
    id bigserial PRIMARY KEY,
    CONSTRAINT settings_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES pywordbook.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE pywordbook.settings
    OWNER to postgres;
