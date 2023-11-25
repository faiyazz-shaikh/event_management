const jwt = require('jsonwebtoken');
const User = require('../models/userModel');
const { catchAsync } = require('../utills/catchAsync');

const getToken = (id) => {
  return jwt.sign({ id }, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  });
};

const createAndSendToken = (user, req, res, statusCode) => {
  const token = getToken(user._id);

  // Remove password from output
  user.password = undefined;

  res.status(statusCode).json({
    status: 'success',
    token,
    data: { user },
  });
};

exports.signUp = catchAsync(async (req, res, next) => {
  /// we can't put all of the field which user have shared like, token, dates, roles etc..
  const newUser = await User.create({
    name: req.body.name,
    email: req.body.email,
    password: req.body.password,
    passwordConfirm: req.body.passwordConfirm,
  });
  createAndSendToken(newUser, req, res, 201);
});

exports.login = catchAsync(async (req, res, next) => {
  const { email, password } = req.body;

  // check email is provided
  if (!email || !password) {
    return res.status(400).json({
      status: 'Fail',
      message: 'Please prviode email and password field',
    });
  }

  // get user from the email and then compare provided password
  const user = await User.findOne({ email }).select('+password');
  if (!user || !(await user.checkPasswords(password, user.password))) {
    return res.status(401).json({
      status: 'Fail',
      message: 'Please provide valid email and password',
    });
  }

  createAndSendToken(user, req, res, 200);
});
