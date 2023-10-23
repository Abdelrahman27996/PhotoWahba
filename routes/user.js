const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

//create, find, update, delete
router.get('/', function (req, res) {
    // Rendering dashboard.ejs page
    res.render('dashboard');
  });

  router.get('/signup-login', function (req, res) {
    // Rendering dashboard.ejs page
    res.render('signup-login');
  });

router.get('/users', userController.view );
router.post('/users',userController.createOrFind);



module.exports = router;
