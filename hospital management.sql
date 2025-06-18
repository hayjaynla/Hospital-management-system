CREATE DATABASE `Hospital_Management_db`;
USE Hospital_management_db;
CREATE TABLE Patient (
Patient_id INT AUTO_INCREMENT PRIMARY KEY,
Patient_Name VARCHAR (30) NOT NULL,
Location VARCHAR (20) NOT NULL,
Room_Number VARCHAR (20) NOT NULL,
Doctor VARCHAR (30) NOT NULL
);

CREATE TABLE Nurse (
Nurse_id INT ,
Patient_id INT NOT NULL,
Room_Number VARCHAR (20) NOT NULL,
Nurse_Name VARCHAR (30) NOT NULL,
Address  VARCHAR (50) NOT NULL,
Contact  VARCHAR (20) NOT NULL,
FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id)
);
 
CREATE TABLE Doctor(
Doctor_id INT ,
Patient_id INT NOT NULL ,
Patient_Name VARCHAR (30) NOT NULL,
Room_Number VARCHAR (30) NOT NULL,
Doctor_Name VARCHAR (30) NOT NULL,
Nurse_Name VARCHAR (30) NOT NULL
);

INSERT INTO Patient (Patient_Name,Location,Room_Number,Doctor)
VALUES
('Ayomide Dorcas','Sangotedo',"101",'Adeloye Feranmi'),
('Joseph matthew','Ikorodu','102','Tewobola Temitope'),
('Yemisi Okocha','Awoyaya','103','Adediji matthew'),
('Lukka Kenedy','Ibeju','104','Susanna ihinrere'),
('Ejike Ezelaka','Ibadan','105','Adedeji Michael'),
('Ezekiel Ganye','Oyo','106','Tewobola Temitope'),
('Solomo Bolaji','Sagamu','107','Susanna ihinrere'),
('Kemisola Yetunde','Ilorin','108','Adedeji Michael'),
('Kaka Esther','Ado','109','Adeloye Feranmi'),
('Naomi Edet','Ojoo','110','Adediji Matthew');

SELECT * FROM Patient;

INSERT INTO Nurse (Nurse_id,Patient_id,Room_Number,Nurse_Name,Address,Contact)
VALUES
('1','1','101','Sharon Odunjo','Ikeja','7066792026'),
('2','2','102','Aileriomo Jumoke','Lekki','9066252026'),
('1','3','103','Sharon Odunjo','Ikeja','8066262024'),
('2','4','104','Aileriomo Jumoke','Lekki','7086298026'),
('3','5','105','Lekan Joshua','Agege','7096299027'),
('4','6','106','Peace Ojo','Ajah','9066265022'),
('3','7','107','Lekan Joshua','Agege','7096299027'),
('5','8','108','Yetunde Deborah','Surulere','9066692826'),
('5','9','109','Yetunde Deborah','Surulere','9066692826'),
('4','10','110','Peace Ojo','Ajah','9066265022');

SELECT * FROM staff_nurse;

INSERT INTO Doctor (Doctor_id,Patient_id,Patient_Name,Room_Number,Doctor_Name,Nurse_Name)
VALUES
('1','1','Ayomide Dorcas',"101",'Adeloye Feranmi','Sharon Odunjo'),
('2','2','Joseph matthew','102','Tewobola Temitope','Aileriomo Jumoke'),
('3','3','Yemisi Okocha','103','Adediji matthew','Sharon Odunjo'),
('4','4','Lukka Kenedy','104','Susanna ihinrere','Aileriomo Jumoke'),
('5','5','Ejike Ezelaka','105','Adedeji Michael','Lekan Joshua'),
('2','6','Ezekiel Ganye','106','Tewobola Temitope','Peace Ojo'),
('4','7','Solomo Bolaji','107','Susanna ihinrere','Lekan Joshua'),
('5','8','Kemisola Yetunde','108','Adedeji Michael','Yetunde Deborah'),
('1','9','Kaka Esther','109','Adeloye Feranmi','Yetunde Deborah'),
('3','10','Naomi Edet','110','Adediji Matthew','Peace Ojo');

SELECT * FROM doctor;

-- GET THE DETAILS OF ALL THE PATIENTS ASSIGNED TO THE DOCTOR WITH THE ID OF 3

SELECT * FROM doctor WHERE Doctor_id = 3;

-- THE PATIENT WITH THE ID OF 4 WAS CHANGE TO ANOTHER ROOM.LET NEW ROOM BE REFLECTED.alter

UPDATE patient SET Room_Number = 114 WHERE patient_id = 4;

-- ALTER THE PATIENT TABLE AND ADD STATUS AS COLUMN, THE STATUS COLUMN WILL CONTAIN PAID,UNPAID,PARTLY PAID

ALTER TABLE patient ADD COLUMN Status Varchar(20);

UPDATE patient SET Status = 'Paid' WHERE Patient_id = 1;
UPDATE patient SET Status = 'Unpaid' WHERE patient_id = 2;
UPDATE patient SET Status = 'Paid' WHERE patient_id = 3;
UPDATE patient SET Status = 'Partly_Paid' WHERE patient_id = 4;
UPDATE patient SET Status = 'Unpaid' WHERE patient_id = 5;
UPDATE patient SET Status = 'Paid' WHERE patient_id = 6;
UPDATE patient SET Status = 'Partly_Paid' WHERE patient_id = 7;
UPDATE patient SET Status = 'Unpaid' WHERE patient_id = 8;
UPDATE patient SET Status = 'Partly_Paid' WHERE patient_id = 9;
UPDATE patient SET Status = 'Paid' WHERE patient_id = 10;
 SELECT * FROM patient;
-- USING IF STATEMENT AND COMPUTED COLUMN SHOW THE TRUE VALUE OF STATUS OF PAID AS COMPLETED, UNPAID AS INCOMPLETE AND PARTLY PAID AS INSTALLMENT 

SELECT *,
IF(Status = 'paid','Completed',
IF(Status ='unpaid', 'Incompleted',
IF(Status ='Partly_paid','Installment','unkwown'))) AS Payment FROM patient;

-- DISPLAY ALL THE PATIENTS THAT HAVE FULLY PAID

SELECT * FROM patient WHERE Status = 'paid';

-- ALTER THE NURSE TABLE AND ADD COLUMN NAME SALARY AND ENTER VALUES VARYING FROM 200000 TO 900000.

ALTER TABLE nurse ADD COLUMN Salary INT;

UPDATE nurse SET Salary = '300000' WHERE patient_id= 1;
UPDATE nurse SET Salary = 400000 WHERE patient_id = 2;
UPDATE nurse SET Salary = 600000 WHERE patient_id = 3;
UPDATE nurse SET Salary = 700000 WHERE patient_id = 4;
UPDATE nurse SET Salary = 800000 WHERE patient_id = 5;
UPDATE nurse SET Salary = '300000' WHERE patient_id= 6;
UPDATE nurse SET Salary = 400000 WHERE patient_id = 7;
UPDATE nurse SET Salary = 600000 WHERE patient_id = 8;
UPDATE nurse SET Salary = 700000 WHERE patient_id = 9;
UPDATE nurse SET Salary = 800000 WHERE patient_id = 10;

SELECT * FROM Staff_nurse;

-- GET THE AVERAGE SALARY OF NURSE 

 SELECT AVG(Salary) FROM Staff_nurse;
 
 -- IN THE NURSE TABLE, SHOW ALL THE PATIENT_ID FOR THE NURSE WITH THE ID OF 3 AND 
 -- USE THE PATIENT_ID TO GET THE FULL DETAILS OF THE PATIENTS
 
SELECT * 
FROM patient p
JOIN staff_Nurse s
ON p.Patient_id = S.Patient_id  WHERE Nurse_id = 3;
 -- SUBQUERY GET THE NAMES AND ID OF NURSES AND DISPLAY THE TOTAL SUM OF SALARY
 
 SELECT Nurse_Name,Nurse_id,
(SELECT SUM(Salary) FROM nurse) AS Total_salary FROM nurse;

-- JOIN DOCTOR AND PATIENT TABLE WITH PRIMARY KEY
SELECT * FROM patient JOIN doctor ON patient.patient_id = doctor.patient_id;

-- RENAME FROM NURSE TABLE TO Nurse_ STAFF

ALTER TABLE nurse RENAME TO Staff_Nurse;

UPDATE Staff_Nurse SET Salary = Salary + 20000 WHERE Address = 'Surulere';
 
SET SQL_SAFE_UPDATES = 0;

UPDATE Staff_Nurse 
SET Salary = Salary + 20000 
WHERE Address = 'Surulere';

SET SQL_SAFE_UPDATES = 1;  