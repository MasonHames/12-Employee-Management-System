/*Use company db*/
USE companyDB;

/*Create seed data for department*/
INSERT INTO departments (name)
VALUES ("Marketing"),("Engineering"),("Human Resources");

/*Create seed data for role table*/
INSERT INTO role (title, salary, department_id)

VALUES ("Mechanical Engineer",68000,(SELECT id FROM department
WHERE name="Engineering")),

("Electrical Engineer",78000,(SELECT id FROM department
WHERE name="Engineering")),

("Industrial Engineer",68000,(SELECT id FROM department
WHERE name="Engineering")),

("Manager",93000,(SELECT id FROM department
WHERE name="Engineering")),

("Marketing Specialist",45000,(SELECT id FROM department
WHERE name="Marketing")),

("Senior Marketing Specialist",86000,(SELECT id FROM department
WHERE name="Marketing")),

("Manager",930000,(SELECT id FROM department
WHERE name="Marketing")),

("Associate",50000,(SELECT id FROM department
WHERE name="Human Resources")),

("Director",110000,(SELECT id FROM department
WHERE name="Human Resources"));

/*Create seed data for employee*/
INSERT INTO employee (first_name,last_name,role_id,manager_id)
VALUES ("John", "Smith", (SELECT id FROM role WHERE title = 'Manager'
AND department_id = (SELECT id FROM department WHERE name = "Engineering")),null);

INSERT INTO employee (first_name,last_name,role_id,manager_id)
VALUES ("Karae", "Jonston", (SELECT id FROM role WHERE title = 'Director'
AND department_id = (SELECT id FROM department WHERE name = "Human Resources")),null);

INSERT INTO employee (first_name,last_name,role_id,manager_id)
VALUES ("James", "Wright", (SELECT id FROM role WHERE title = 'Manager'
AND department_id = (SELECT id FROM department WHERE name = "Marketing")),null);

INSERT INTO employee (first_name,last_name,role_id,manager_id)
VALUES ("Caleb", "Baleb", (SELECT id FROM role WHERE title = 'Industrial Engineer'),
1);

INSERT INTO employee (first_name,last_name,role_id,manager_id)
VALUES ("Ally", "Deaton", (SELECT id FROM role WHERE title = 'Mechanical Engineer'),
1);

INSERT INTO employee (first_name,last_name,role_id,manager_id)
VALUES ("Jole", "Hotdog", (SELECT id FROM role WHERE title = 'Electrical Engineer'),
1);

INSERT INTO employee (first_name,last_name,role_id,manager_id)
VALUES ("Taylor", "Quick", (SELECT id FROM role WHERE title = 'Senior Marketing Specialist'),
2);

INSERT INTO employee (first_name,last_name,role_id,manager_id)
VALUES ("Sue", "Worker", (SELECT id FROM role WHERE title = 'Associate'),
3);

INSERT INTO employee (first_name,last_name,role_id,manager_id)
VALUES ("Cole", "Advert", (SELECT id FROM role WHERE title = 'Marketing Specialist'),
2);
