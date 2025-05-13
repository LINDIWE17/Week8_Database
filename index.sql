CREATE DATABASE clinic_management;
USE clinic_management;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100) NOT NULL
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Patients (name, email, phone) VALUES 
('Lindiwe Mphuthi', 'lindiwe@example.com', '0712345678'),
('Thabo Nkosi', 'thabo@example.com', '0723456789'),
('Zanele Khumalo', 'zanele@example.com', '0734567890'),
('Sipho Dlamini', 'sipho@example.com', '0745678901');

INSERT INTO Doctors (name, specialty) VALUES 
('Dr. Smith', 'Cardiology'),
('Dr. Patel', 'Dermatology'),
('Dr. Jones', 'Pediatrics'),
('Dr. Ngubane', 'Orthopedics');


INSERT INTO Appointments (patient_id, doctor_id, appointment_date) VALUES 
(1, 1, '2025-05-15 10:00:00'),
(2, 2, '2025-05-16 14:30:00'),
(3, 1, '2025-05-17 09:00:00'),
(4, 3, '2025-05-18 11:00:00');

SELECT Appointments.appointment_id, Patients.name AS Patient, Doctors.name AS Doctor, 
       Doctors.specialty, Appointments.appointment_date
FROM Appointments
JOIN Patients ON Appointments.patient_id = Patients.patient_id
JOIN Doctors ON Appointments.doctor_id = Doctors.doctor_id;