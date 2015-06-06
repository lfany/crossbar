DROP TABLE IF EXISTS crossbar.event;

CREATE UNLOGGED TABLE crossbar.event
(
    id              BIGSERIAL PRIMARY KEY,
    queued_at       TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    processed_at    TIMESTAMP,
    payload         TEXT NOT NULL
);


DROP TABLE IF EXISTS crossbar.registration;

CREATE TABLE crossbar.registration
(
    id              BIGSERIAL PRIMARY KEY,
    procedure       TEXT NOT NULL,
    name            TEXT NOT NULL,
    signature       TEXT,
    proc_oid        INT NOT NULL,
    registered_at   TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX idx_registration_procedure
    ON crossbar.registration (procedure)
;
