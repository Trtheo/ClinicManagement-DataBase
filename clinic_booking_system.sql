-- Drop existing tables 
-- DROP TABLE IF EXISTS AppointmentServices, Appointments, Patients, Doctors, Services, Users;
-- Users Table (for admin login or doctor login)
CREATE TABLE
    Users (
        user_id INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(50) NOT NULL UNIQUE,
        password VARCHAR(100) NOT NULL,
        role ENUM ('admin', 'doctor') NOT NULL
    );

-- Patients Table
CREATE TABLE
    Patients (
        patient_id INT AUTO_INCREMENT PRIMARY KEY,
        full_name VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        phone VARCHAR(15),
        date_of_birth DATE,
        gender ENUM ('male', 'female', 'other'),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- Doctors Table
CREATE TABLE
    Doctors (
        doctor_id INT AUTO_INCREMENT PRIMARY KEY,
        full_name VARCHAR(100) NOT NULL,
        specialization VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        phone VARCHAR(15),
        user_id INT UNIQUE,
        FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE SET NULL
    );

-- Services Table
CREATE TABLE
    Services (
        service_id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL UNIQUE,
        description TEXT,
        price DECIMAL(10, 2) NOT NULL
    );

-- Appointments Table
CREATE TABLE
    Appointments (
        appointment_id INT AUTO_INCREMENT PRIMARY KEY,
        patient_id INT NOT NULL,
        doctor_id INT NOT NULL,
        appointment_date DATE NOT NULL,
        appointment_time TIME NOT NULL,
        status ENUM ('scheduled', 'completed', 'cancelled') DEFAULT 'scheduled',
        notes TEXT,
        FOREIGN KEY (patient_id) REFERENCES Patients (patient_id) ON DELETE CASCADE,
        FOREIGN KEY (doctor_id) REFERENCES Doctors (doctor_id) ON DELETE CASCADE
    );

-- Many-to-Many relationship between Appointments and Services
CREATE TABLE
    AppointmentServices (
        appointment_id INT,
        service_id INT,
        PRIMARY KEY (appointment_id, service_id),
        FOREIGN KEY (appointment_id) REFERENCES Appointments (appointment_id) ON DELETE CASCADE,
        FOREIGN KEY (service_id) REFERENCES Services (service_id) ON DELETE CASCADE
    );