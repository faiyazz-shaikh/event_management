const mongoose = require('mongoose');

const ticketSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.ObjectId,
    ref: 'User',
    required: [true, 'Ticket must belongs to an user'],
  },
  event: {
    type: mongoose.Schema.ObjectId,
    ref: 'Event',
    required: [true, 'Ticket must belongs to an event'],
  },
  type: {
    type: String,
    enum: {
      values: ['General', 'VIP'],
      message: 'Category is either: General, VIP',
    },
    default: 'General',
  },
  purchaseDate: {
    type: Date,
    required: [true, 'Purchase date is required for ticket'],
    default: Date.now(),
  },
});

const Ticket = mongoose.model('Ticket', ticketSchema);

module.exports = Ticket;
