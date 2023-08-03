-- Create database
CREATE DATABASE traffic_system;

-- Use database
USE traffic_system;

-- Create table for states
CREATE TABLE State (
  state_id INT PRIMARY KEY AUTO_INCREMENT,
  state_name VARCHAR(50) NOT NULL
);

-- Create table for shops
CREATE TABLE Shop (
  shop_id INT PRIMARY KEY AUTO_INCREMENT,
  shop_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state_id INT NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  FOREIGN KEY (state_id) REFERENCES State(state_id)
);

-- Create table for restaurants
CREATE TABLE Restaurant (
  restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
  restaurant_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state_id INT NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  FOREIGN KEY (state_id) REFERENCES State(state_id)
);

-- Create table for hotels
CREATE TABLE Hotel (
  hotel_id INT PRIMARY KEY AUTO_INCREMENT,
  hotel_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state_id INT NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  FOREIGN KEY (state_id) REFERENCES State(state_id)
);

-- Create table for individuals
CREATE TABLE Individual (
  individual_id INT PRIMARY KEY AUTO_INCREMENT,
  individual_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state_id INT NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  FOREIGN KEY (state_id) REFERENCES State(state_id)
);

-- Create table for schools
CREATE TABLE School (
  school_id INT PRIMARY KEY AUTO_INCREMENT,
  school_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state_id INT NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  FOREIGN KEY (state_id) REFERENCES State(state_id)
);

-- Createtable for offices
CREATE TABLE Office (
  office_id INT PRIMARY KEY AUTO_INCREMENT,
  office_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state_id INT NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  FOREIGN KEY (state_id) REFERENCES State(state_id)
);

-- Create table for companies
CREATE TABLE Company (
  company_id INT PRIMARY KEY AUTO_INCREMENT,
  company_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state_id INT NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  FOREIGN KEY (state_id) REFERENCES State(state_id)
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

-- Create table for shipments
CREATE TABLE Shipment (
  shipment_id INT PRIMARY KEY AUTO_INCREMENT,
  shipment_type VARCHAR(255) NOT NULL,
  shipment_weight DECIMAL(10,2) NOT NULL,
  shipment_date DATE NOT NULL,
  sender_id INT NOT NULL,
  receiver_id INT NOT NULL,
  FOREIGN KEY (sender_id) REFERENCES Shop(shop_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES Restaurant(restaurant_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES Hotel(hotel_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES Individual(individual_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES School(school_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES Office(office_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES Company(company_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES Hospital(hospital_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES Shop(shop_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES Restaurant(restaurant_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES Hotel(hotel_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES Individual(individual_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES School(school_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES Office(office_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES Company(company_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES Hospital(hospital_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create table for traffic
CREATE TABLE Traffic (
  traffic_id INT PRIMARY KEY AUTO_INCREMENT,
  traffic_type VARCHAR(255) NOT NULL,
  traffic_date DATE NOT NULL,
  sender_id INT NOT NULL,
  receiver_id INT NOT NULL,
  FOREIGN KEY (sender_id) REFERENCES Shop(shop_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES Restaurant(restaurant_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES Hotel(hotel_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES Individual(individual_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES School(school_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES Office(office_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES Company(company_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES Hospital(hospital_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES Shop(shop_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES Restaurant(restaurant_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES Hotel(hotel_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES Individual(individual_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES School(school_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES Office(office_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES Company(company_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES Hospital(hospital_id) ON DELETE CASCADE ON UPDATE CASCADE
);