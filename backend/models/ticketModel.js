const mongoose = require('mongoose');

const ticketSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.ObjectId,
    ref: 'User',
    require: ['Ticket must belongs to an user'],
  },
  event: {
    type: mongoose.Schema.ObjectId,
    ref: 'Event',
    require: [true, 'Ticket must belongs to an event'],
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
    require: [true, 'Purchase date is required for ticket'],
  },
});

const Ticket = new mongoose.model('Ticket', ticketSchema);

module.exports = Ticket;
