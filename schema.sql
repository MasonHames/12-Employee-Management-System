/*Base code provided by instructor*/
/*checks, drops, and creates DB*/
DROP DATABASE IF EXISTS employees_DB;
CREATE DATABASE employees_DB;
/*requires use of created DB*/
USE employees_DB;
/*Creates the dept table for DB*/
CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);
/*Creates the role table for the DB*/
CREATE TABLE role (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department 
  FOREIGN KEY (department_id) 
  REFERENCES department(id) 
  ON DELETE CASCADE
);
/*creates employee table for the DB*/
CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role 
  FOREIGN KEY (role_id) 
  REFERENCES role(id) 
  ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager 
  FOREIGN KEY (manager_id) 
  REFERENCES employee(id) 
  ON DELETE SET NULL
);