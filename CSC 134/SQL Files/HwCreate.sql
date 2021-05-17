DROP TABLE  Kaur_student;
CREATE TABLE Kaur_student (
    Ssn VARCHAR2(20),
    Lname VARCHAR2(20),
    Fname VARCHAR2(20),
    Age NUMBER,
    Salary NUMBER,
    Dob NUMBER,
    PRIMARY KEY (Ssn)
);
ALTER TABLE Kaur_student ADD UNIQUE (Lname, Fname);
ALTER TABLE Kaur_student MODIFY Age CONSTRAINT Age_ck CHECK (Age > 10 AND Age < 50);
ALTER TABLE Kaur_student ADD Address VARCHAR2(20);
ALTER TABLE Kaur_student MODIFY Dob DATE NOT NULL;
CREATE INDEX new_idx ON Kaur_student (Ssn, Dob);
SELECT constraint_name, constraint_type FROM user_constraints WHERE table_name = 'KAUR_STUDENT';
SELECT index_name FROM user_indexes WHERE table_name = 'KAUR_STUDENT';
ALTER TABLE Kaur_student ADD Transferable VARCHAR2(20) NOT NULL;
ALTER TABLE Kaur_student MODIFY Transferable CONSTRAINT transfer_ch CHECK (Transferable = 'y' OR Transferable = 'Y' OR Transferable = 'n' OR Transferable = 'N'); 
ALTER TABLE Kaur_student DROP (Age);
DESC Kaur_student;


DROP TABLE Kaur_class;
CREATE TABLE Kaur_class (
    Class_code NUMBER,
    Class_desc VARCHAR2(20) NOT NULL,
    UNIQUE (Class_desc)
);
ALTER TABLE Kaur_class ADD CONSTRAINT code_pk PRIMARY KEY (Class_code);
CREATE INDEX hello ON Kaur_class (Class_desc);
DESC Kaur_class;

DROP TABLE Kaur_student_class;
CREATE TABLE Kaur_student_class (
    Ssn VARCHAR2(20),
    Class_code NUMBER
);
ALTER TABLE Kaur_student_class ADD CONSTRAINT new_pk PRIMARY KEY (Ssn, Class_code);
ALTER TABLE Kaur_student_class ADD CONSTRAINT one_fk FOREIGN KEY (Ssn) REFERENCES Kaur_student;
ALTER TABLE Kaur_student_class ADD CONSTRAINT two_fk FOREIGN KEY (Class_code) REFERENCES Kaur_class;

DESC Kaur_student_class;


