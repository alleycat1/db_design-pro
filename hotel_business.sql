-- Create database
CREATE DATABASE hotel_business;

-- Use database
USE hotel_business;

-- Create table for hotels
CREATE TABLE Hotel (
  hotel_id INT PRIMARY KEY AUTO_INCREMENT,
  hotel_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL
);

-- Create table for rooms
CREATE TABLE Room (
  room_id INT PRIMARY KEY AUTO_INCREMENT,
  room_type VARCHAR(50) NOT NULL,
  room_number INT NOT NULL,
  floor INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  status ENUM('available', 'occupied', 'under maintenance') NOT NULL DEFAULT 'available',
  hotel_id INT NOT NULL,
  FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);

-- Create table for reservations
CREATE TABLE Reservation (
  reservation_id INT PRIMARY KEY AUTO_INCREMENT,
  guest_name VARCHAR(255) NOT NULL,
  guest_email VARCHAR(255) NOT NULL,
  guest_phone VARCHAR(20) NOT NULL,
  check_in_date DATE NOT NULL,
  check_out_date DATE NOT NULL,
  room_id INT NOT NULL,
  hotel_id INT NOT NULL,
  FOREIGN KEY (room_id) REFERENCES Room(room_id),
  FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);

-- Create table for restaurants
CREATE TABLE Restaurant (
  restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
  restaurant_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL
);

-- Create table for menus
CREATE TABLE Menu (
  menu_id INT PRIMARY KEY AUTO_INCREMENT,
  menu_name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  restaurant_id INT NOT NULL,
  FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);

-- Create table for tours
CREATE TABLE Tour (
  tour_id INT PRIMARY KEY AUTO_INCREMENT,
  tour_name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  duration INT NOT NULL,
  hotel_id INT NOT NULL,
  FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);

-- Create table for casinos
CREATE TABLE Casino (
  casino_id INT PRIMARY KEY AUTO_INCREMENT,
  casino_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL
);

-- Create table for games
CREATE TABLE Game (
  game_id INT PRIMARY KEY AUTO_INCREMENT,
  game_name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  casino_id INT NOT NULL,
  FOREIGN KEY (casino_id) REFERENCES Casino(casino_id)
);

-- Create table for guests
CREATE TABLE Guest (
  guest_id INT PRIMARY KEY AUTO_INCREMENT,
  guest_name VARCHAR(255) NOT NULL,
  guest_email VARCHAR(255) NOT NULL,
  guest_phone VARCHAR(20) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL
);

-- Create table for orders
CREATE TABLE `Order` (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  order_date DATE NOT NULL,
  guest_id INT NOT NULL,
  menu_id INT NOT NULL,
  quantity INT NOT NULL,
  amount_paid DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (guest_id) REFERENCES Guest(guest_id),
  FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);
-- Create table for payments
CREATE TABLE Payment (
  payment_id INT PRIMARY KEY AUTO_INCREMENT,
  reservation_id INT NOT NULL,
  guest_id INT NOT NULL,
  payment_date DATE NOT NULL,
  amount_paid DECIMAL(10,2) NOT NULL,
  payment_method VARCHAR(50) NOT NULL,
  FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id),
  FOREIGN KEY (guest_id) REFERENCES Guest(guest_id)
);