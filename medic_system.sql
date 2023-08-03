-- Create database
CREATE DATABASE medic_system;

-- Use database
USE medic_system;

-- Create table for states
CREATE TABLE State (
  state_id INT PRIMARY KEY AUTO_INCREMENT,
  state_name VARCHAR(50) NOT NULL
);

-- Create table for hospitals
CREATE TABLE Hospital (
  hospital_id INT PRIMARY KEY AUTO_INCREMENT,
  hospital_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state_id INT NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  FOREIGN KEY (state_id) REFERENCES State(state_id)
);

-- Create table for doctors
CREATE TABLE Doctor (
  doctor_id INT PRIMARY KEY AUTO_INCREMENT,
  doctor_name VARCHAR(255) NOT NULL,
  specialization VARCHAR(255) NOT NULL,
  hospital_id INT NOT NULL,
  FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id)
);

-- Create table for patients
CREATE TABLE Patient (
  patient_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state_id INT NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  doctor_id INT NOT NULL,
  FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
  FOREIGN KEY (state_id) REFERENCES State(state_id)
);

-- Create table for prescriptions
CREATE TABLE Prescription (
  prescription_id INT PRIMARY KEY AUTO_INCREMENT,
  prescription_date DATE NOT NULL,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- Create table for drug stores
CREATE TABLE Drug_Store (
  drug_store_id INT PRIMARY KEY AUTO_INCREMENT,
  drug_store_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state_id INT NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  FOREIGN KEY (state_id) REFERENCES State(state_id)
);

-- Create table for medications
CREATE TABLE Medication (
  medication_id INT PRIMARY KEY AUTO_INCREMENT,
  medication_name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  drug_store_id INT NOT NULL,
  FOREIGN KEY (drug_store_id) REFERENCES Drug_Store(drug_store_id)
);


-- Create table for social networks
CREATE TABLE Social_Network (
  social_network_id INT PRIMARY KEY AUTO_INCREMENT,
  social_network_name VARCHAR(255) NOT NULL,
  website VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  state_id INT NOT NULL,
  FOREIGN KEY (state_id) REFERENCES State(state_id)
);

-- Create table for customers
CREATE TABLE Customer (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state_id INT NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  social_network_id INT NOT NULL,
  FOREIGN KEY (social_network_id) REFERENCES Social_Network(social_network_id),
  FOREIGN KEY (state_id) REFERENCES State(state_id)
);

-- Create table for orders
CREATE TABLE `Order` (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT NOT NULL,
  drug_store_id INT NOT NULL,
  medication_id INT NOT NULL,
  quantity INT NOT NULL,
  order_date DATE NOT NULL,
  amount_paid DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (drug_store_id) REFERENCES Drug_Store(drug_store_id),
  FOREIGN KEY (medication_id) REFERENCES Medication(medication_id)
);