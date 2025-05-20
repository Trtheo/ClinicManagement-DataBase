#  Clinic Booking System – MySQL Database

This project is a fully structured relational **Clinic Booking System** designed and implemented using **pure MySQL**. It demonstrates a real-world use case with normalized tables, proper constraints, and relationships.

---

##  Use Case

A small clinic that needs to manage:
- Patient records
- Doctor information
- Services offered
- Appointments scheduling
- Services provided per appointment

---

##  Technologies Used

- **MySQL**
- phpMyAdmin (via XAMPP, optional)
- SQL Scripts

---

##  Database Structure

###  Tables Created:
- `users` – for system login (admin/doctor)
- `patients` – stores patient records
- `doctors` – clinic's medical staff
- `services` – medical services offered
- `appointments` – booking table for patients and doctors
- `appointmentservices` – many-to-many relationship between appointments and services

---

##  Constraints Used

- **Primary Keys**
- **Foreign Keys**
- **NOT NULL**
- **UNIQUE**
- **ENUM** for predefined fields (e.g., gender, status, role)

---

##  Relationships

- **One-to-Many (1-M)**: Patients ↔ Appointments  
- **One-to-Many (1-M)**: Doctors ↔ Appointments  
- **Many-to-Many (M-M)**: Appointments ↔ Services via `appointmentservices`  
- **One-to-One (1-1)**: Users ↔ Doctors (optional system login)

---

##  How to Use

1. **Start XAMPP** and open **phpMyAdmin**
2. Create a new database:
   ```sql
   CREATE DATABASE clinickdatabase;
   USE clinickdatabase;
   ```

   **Import the .sql file provided:**

- This will create all tables with correct relationships and constraints

 **File Included**
clinic_booking_system.sql :  contains all CREATE TABLE statements



**Author**
- Theophile Niyigaba
- 📧 nitheophile10@gmail.com
- Computer and Software Engineer

