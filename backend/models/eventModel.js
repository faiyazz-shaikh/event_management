const mongoose = require('mongoose');

const eventSchema = new mongoose.Schema({
  title: {
    type: String,
    required: [true, 'Please provide event title'],
    minlength: [3, 'Title should be more than 3 character'],
  },
  description: {
    type: String,
    required: [true, 'Please provide event description'],
  },
  date: {
    type: Date,
    required: [true, 'Please provide date for an event'],
    validate: {
      validator: function (value) {
        // Ensure the date is greater than today
        return value > new Date();
      },
      message: 'Event date must be in the future.',
    },
  },
  time: {
    type: String,
    required: [true, 'Please provide time for an event'],
    validate: {
      validator: function (value) {
        // Validate time format (HH:mm:ss)
        const timeRegex = /^(?:[01]\d|2[0-3]):[0-5]\d:[0-5]\d$/;
        return timeRegex.test(value);
      },
      message: 'Invalid time format. Please use HH:mm:ss.',
    },
  },
  location: {
    type: String,
    required: [true, 'Please provide a location'],
  },
  category: {
    type: String,
    enum: {
      values: ['Concert', 'Conference', 'Party', 'Workshop', 'Other'],
      message:
        'Category is either: Concert, Conference, Party, Workshop, Other',
    },
    default: 'Conference',
  },
  capacity: {
    type: Number,
    default: 5,
  },
  //   createdBy: {
  //     type: Schema.Types.ObjectId,
  //     ref: 'User',
  //   },
  // update when it's fresh document
  createdAt: {
    type: Date,
    default: Date.now(),
  },
  updatedAt: {
    type: Date,
    default: Date.now(),
  },
});

const Event = mongoose.model('Event', eventSchema);

module.exports = Event;
