CREATE DATABASE IF NOT EXISTS workers;

USE workers;

CREATE TABLE IF NOT EXISTS employees(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    salary BIGINT NOT NULL
);

INSERT INTO employees (id, first_name, last_name, salary) VALUES (null, 'Oleg', 'Turin', 200000);

INSERT INTO employees (id, first_name, last_name, salary) VALUES (null, 'Maksim', 'Kuznetsov', 70000);

INSERT INTO employees (id, first_name, last_name, salary) VALUES (null, 'Ilya', 'Panin', 25000);

INSERT INTO employees (id, first_name, last_name, salary) VALUES (null, 'Roma', 'Chernukhin', 22000);

#Создаём вторую таблицу для должностей

CREATE TABLE IF NOT EXISTS employees_position(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
    employee_position VARCHAR(30) NOT NULL
);

INSERT INTO employees_position (id, employee_position) VALUES (null, 'Director');
INSERT INTO employees_position (id, employee_position) VALUES (null, 'Manager');
INSERT INTO employees_position (id, employee_position) VALUES (null, 'Consultant');

#Добавляем поле в employees

ALTER TABLE employees ADD employee_position_id INTEGER NOT NULL;

#Создаём связь между сотрудником и должностью

UPDATE employees SET employee_position_id=1 WHERE id=1;
UPDATE employees SET employee_position_id=2 WHERE id=2;
UPDATE employees SET employee_position_id=3 WHERE id IN (3,4);

#Все сотрудники с зарплатами меньше 30 000 рублей

SELECT worker.id, worker.first_name, worker.last_name, pos.employee_position, worker.salary 
FROM employees worker
INNER JOIN employees_position pos ON worker.employee_position_id = pos.id
WHERE salary < 30000;

#Все консультанты с зарплатой меньше 30000 рублей

SELECT worker.id, worker.first_name, worker.last_name, pos.employee_position, worker.salary 
FROM employees worker
INNER JOIN employees_position pos ON worker.employee_position_id = pos.id
WHERE salary < 30000 and employee_position='Consultant'