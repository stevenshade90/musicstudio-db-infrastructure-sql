-- =====================================
-- PHASE 1: SHADE SCHOOL OF MUSIC SCHEMA
-- =====================================

-- 1. Instrument List (Independent)
CREATE TABLE instrument_list (
    id INT GENERATED ALWAYS AS IDENTITY,
    instrument_name VARCHAR(50) NOT NULL,
    CONSTRAINT instrument_pk PRIMARY KEY (id)
);

-- 2. Parent Info (Independent)
CREATE TABLE parent_info (
    id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    CONSTRAINT parent_pk PRIMARY KEY (id),
    CONSTRAINT parent_info_email_key UNIQUE (email)
);

-- 3. Teacher Info (Independent)
CREATE TABLE teacher_info (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    CONSTRAINT teacher_pk PRIMARY KEY (id),
    CONSTRAINT teacher_info_email_key UNIQUE (email)
);

-- 4. Invoice Info (depends on parent_info)
CREATE TABLE invoice_info (
    id INT GENERATED ALWAYS AS IDENTITY,
    parent_id INT NOT NULL,
    billing_amount NUMERIC(10, 2) NOT NULL,
    invoice_paid BOOLEAN DEFAULT FALSE,
    CONSTRAINT invoice_pk PRIMARY KEY (id),
    CONSTRAINT invoice_info_parent_id_key FOREIGN KEY (parent_id) REFERENCES parent_info (id)
);

-- 5. Student Info (depends on parent_info, teacher_info, and instrument_list)
CREATE TABLE student_info (
    id INT GENERATED ALWAYS AS IDENTITY,
    parent_id INT NOT NULL,
    teacher_id INT NOT NULL,
    instrument_id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    age SMALLINT,
    CONSTRAINT student_pk PRIMARY KEY (id),
    CONSTRAINT student_info_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES parent_info (id),
    CONSTRAINT student_info_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES teacher_info (id),
    CONSTRAINT student_info_instrument_id_fkey FOREIGN KEY (instrument_id) REFERENCES instrument_list (id)
);
