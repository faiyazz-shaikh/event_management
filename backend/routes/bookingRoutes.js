const express = require('express');
const authController = require('./../controllers/authController');
const bookingController = require('./../controllers/bookingController');

const bookingRouter = express.Router();

bookingRouter.post(
  '/book-event/:id',
  authController.protect,
  bookingController.bookEvent
);

module.exports = bookingRouter;
