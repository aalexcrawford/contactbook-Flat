CREATE TABLE users (
    user_id INT NOT NULL PRIMARY KEY,
    title VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    suffix VARCHAR(50),
    gender VARCHAR(50)
);

CREATE TABLE addresses (
    user_id INT REFERENCES users(user_id),
    address VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR (50),
    postal_code VARCHAR(50),
    address_type VARCHAR(50)
);

CREATE TABLE work_address (
    user_id INT REFERENCES users(user_id),
    work_building_number VARCHAR(50),
    work_street VARCHAR(50),
    work_street_suffix VARCHAR(50),
    work_suite_number VARCHAR(50),
    work_city VARCHAR(50),
    work_state VARCHAR(50),
    work_postal_code VARCHAR(50),
    work_address_type VARCHAR(50)
);

CREATE TABLE socialTypes (
    user_id INT REFERENCES users(user_id),
    social_media VARCHAR(1000),
    social_media_type VARCHAR(1000)
);

CREATE TABLE emails (
    user_id INT REFERENCES users(user_id),
    email VARCHAR(50),
    email_type VARCHAR(50)
);

CREATE TABLE phone_numbers (
    user_id INT REFERENCES users(user_id),
    phone VARCHAR(50),
    phone_type VARCHAR(50)
);

INSERT INTO users (user_id, title, first_name, last_name, suffix, gender)
SELECT id, title, first_name, last_name, suffix, gender
FROM contactbook_flat;

INSERT INTO addresses (user_id, address, city, state, postal_code, address_type)
SELECT id, address1, city, state, postal_code, 'Home'
FROM contactbook_flat;

INSERT INTO work_address (user_id, work_building_number, work_street, work_street_suffix, work_suite_number, work_city, work_state, work_postal_code, work_address_type)
SELECT id, work_building_number, work_street, work_street_suffix, work_suite_number, work_city, work_state, work_postal_code, 'Work'
FROM contactbook_flat;

INSERT INTO socialTypes (user_id, social_media, social_media_type)
SELECT id, social_media1, 'URL'
FROM contactbook_flat;

INSERT INTO socialTypes (user_id, social_media, social_media_type)
SELECT id, social_media2, 'URL'
FROM contactbook_flat;

INSERT INTO emails (user_id, email, email_type)
SELECT id, home_email, 'Personal Email'
FROM contactbook_flat;

INSERT INTO emails (user_id, email, email_type)
SELECT id, work_email, 'Work Email'
FROM contactbook_flat;

INSERT INTO emails (user_id, email, email_type)
SELECT id, other_email, 'Other Email'
FROM contactbook_flat;

INSERT INTO phone_numbers (user_id, phone, phone_type)
SELECT id, home_phone, 'Home Phone'
FROM contactbook_flat;

INSERT INTO phone_numbers (user_id, phone, phone_type)
SELECT id, work_phone, 'Work Phone'
FROM contactbook_flat;