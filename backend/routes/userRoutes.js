const express = require('express');
const authController = require('./../controllers/authController');
const userController = require('./../controllers/userController');

const router = express.Router();

router.post('/signup', authController.signUp);
router.post('/login', authController.login);
router.post('/forgot-password', authController.forgotPassword);
router.post('/reset-password', authController.resetPassword);

router.patch(
  '/update-password',
  authController.protect,
  authController.updatePassword
);

router.get(
  '/user-profile',
  authController.protect,
  userController.getUserProfile
);

module.exports = router;
