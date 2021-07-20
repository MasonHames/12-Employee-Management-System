//Add dependencies
const mysql = require('mysql');
const inquirer = require('inquirer');
const cTable = require('console.table');

//set connection details for database
const connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '',
    database: 'employees_DB'
});