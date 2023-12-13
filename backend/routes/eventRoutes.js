const express = require('express');
const eventController = require('../controllers/eventController');
const authController = require('./../controllers/authController');

const eventRouter = express.Router();

// add event
eventRouter.post('/', authController.protect, eventController.createEvent);
eventRouter.get('/:id', authController.protect, eventController.getEvent);
eventRouter.get('/', authController.protect, eventController.getAllEvents);
//eventRouter.patch('/:id', eventController.updateEvent);

module.exports = eventRouter;
