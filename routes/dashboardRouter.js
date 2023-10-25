const express = require("express");
const router = express.Router();
const DashboardController = require("../controllers/admin/dashboardController");

router.get("/", DashboardController.viewDashboard);

module.exports = router;
