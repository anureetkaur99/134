DROP TABLE kaur_candidate;
CREATE TABLE kaur_candidate
(
    Lname VARCHAR2(20),
    Fname VARCHAR2(20),
    Salary NUMBER CONSTRAINT check_salary CHECK (Salary > 10000 AND Salary < 50000),
    Dob DATE
);
ALTER TABLE kaur_candidate DISABLE CONSTRAINT check_salary;
ALTER TABLE kaur_candidate ADD Candidate_id NUMBER PRIMARY KEY NOT NULL;
ALTER TABLE kaur_party ADD Party_id NUMBER PRIMARY KEY;
ALTER TABLE kaur_candidate ADD Party_id NUMBER;
ALTER TABLE kaur_candidate ADD CONSTRAINT FK_CandidateParty FOREIGN KEY(Party_id) REFERENCES kaur_party;
ALTER TABLE kaur_candidate DISABLE CONSTRAINT FK_CandidateParty;
ALTER TABLE kaur_candidate DROP CONSTRAINT FK_CandidateParty;
DESC kaur_candidate;

DROP TABLE kaur_party;
CREATE TABLE kaur_party
(
    Party_desc VARCHAR2(20) 
);

ALTER TABLE kaur_party MODIFY Party_desc NOT NULL;
DESC kaur_party;





/*
ALTER TABLE kaur_candidate DROP (Dob);
ALTER TABLE kaur_candidate ADD (Dob DATE);
ALTER TABLE kaur_candidate ADD Ssn NUMBER;
ALTER TABLE kaur_candidate MODIFY Ssn PRIMARY KEY;
ALTER TABLE kaur_party ADD Party_id NUMBER;
ALTER TABLE kaur_party MODIFY Party_id PRIMARY KEY;
ALTER TABLE kaur_candidate ADD CONSTRAINT Candidate_key UNIQUE (Fname,Lname);
DROP TABLE kaur_party;
DROP TABLE kaur_candidate;
CREATE TABLE kaur_party
(
    Party_id NUMBER PRIMARY KEY,
    Party_desc VARCHAR2(20)
);
*/

