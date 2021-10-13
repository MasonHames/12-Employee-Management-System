USE employDB;

INSERT INTO departments (name)
VALUES
    ('Admin'),
    ('R&D'),
    ('Marketing'),
    ('Sales'),
    ('Office');

INSERT INTO role (title, salary, department_id)
VALUES
    ('Administrative Assistant', 1000000, 1),
    ('Executive Assistant', 800000, 1),
    ('Executive Assistant`s Assistant', 600000, 1),
    ('Sinor Software Engineer', 400000, 2),
    ('Software Engineer', 350000, 2),
    ('Junior Software Engineer', 250000, 2),
    ('Marketing Manager', 350000, 3),
    ('Customer Service Representative', 250000, 3),
    ('Sales Manager', 125000, 4),
    ('Apprentice', 90000, 5),
    ('Intern', 50000, 5);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES
    ('Mark', 'Dougles', 1, 1),
    ('Mac', 'Shaww', 2, 1),
    ('Par', 'Ker', 3, 2),
    ('Salim', 'Preece', 3, 2),
    ('Zack', 'Thomas', 3, 2),
    ('Arda', 'Jinn', 4, 1),
    ('Dayna', 'Glenn', 4, 1),
    ('Marrit', 'Gally', 5, 2),
    ('Shark', 'Shan', 5, 2),
    ('Barnk', 'Io', 6, 2),
    ('Kit', 'Fisto', 6, 2),
    ('Samantha', 'Barton', 6, 2),
    ('Tyler', 'Watson', 7, 2),
    ('Michael','Palmer', 7, 2),
    ('James', 'Wilson', 8, 2),
    ('Ven', 'Zallow', 8, 2),
    ('Jacob', 'Nugue', 9, 1),
    ('Fred', 'Barr', 9, 3),
    ('Kellie', 'Tran', 10, 3),
    ('Luke', 'Markman', 11, 6),
    ('Matthew', 'Markman', 11, 6);