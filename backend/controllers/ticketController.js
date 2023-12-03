const Ticket = require('../models/ticketModel');
const User = require('../models/userModel');
const { catchAsync } = require('../utills/catchAsync');

const createTicket = catchAsync(async (req, res, next) => {
  const { eventId, type } = req.body;

  // user will be get from auth middleware
  const user = await User.findById(req.body.email);
  const event = await Event.findById(eventId);
  const ticket = Ticket.create({ event, user, type });
});
