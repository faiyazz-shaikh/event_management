const Event = require('../models/eventModel');
const Booking = require('../models/bookingModel');
const Ticket = require('../models/ticketModel');
const Attendee = require('../models/attendeeModel');
const { catchAsync } = require('../utills/catchAsync');
const AppError = require('../utills/appError');

exports.bookEvent = catchAsync(async (req, res, next) => {
  /// Check the event is exist and it should be in the future

  const event = await Event.findById(req.params.id);
  if (!event) {
    return next(new AppError('event does not exist with this id', 404));
  }

  // Need to work
  const currentTime = new Date();
  const eventTime = new Date(
    event.date.toISOString().split('T')[0] + 'T' + event.time
  );

  if (currentTime > eventTime) {
    return next(new AppError('You can not book ongoging or past event', 400));
  }
  //   /// Check event is not book by the same user
  //   const booking =

  /// Add user as atendee for the event
  const ticket = await Ticket.findOne({ event: event.id, user: req.user.id });
  if (ticket) {
    console.log('ticket', ticket);
    return next(new AppError('Event is alrady booked', 400));
  }
  await Attendee.create({ event: event.id, user: req.user.id });
  await Booking.create({ event: event.id, user: req.user.id });
  await Ticket.create({ event: event.id, user: req.user.id });
  res.status(200).json({
    status: 'success',
    message: 'Event booked successfully',
  });
});
