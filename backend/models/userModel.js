const mongoose = require('mongoose');
const validator = require('validator');

const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: [true, 'Please provide a name'],
  },
  email: {
    type: String,
    unique: true,
    lowercase: true,
    required: [true, 'Please provide a email address'],
    validate: [validator.isEmail, 'Please provide a valid email address'],
  },
  photo: {
    type: String,
  },
  password: {
    type: String,
    minLength: 8,
    required: [true, 'Please provide a password'],
    // This will be ignored from any get operation to the user (Select query)
    select: false,
  },
  passwordConfirm: {
    type: String,
    required: [true, 'Please provide a password confirm'],

    validate: {
      // This will only work on save and create
      // https://mongoosejs.com/docs/validation.html
      validator: function (el) {
        return el === this.password;
      },
      message: 'Password are not the same',
    },
    /// If some one changed password and someone is still logged in
    passwordChangedAt: Date,
    passwordResetToken: String,
    passwordResetExpires: Date,
    active: {
      type: Boolean,
      default: true,
      select: false,
    },
  },
});
const user = mongoose.model('User', userSchema);

module.exports = user;
