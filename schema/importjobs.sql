CREATE SCHEMA importjobs;
SET search_path TO 'importjobs', 'public';

CREATE TYPE job_parsers AS ENUM (
    'CSV'
);

CREATE TYPE job_states AS ENUM (
    'NEW',
    'CANCELED',
    'DONE',
    'ERROR'
);

CREATE TABLE jobs AS (
    job_id SERIAL NOT NULL,
    job_state job_states NOT NULL DEFAULT 'NEW',
    job_input_data BYTEA,
    job_parser_data JSONB,
    job_parser job_parsers,
    job_create_ts TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    PRIMARY KEY jobid
);