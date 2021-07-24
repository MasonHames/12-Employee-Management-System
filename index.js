//Add dependencies
const mysql = require("mysql");
const inquirer = require("inquirer");
const cTable = require("console.table");

//set connection details for database
const connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "",
  database: "employees_DB",
});

const baseLandingChoices = [
  "View all departments",
  "View all roles",
  "View all employees",
  "Update employee role",
  "Add a department",
  "Add a role",
  "Add an employee",
  "Close",
];

const addDeptQuestions = [
  {
    type: "input",
    message: "What is the name of the department you would like to add?",
    name: "deptName",
  },
];

let addRoleQuestions = [
  {
    type: "input",
    message: "What is the title of the role?",
    name: "roleTitle",
  },
  {
    type: "input",
    message: "What is the salary of the role?",
    name: "roleSalary",
  },
  {
    type: "list",
    message: "What department is the role in?",
    name: "roleDept",
    choices: [],
  },
];

let addEmpQuestions = [
  {
    type: "input",
    message: "What is the first name of the employee?",
    name: "empFst",
  },
  {
    type: "input",
    message: "What is the last name of the employee?",
    name: "empLst",
  },
  {
    type: "list",
    message: "What is the role of the employee?",
    name: "empRol",
    choices: [],
  },
  {
    type: "list",
    message: "Who is the manager of the employee?",
    name: "empMng",
    choices: [],
  },
];

let upEmpRolQuestions = [
  {
    type: "list",
    message: "Which employee's role do you want to update?",
    name: "upEmp",
    choices: [],
  },
  {
    type: "list",
    message: "What is the employee's new role?",
    name: "newRol",
    choices: [],
  },
];

const addDept = () => {
  inquirer.prompt(addDeptQuestions).then((answers) => {
    let newDept = { name: answers.deptName };
    connection.query(`INSERT INTO department SET ?`, newDept, (err, res) => {
      if (err) throw err;
      console.log("Success!");
      init();
    });
  });
};

const addRole = () => {
  connection.query(`SELECT id AS value, name FROM department`, (err, res) => {
    if (err) throw err;
    addRoleQuestions[2].choices = res;
    inquirer.prompt(addRoleQuestions).then((answers) => {
      let newRol = {
        title: answers.roleTitle,
        salary: answers.roleSalary,
        department_id: answers.roleDept,
      };
      connection.query(`INSERT INTO role SET ?`, newRol, (err, res) => {
        if (err) throw err;
        console.log("Success!");
        init();
      });
    });
  });
};

const addEmp = () => {
  connection.query(
    `SELECT id AS value, title AS name FROM role`,
    (err, res) => {
      if (err) throw err;
      addEmpQuestions[2].choices = res;
      connection.query(
        `SELECT id AS value, concat(first_name,' ',last_name) as name FROM employee`,
        (err, res) => {
          if (err) throw err;
          addEmpQuestions[3].choices = res;
          inquirer.prompt(addEmpQuestions).then((answers) => {
            let newEmp = {
              first_name: answers.empFst,
              last_name: answers.empLst,
              role_id: answers.empRol,
              manager_id: answers.empMng,
            };
            connection.query(
              `INSERT INTO employee set ?`,
              newEmp,
              (err, res) => {
                if (err) throw err;
                console.log("Success!");
                init();
              }
            );
          });
        }
      );
    }
  );
};

const viewDepts = () => {
  connection.query(`SELECT * FROM department`, (err, res) => {
    if (err) throw err;
    console.table(res);
    init();
  });
};

const viewRoles = () => {
  connection.query(
    `SELECT r.id, r.title, r.salary, d.name AS department FROM role r
    LEFT JOIN department d on r.department_id = d.id`,
    (err, res) => {
      if (err) throw err;
      console.table(res);
      init();
    }
  );
};

const viewEmps = () => {
  connection.query(
    `SELECT e.id, e.first_name, e.last_name, r.title, 
    d.name AS department, r.salary, concat(e2.first_name,' ',e2.last_name) AS manager
    FROM employee e
    LEFT JOIN role r ON e.role_id = r.id
    LEFT JOIN department d ON r.department_id = d.id
    LEFT JOIN employee e2 on e2.id = e.manager_id`,
    (err, res) => {
      if (err) throw err;
      console.table(res);
      init();
    }
  );
};

const upEmpRol = () => {
  connection.query(
    `SELECT id AS value, concat(first_name,' ',last_name) AS name FROM employee`,
    (err, res) => {
      if (err) throw err;
      upEmpRolQuestions[0].choices = res;
      connection.query(
        `SELECT id AS value, title AS name FROM role`,
        (err, res) => {
          if (err) throw err;
          upEmpRolQuestions[1].choices = res;
          inquirer.prompt(upEmpRolQuestions).then((answers) => {
            let upEmp = {
              id: answers.upEmp,
              role_id: answers.newRol,
            };
            // Responce to inform the user of the successful/failed update
            connection.query(
              `UPDATE employee set role_id = ? WHERE id = ?`,
              [upEmp.role_id, upEmp.id],
              (err, res) => {
                if (err) throw err;
                console.log("Success!");
                init();
              }
            );
          });
        }
      );
    }
  );
};

//init for the app, load inquirer and display main menu
const init = () => {
  inquirer
    .prompt([
      {
        type: "list",
        choices: baseLandingChoices,
        message: "What do you need to do?",
        name: "userChoice",
      },
      // arrow function that handles the users answers
    ])
    .then((answers) => {
      switch (answers.userChoice) {
        case "View all departments":
          viewDepts();
          break;
        case "View all roles":
          viewRoles();
          break;
        case "View all employees":
          viewEmps();
          break;
        case "Update employee role":
          upEmpRol();
          break;
        case "Add a department":
          addDept();
          break;
        case "Add a role":
          addRole();
          break;
        case "Add an employee":
          addEmp();
          break;
        case "Close":
          connection.end();
      }
    });
};

//connect to database
connection.connect((err) => {
  if (err) throw err;
  console.log(`connected as id ${connection.threadId}`);
  init();
});
