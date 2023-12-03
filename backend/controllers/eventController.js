const Event = require('../models/eventModel');
const { catchAsync } = require('../utills/catchAsync');

exports.createEvent = catchAsync(async (req, res, next) => {
  const event = await Event.create(req.body);

  res.status(201).json({
    status: 'success',
    data: {
      event,
    },
  });
});

exports.getEvent = catchAsync(async (req, res, next) => {
  const event = await Event.findById(req.params.id);

  res.status(200).json({
    status: 'success',
    data: {
      event,
    },
  });
});

exports.getAllEvents = async (req, res, next) => {
  const allEvents = await Event.find();

  res.status(200).json({
    status: 'sccess',
    data: {
      allEvents,
    },
  });
};

exports.updateEvent = catchAsync(async (req, res, next) => {
  const updatedEvent = req.body;

  // 1. find the event
  const event = await Event.findById(req.params.id);

  // event not found
  if (!event) {
    return res.status(400).json({
      message: 'Event Not found',
    });
  }

  // 2. check the date and time can't update on going or past event
  const currentTime = new Date();
  const eventTime = new Date(
    event.date.toISOString().split('T')[0] + 'T' + event.time
  );

  if (currentTime > eventTime) {
    return res.status(404).json({
      message: 'Can not update even day before',
    });
  }
  delete updatedEvent.createdAt;
  delete updatedEvent.updatedAt;

  Object.assign(event, updatedEvent);

  await event.save();

  res.status(200).json({
    status: 'success',
    data: {
      event,
    },
  });
  // 3. for future if you update that will notify user who has subscribed
});
