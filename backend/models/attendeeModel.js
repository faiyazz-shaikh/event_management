const { default: mongoose } = require('mongoose');

const attendeeSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.ObjectId,
    ref: 'User',
    required: [true, 'Attendee must have a user'],
  },
  event: {
    type: mongoose.Schema.ObjectId,
    ref: 'Event',
    required: [true, 'Attendee belongs to Event'],
  },
  registrationDate: {
    type: Date,
    required: [true, 'Please provide registeration date'],
    default: Date.now(),
  },
});

const AttendeeModel = mongoose.model('Attendee', attendeeSchema);

module.exports = AttendeeModel;
