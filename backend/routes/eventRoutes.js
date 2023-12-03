const express = require('express');
const eventController = require('../controllers/eventController');

const eventRouter = express.Router();

// add event
eventRouter.post('/', eventController.createEvent);
eventRouter.get('/:id', eventController.getEvent);
eventRouter.get('/', eventController.getAllEvents);
eventRouter.patch('/:id', eventController.updateEvent);

module.exports = eventRouter;
