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

// Function to hash and salt a password
const hashPassword = (password) => {
  // Generate a salt with a certain number of rounds (e.g., 10)
  const saltRounds = 10;

  // Use bcrypt to hash the password with the generated salt
  return bcrypt.hashSync(password, saltRounds);
};

exports.signup_get = (req, res) => {
  res.render("registration/signup");
};


exports.signup_post = (req, res) => {
  if (req.method === "POST") {
    const { first_name, last_name, username, password } = req.body;

    // Check if required data is provided
    if (!first_name || !last_name || !username || !password) {
      return res
        .status(400)
        .send(
          "Invalid request: first_name, last_name, username, and password are required."
        );
    }

    // Assume you have a function to hash and salt the password, e.g., hashPassword
    //const hashedPassword = hashPassword(password);

    // Get a connection from the pool and insert the new user
    pool.getConnection((err, connection) => {
      if (err) {
        console.error("Error getting a database connection: " + err);
        return res.status(500).send("Database error");
      }

      connection.query(
        "INSERT INTO user (first_name, last_name, username, password) VALUES (?, ?, ?, ?)",
        [first_name, last_name, username, password],
        (err, rows) => {
          connection.release();

          if (!err) {
            // Redirect to a success page or send a success response
            // For example, redirect to a user profile page
            req.session.user = {
              first_name: first_name,
              last_name: last_name,
              username: username,
              password: password,
            };
            res.redirect("/login");
          } else {
            console.error("Error inserting user into the database: " + err);
            res.status(500).send("Error creating user.");
          }
        }
      );
    });
  }
};
