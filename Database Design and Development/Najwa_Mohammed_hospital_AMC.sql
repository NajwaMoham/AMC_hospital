CREATE DATABASE Najwa_Mohammed_hospital_AMC;

USE Najwa_Mohammed_hospital_AMC;
-- CREATE TABLES 
CREATE TABLE patient (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(60),
    patient_age INT,
    patient_idcard VARCHAR(60),
    patient_mobile BIGINT,
    patient_date_of_birth DATE,
    patient_gender VARCHAR(60),
    patient_address VARCHAR(60),
    patient_blood_type VARCHAR(60),
    patient_disease VARCHAR(60),
    record_id INT ,
    FOREIGN KEY (record_id) REFERENCES medicalRecord(record_id)
);
CREATE TABLE medicalRecord(
    record_id INT PRIMARY KEY,
    Diagnosis VARCHAR(60),
    date_of_examination DATE,
    medicines_id INT ,
    FOREIGN KEY (medicines_id) REFERENCES medicines(medicines_id)
);


CREATE TABLE doctor(
    doctor_id INT PRIMARY KEY,
    doctor_mobaile BIGINT,
    doctor_name VARCHAR(60),
    doctor_address VARCHAR(60),
    doctor_salary DECIMAL(38, 2),
    doctor_qualification VARCHAR(60),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)

);

CREATE TABLE department(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(60),
    department_manager VARCHAR(60),
    location_of_department VARCHAR(60)
);

CREATE TABLE appointment(
    appointment_id INT PRIMARY KEY,
    appointment_date DATE,
    appointment_time INT,
    patient_id INT,
    doctor_id INT,
    department_id INT,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE medicines(
    medicines_id INT PRIMARY KEY,
    medicines_type VARCHAR,
    medicines_description VARCHAR
);

ALTER TABLE Najwa_Mohammed_hospital_AMC.dbo.medicines
ALTER COLUMN medicines_type VARCHAR(50);

ALTER TABLE Najwa_Mohammed_hospital_AMC.dbo.medicines
ALTER COLUMN medicines_description VARCHAR(255);           -- Adjust the length according to your requirements

CREATE TABLE doctor_has_patient(
    patient_id INT,
    doctor_id INT,
    PRIMARY KEY (patient_id,doctor_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);



-- We will insert data inside these tables 
INSERT INTO patient (patient_id, patient_name, patient_age, patient_idcard, patient_mobile, patient_date_of_birth, patient_gender, patient_address, patient_blood_type, patient_disease, record_id)
VALUES
  (1, 'John Doe', 30, 'ID123456', 1234567890, '1992-05-15', 'Male', '123 Main St', 'O+', 'Flu', 41),
  (2, 'Jane Smith', 25, 'ID789012', 9876543210, '1997-08-22', 'Female', '456 Oak St', 'AB-', 'Allergies', 42),
  (3, 'Michael Johnson', 40, 'ID345678', 5555555555, '1982-11-10', 'Male', '789 Pine St', 'A+', 'Diabetes', 43),
  (4, 'Emily White', 22, 'ID901234', 9998887777, '2000-02-28', 'Female', '321 Elm St', 'B-', 'Asthma', 44),
  (5, 'David Brown', 35, 'ID567890', 4443332222, '1987-07-17', 'Male', '567 Birch St', 'O-', 'Hypertension', 45),
  (6, 'Olivia Taylor', 28, 'ID234567', 1112223333, '1994-09-05', 'Female', '876 Maple St', 'AB+', 'Migraine', 46),
  (7, 'William Turner', 45, 'ID890123', 6667778888, '1979-03-20', 'Male', '432 Pineapple St', 'B+', 'Arthritis', 47),
  (8, 'Sophia Miller', 32, 'ID456789', 3334445555, '1989-12-12', 'Female', '987 Cherry St', 'O+', 'Heart Disease', 48),
  (9, 'Daniel Wilson', 27, 'ID012345', 2221110000, '1995-06-08', 'Male', '543 Walnut St', 'A-', 'Epilepsy', 49),
  (10, 'Ava Anderson', 38, 'ID678901', 7778889999, '1983-04-25', 'Female', '654 Grape St', 'AB-', 'Cancer', 50);

INSERT INTO doctor (doctor_id, doctor_mobaile, doctor_name, doctor_address, doctor_salary, doctor_qualification, department_id)
VALUES
    (11, 1234567890, 'Dr. John Doe', '123 Main St', '50000', 'MD', 21),
    (12, 9876543210, 'Dr. Jane Smith', '456 Oak St', '60000', 'DO', 22),
    (13, 5551234567, 'Dr. Robert Johnson', '789 Pine St', '55000', 'MBBS', 23),
    (14, 9998887777, 'Dr. Emily Davis', '321 Cedar St', '70000', 'MD', 24),
    (15, 3334445555, 'Dr. Michael Brown', '654 Elm St', '65000', 'DO', 25),
    (16, 7776665555, 'Dr. Sarah White', '987 Maple St', '75000', 'MBBS', 26),
    (17, 1112223333, 'Dr. Christopher Lee', '234 Birch St', '60000', 'MD', 27),
    (18, 4445556666, 'Dr. Olivia Taylor', '567 Walnut St', '55000', 'DO', 28),
    (19, 8889990000, 'Dr. William Miller', '890 Pine St', '70000', 'MBBS', 29),
    (20, 6667778888, 'Dr. Emma Wilson', '123 Cedar St', '80000', 'MD', 30);

INSERT INTO department (department_id, department_name, department_manager, location_of_department)
VALUES
    (21, 'Cardiology', 'Dr. Alex Johnson', 'East Wing, 2nd Floor'),
    (22, 'Orthopedics', 'Dr. Samantha Smith', 'West Wing, 3rd Floor'),
    (23, 'Pediatrics', 'Dr. Michael Davis', 'North Wing, 1st Floor'),
    (24, 'Neurology', 'Dr. Emily White', 'South Wing, 4th Floor'),
    (25, 'Oncology', 'Dr. James Brown', 'West Wing, 2nd Floor'),
    (26, 'Gynecology', 'Dr. Olivia Taylor', 'East Wing, 1st Floor'),
    (27, 'Internal Medicine', 'Dr. William Miller', 'North Wing, 3rd Floor'),
    (28, 'Surgery', 'Dr. Emma Wilson', 'South Wing, 2nd Floor'),
    (29, 'ENT (Ear, Nose, Throat)', 'Dr. Christopher Lee', 'West Wing, 1st Floor'),
    (30, 'Dermatology', 'Dr. Sarah Johnson', 'East Wing, 3rd Floor');

INSERT INTO appointment (appointment_id, appointment_date, appointment_time, patient_id, doctor_id, department_id)
VALUES
    (31, '2024-01-15', 10, 1, 11, 21),
    (32, '2024-01-16', 14, 2, 12, 22),
    (33, '2024-01-17', 11, 3, 13, 23),
    (34, '2024-01-18', 15, 4, 14, 24),
    (35, '2024-01-19', 13, 5, 15, 25),
    (36, '2024-01-20', 9, 6, 16, 26),
    (37, '2024-01-21', 16, 7, 17, 27),
    (38, '2024-01-22', 12, 8, 18, 28),
    (39, '2024-01-23', 14, 9, 19, 29),
    (40, '2024-01-24', 17, 10, 20, 30);

INSERT INTO medicalRecord (record_id, Diagnosis, date_of_examination, medicines_id)
VALUES
    (41, 'Hypertension', '2024-01-15', 51),
    (42, 'Fractured Arm', '2024-01-16', 52),
    (43, 'Common Cold', '2024-01-17', 53),
    (44, 'Migraine', '2024-01-18', 54),
    (45, 'Bronchitis', '2024-01-19', 55),
    (46, 'Pregnancy Checkup', '2024-01-20', 56),
    (47, 'Diabetes', '2024-01-21', 57),
    (48, 'Appendicitis', '2024-01-22', 58),
    (49, 'Allergic Reaction', '2024-01-23', 59),
    (50, 'Lung Cancer', '2024-01-24', 60);

USE Najwa_Mohammed_hospital_AMC;
INSERT INTO Najwa_Mohammed_hospital_AMC.dbo.medicines (medicines_id, medicines_type, medicines_description)
VALUES
    (51, 'Pain', LEFT('Ibuprofen', 255)),
    (52, 'Anti', LEFT('Amoxicillin', 255)),
    (53, 'Deco', LEFT('Pseudoephedrine', 255)),
    (54, 'Pain', LEFT('Sumatriptan', 255)),
    (55, 'Bronc', LEFT('Albuterol', 255)),
    (56, 'Prenat', LEFT('Folic Acid', 255)),
    (57, 'Insulin', LEFT('Regular Insulin', 255)),
    (58, 'Pain', LEFT('Hydrocodoneg', 255)),
    (59, 'Anti', LEFT('Loratadine', 255)),
    (60, 'Chemo', LEFT('Paclitaxel', 255));

INSERT INTO doctor_has_patient (patient_id, doctor_id)
VALUES
    (1, 11),
    (2, 12),
    (3, 13),
    (4, 14),
    (5, 15),
    (6, 16),
    (7, 17),
    (8, 18),
    (9, 19),
    (10, 20);

-- Queries 
SELECT *
FROM patient 

SELECT *
FROM doctor

SELECT *
FROM department

SELECT *
FROM appointment

SELECT *
FROM medicalRecord

SELECT *
FROM doctor_has_patient

SELECT *
FROM medicines

SELECT doctor_id, doctor_name, doctor_qualification 
FROM doctor
WHERE department_id =25 

SELECT doctor_id, doctor_name, doctor_salary 
FROM doctor
WHERE doctor_qualification ='DO' 

SELECT medicines_type, medicines_description 
FROM medicines

SELECT DISTINCT Diagnosis 
FROM medicalRecord

SELECT DISTINCT patient_id, patient_name, patient_idcard, patient_gender, patient_blood_type, patient_disease 
FROM patient

SELECT department_id, COUNT(*) AS total_doctor 
FROM doctor 
GROUP BY department_id 

SELECT department_id, SUM(doctor_salary) AS total_salary 
FROM doctor 
GROUP BY department_id

SELECT department_id, MAX(doctor_salary) AS Maximum_salary, MIN(doctor_salary) AS Minumum_salary 
FROM doctor 
GROUP BY department_id

SELECT doctor_id, doctor_mobaile, doctor_name, doctor_address, doctor_salary 
FROM doctor 
WHERE doctor_salary>55000

SELECT AVG(doctor_salary) AS Averag_salary 
FROM doctor

SELECT SUM(doctor_salary) AS total_salary 
FROM doctor