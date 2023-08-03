CREATE DATABASE university_info;
CREATE TABLE professors (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    department VARCHAR(50),
    office_location VARCHAR(50),
    phone_number VARCHAR(20)
);

CREATE TABLE students (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    major VARCHAR(50),
    year INT,
    phone_number VARCHAR(20)
);

CREATE TABLE courses (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    code VARCHAR(10) NOT NULL UNIQUE,
    department VARCHAR(50),
    description VARCHAR(255),
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professors(id)
);

CREATE TABLE lectures (
    id INT PRIMARY KEY,
    course_id INT,
    date DATETIME,
    topic VARCHAR(50),
    location VARCHAR(50),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE study_results (
    id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade FLOAT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE awards (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE certifications (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE shops (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE companies (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    industry VARCHAR(50),
    website VARCHAR(255),
    contact_person VARCHAR(50),
    contact_email VARCHAR(50),
    phone_number VARCHAR(20)
);

CREATE TABLE technologies (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    website VARCHAR(255)
);

CREATE TABLE security (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE managers (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone_number VARCHAR(20),
    department VARCHAR(50)
);

CREATE TABLE employers (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone_number VARCHAR(20),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES companies(id)
);

CREATE TABLE student_restaurants (
    student_id INT,
    restaurant_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

CREATE TABLE student_shops (
    student_id INT,
    shop_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (shop_id) REFERENCES shops(id)
);

CREATE TABLE company_technologies (
    company_id INT,
    technology_id INT,
    FOREIGN KEY (company_id) REFERENCES companies(id),
    FOREIGN KEY (technology_id) REFERENCES technologies(id)
);