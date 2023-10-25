// Import necessary modules
const mysql = require("mysql");
const bcrypt = require("bcrypt");
const dotenv = require('dotenv');
const session = require('express-session');
const MySQLStore = require('express-mysql-session')(session);

dotenv.config();

const dbConnectionOptions = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
};

const pool = mysql.createPool({
  connectionLimit: 100,
  ...dbConnectionOptions,
});

const sessionStore = new MySQLStore({
  ...dbConnectionOptions,
});

exports.login_get = (req, res) => {
  res.render("registration/login");
};

exports.login_post = (req, res) => {
  if (req.method === "POST") {
    const { username, password } = req.body;

    // Check if the username and password are provided
    if (!username || !password) {
      return res.status(400).send("Invalid request: Username and password are required.");
    }

    // Check if the provided username and password match admin credentials
    if (username === "Admin" && password === "Admin123_") {
      // Redirect the admin user to the dashboard
      res.redirect("/admin");
      return;
    }

    // Get a connection from the pool and validate the user
    pool.getConnection((err, connection) => {
      if (err) {
        console.error("Error getting a database connection: " + err);
        return res.status(500).send("Database error");
      }

      // Debugging: Log the provided username
      console.log("Provided username:", username);

      // Query the database to find the user
      connection.query(
        "SELECT * FROM user WHERE username = ?",
        [username],
        (err, rows) => {
          connection.release();
          if (err) {
            console.error("Error querying the database: " + err);
            return res.status(500).send("Database error");
          }

          // Debugging: Log the database rows for this username
          console.log("Rows for username", username, rows);

          // Check if a user was found in the database
          if (rows.length === 1) {
            // Check if the provided plain text password matches the one in the database
            const storedPassword = rows[0].password;
            if (password === storedPassword) {
              // Passwords match, user is authenticated
              req.session.user = {
                username: rows[0].username,
                password: storedPassword
              };
              console.log("User logged in");
              res.redirect("/");
            } else {
              // Passwords don't match, redirect to login
              console.log("Passwords don't match, redirect to login");
              res.redirect("/login");
            }
          } else {
            // User not found, redirect to login
            console.log("User not found, redirect to login");
            res.redirect("/login");
          }
        }
      );
    });
  }
};

