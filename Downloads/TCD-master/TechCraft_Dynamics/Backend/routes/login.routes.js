const express = require('express');
const router = express.Router();
const { loginUser } = require('../controllers/login.controller');

router.post('/', loginUser);
router.get


module.exports = router;
