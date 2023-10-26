// Packages
const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');
const session = require('express-session');
const MySQLStore = require('express-mysql-session')(session); // To store sessions in MySQL



//schema 
// const UserModel = require("./models/user.js");

// Routes
const registrationRouter = require('./routes/registerationRouter');
const userRouter = require('./routes/userRouter');
const homeRouter = require('./routes/homeRouter');
const dashboardRouter = require('./routes/dashboardRouter'); // Import your dashboard router here

// Middlewares
// const { adminAuth } = require('./middlewares/userAuth');
dotenv.config();

// Variables
const app = express();
const port = process.env.PORT || 8080;

// Middlewares
app.use(express.static('public'));
app.set('view engine', 'ejs');
app.use(express.json()); // For parsing JSON data
app.use(express.urlencoded({ extended: true })); // For parsing form data



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

app.use(
  session({
    secret: 'sarah', 
    resave: false,
    saveUninitialized: true,
    store: sessionStore,
  })
);

app.use(homeRouter);
app.use(registrationRouter);
app.use('/admin', dashboardRouter); 
app.use('/admin/users', userRouter);


// Connect to DB
pool.getConnection((err, connection) => {
  if (err) {
    console.error('Database connection error: ' + err.message);
  } else {
    console.log('Connected as ID ' + connection.threadId);
  }
});

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});

// mongoose
//   .connect(process.env.mongooDbUrl)
//   .then(() => console.log("connected to Database"))
//   .catch(() => console.log(`Couldn't connect to Database`));