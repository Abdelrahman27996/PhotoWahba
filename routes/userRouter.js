const express = require("express");
const router = express.Router();
const UserController = require("../controllers/admin/userController");

router.get("/", UserController.viewUsers);
router.post("/", UserController.createUser);
router.post("/", UserController.searchUsers);
// router.post("/", UserController.createUser);

module.exports = router;
