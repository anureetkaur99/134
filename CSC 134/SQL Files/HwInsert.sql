DROP TABLE  Kaur_student;
CREATE TABLE Kaur_student (
    Ssn VARCHAR2(20),
    Lname VARCHAR2(20),
    Fname VARCHAR2(20),
    Salary NUMBER,
    Dob NUMBER,
    PRIMARY KEY (Ssn),
    CONSTRAINT Compos_uk UNIQUE (Fname, Lname)
);
ALTER TABLE Kaur_student MODIFY Salary CONSTRAINT checkSal_ck CHECK (Salary > 10000);
ALTER TABLE Kaur_student MODIFY Dob DATE NOT NULL;
INSERT INTO Kaur_student VALUES('123456789', 'Sandhu', 'Riya', 20000, to_date('992302', 'YYDDMM'));
INSERT INTO Kaur_student VALUES('234567891', 'Kaur', 'Jasleen', 21000, '27-JUN-1999');
INSERT INTO Kaur_student VALUES('123456789', 'Singh', 'Sajan', 20000, to_date('992302', 'YYDDMM'));
INSERT INTO Kaur_student VALUES('234567891', 'Singh', 'Sajan', 20000, to_date('992302', 'YYDDMM'));
INSERT INTO Kaur_student VALUES('234567891', 'Kaur', 'Jasleen', 1000, '27-JUN-1999');


DESC Kaur_student;


DROP TABLE Kaur_class;
CREATE TABLE Kaur_class (
    Class_code NUMBER,
    Class_desc VARCHAR2(20) NOT NULL,
    UNIQUE (Class_desc)
);
ALTER TABLE Kaur_class ADD CONSTRAINT code_pk PRIMARY KEY (Class_code);
CREATE INDEX nope ON Kaur_class (Class_desc);
SELECT index_name FROM user_indexes WHERE table_name = 'KAUR_CLASS';
INSERT INTO Kaur_class VALUES(1, 'Science');
INSERT INTO Kaur_class VALUES(2, 'Math');

DESC Kaur_class;

DROP TABLE Kaur_student_class;
CREATE TABLE Kaur_student_class (
    Ssn VARCHAR2(20),
    Class_code NUMBER
);
ALTER TABLE Kaur_student_class ADD CONSTRAINT x_pk PRIMARY KEY (Ssn, Class_code);
ALTER TABLE Kaur_student_class ADD CONSTRAINT y_fk FOREIGN KEY (Ssn) REFERENCES Kaur_student;
ALTER TABLE Kaur_student_class ADD CONSTRAINT z_fk FOREIGN KEY (Class_code) REFERENCES Kaur_class;
INSERT INTO Kaur_student_class VALUES('123456789', 1);
INSERT INTO Kaur_student_class VALUES('234567891', 2);
INSERT INTO Kaur_student_class VALUES('234567891', 1);
INSERT INTO Kaur_student_class VALUES('678123459', 4);
SELECT * FROM Kaur_student_class;
ALTER TABLE Kaur_student_class DISABLE CONSTRAINT y_fk;
INSERT INTO Kaur_student_class VALUES('999999999', 1);
ALTER TABLE Kaur_student_class ENABLE CONSTRAINT y_fk;
DELETE FROM Kaur_student_class;
TRUNCATE TABLE Kaur_student;
ALTER TABLE Kaur_student_class DROP CONSTRAINT y_fk;
ALTER TABLE Kaur_student_class DROP CONSTRAINT z_fk;
DROP TABLE Kaur_student;
DESC Kaur_student_class;


