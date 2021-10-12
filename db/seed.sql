/*Use company db*/
use company_DB;
/*Create seed data for department*/
INSERT INTO departments (name)
VALUES ('Marketing'),
    ('Engineering'),
    ('Human Resources');
/*Create seed data for role table*/
INSERT INTO role (title, salary, department_id)
VALUES ('Mechanical Engineer', 68000, 2),
    ('Electrical Engineer', 78000, 2),
    ('Industrial Engineer', 68000, 2),
    ('Manager', 93000, 2),
    ('Marketing Specialist', 45000, 1),
    ('Senior Marketing Specialist', 86000, 1),
    ('Manager', 930000, 1),
    ('Associate', 50000, 3),
    ('Director', 110000, 3);
/*Create seed data for employee*/
INSERT INTO employee (first_name, last_name, role_id)
VALUES ('John', 'Smith', 1);
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ('Karae', 'Jonston', 2, 1);
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ('James', 'Wright', 3, 1);
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ('Caleb', 'Baleb', 4, 1);
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ('Ally', 'Deaton', 5, 2);
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ('Jole', 'Hotdog', 6, 2);
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ('Taylor', 'Quick', 7, 1);
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ('Sue', 'Worker', 8, 2);
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES (
        'Cole',
        'Advert',
        9,
        2;
)