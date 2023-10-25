const mysql = require("mysql");
const pool = mysql.createPool({
  connectionLimit: 100,
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

exports.viewUsers = (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) {
      console.error("Error getting a database connection: " + err);
      return res.status(500).send("Database error");
    }

    connection.query("SELECT * FROM user", (err, rows) => {
      connection.release();

      if (err) {
        console.error("Error querying the database: " + err);
        return res.status(500).send("Database error");
      }

      res.render("users", { rows });
    });
  });
};

exports.searchUsers = (req, res) => {
  const searchTerm = req.body.search;
  pool.getConnection((err, connection) => {
    if (err) {
      console.error("Error getting a database connection: " + err);
      return res.status(500).send("Database error");
    }

    connection.query(
      "SELECT * FROM user WHERE first_name LIKE ?",
      ["%" + searchTerm + "%"],
      (err, rows) => {
        connection.release();

        if (err) {
          console.error("Error querying the database: " + err);
          return res.status(500).send("Database error");
        }

        res.render("users", { rows });
      }
    );
  });
};

exports.createUser = (req, res) => {
  const { first_name, last_name, email, phone } = req.body;
  if (!first_name || !last_name) {
    return res.status(400).send("Invalid request: first_name and last_name are required.");
  }

  pool.getConnection((err, connection) => {
    if (err) {
      console.error("Error getting a database connection: " + err);
      return res.status(500).send("Database error");
    }

    connection.query(
      "INSERT INTO user (first_name, last_name) VALUES (?, ?)",
      [first_name, last_name],
      (err, rows) => {
        connection.release();

        if (err) {
          console.error("Error inserting user into the database: " + err);
          return res.status(500).send("Error creating user.");
        }

        res.redirect("/users");
      }
    );
  });
};
