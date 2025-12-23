Vehicle Rental Management System (PostgreSQL)

This project demonstrates a relational database design for a Vehicle Rental Management System using PostgreSQL.
It includes table creation, ENUM types, relationships, and commonly used SQL queries such as JOIN, EXISTS, WHERE, GROUP BY, and HAVING.
 
Features

User management with roles (Admin, Customer)

Vehicle inventory with availability tracking

Booking system with date range and cost

Data integrity using primary and foreign keys

ENUM types for controlled values

Example queries for real-world operations

Technology Used

Database: PostgreSQL

SQL Concepts:

Primary Key

Foreign Key

ENUM

JOIN

EXISTS

WHERE

GROUP BY

HAVING



📂 Database Schema

1️⃣ Users Table
create type user_role_enum as enum ('admin', 'customer'); 
create table users(
user_id serial primary key,
name varchar(150) not null,
email varchar(150) not null unique,
password varchar(150) not null,
phone varchar(30) not null,
role user_role_enum not null );



2️⃣ Vehicles Table
create type vehicle_type_enum as enum ('car', 'bike', 'truck');
create type availability_status_enum as enum ('available', 'rented', 'maintenance');
create table vehicles (
vehicle_id serial primary key,
name varchar(100) not null,
type vehicle_type_enum not null,
model varchar(100),
registration_number varchar(50) unique not null,
rental_price decimal(10,2) not null,
status availability_status_enum not null );



3️⃣ Bookings Table
create type booking_status_enum as enum ('pending', 'confirmed', 'completed', 'cancelled'); 
create table bookings (
booking_id serial primary key,
user_id int not null references users(user_id),
vehicle_id int not null references vehicles(vehicle_id),
start_date date not null,
end_date date not null,
status booking_status_enum not null,
total_cost decimal(10,2) not null );
