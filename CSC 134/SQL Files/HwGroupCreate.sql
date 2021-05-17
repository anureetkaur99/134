CREATE TABLE kaur_candidate
(
    Lname VARCHAR2(20),
    Fname VARCHAR2(20),
    Dob DATE,
    Salary NUMBER
);

CREATE TABLE kaur_party
(
    Party_desc VARCHAR2(20)
);

DESC kaur_candidate;
DESC kaur_party;
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


