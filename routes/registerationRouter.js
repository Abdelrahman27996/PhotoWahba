const express = require("express");
const login = require("../controllers/registration/loginController.js");
const signup = require("../controllers/registration/signupController.js");
const router = express.Router();


router.get("/", (req, res) => res.render("home/home"));

router.get("/login", login.login_get);
router.post("/login", login.login_post);

router.get("/signup", signup.signup_get);
router.post("/signup", signup.signup_post);

module.exports = router;

