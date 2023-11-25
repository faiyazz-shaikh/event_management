const mongoose = require('mongoose');
const validator = require('validator');
const bcrypt = require('bcrypt');

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

// hash the password when provided
userSchema.pre('save', async function (next) {
  // check password is modidied
  if (!this.isModified('password')) return next();

  // hash the password
  this.password = await bcrypt.hash(this.password, 12);

  //delete the password confirm
  this.passwordConfirm = undefined;

  next();
});

// when the password has been changed
userSchema.pre('save', function (next) {
  if (!this.isModified('password') || this.isNew) return next();

  this.passwordChangedAt = Date.now() - 1000;

  next();
});

userSchema.methods.checkPasswords = async function (password, hashedPassword) {
  return await bcrypt.compare(password, hashedPassword);
};

const User = mongoose.model('User', userSchema);

module.exports = User;
