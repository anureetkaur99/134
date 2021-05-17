DROP TABLE kaur_candidate;
CREATE TABLE kaur_candidate (
    Candidate_id NUMBER NOT NULL,
    Fname VARCHAR2(20),
    Lname VARCHAR2(20),
    Dob DATE,
    Salary NUMBER,
    Party_id NUMBER,
    PRIMARY KEY (Candidate_id),
    CONSTRAINT Composite_uk UNIQUE (Fname, Lname),
    CONSTRAINT Check_salary CHECK (Salary > 10000 AND Salary < 50000),
    CONSTRAINT Candidate_party_fk FOREIGN KEY (Party_id) REFERENCES kaur_party(Party_id)
);
DESC kaur_candidate;
INSERT INTO kaur_candidate VALUES (1, 'Jasleen', 'Kaur', '27-JUNE-1999', 45000, 1);
INSERT INTO kaur_candidate VALUES (2, 'Riya', 'Sandhu', '24-FEB-1999', 45000, 2);
INSERT INTO kaur_candidate VALUES (3, 'Ong', 'Thao', 'APR-24-1999', 45000, 1);
INSERT INTO kaur_candidate VALUES (4, 'Ashley', 'Thor', '13-MAR-1999', 45000, 2);
SELECT To_char(To_Date(Dob, 'DD-MON-YY'), 'MM-DD-YYYY') FROM kaur_candidate;
SELECT To_char(To_Date(Dob, 'DD-MON-YY'), 'DD-YYYY-MM hh12:mi:ss') FROM kaur_candidate;
INSERT INTO kaur_candidate VALUES (5, 'Sajan', 'Malhi', '16-MAR-1999', 105000, 1);
SELECT * FROM kaur_candidate;
SELECT table_name, constraint_name, constraint_type FROM user_constraints WHERE table_name = 'KAUR_CANDIDATE';

/*-----------------------------------------------------------------------------------------------------------*/

DROP TABLE kaur_party;
CREATE TABLE kaur_party (
    Party_id NUMBER,
    Party_desc VARCHAR(20),
    UNIQUE (Party_desc),
    PRIMARY KEY (Party_id)
);
DESC kaur_party;
INSERT INTO kaur_party VALUES (1, 'DEMOCRAT');
INSERT INTO kaur_party VALUES (2, 'REPUBLICANS');
INSERT INTO kaur_party VALUES (3, 'DEMOCRAT');
SELECT * FROM kaur_party;
SELECT table_name, constraint_name, constraint_type FROM user_constraints WHERE table_name = 'KAUR_PARTY';