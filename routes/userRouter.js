const express = require("express");
const router = express.Router();
const UserController = require("../controllers/admin/userController");

router.get("/", UserController.viewUsers);
router.post("/", UserController.searchUsers);
router.post("/create", UserController.createUser);

module.exports = router;
