const jwt = require('jsonwebtoken');
const { promisify } = require('util');
const User = require('../models/userModel');
const { catchAsync } = require('../utills/catchAsync');
const Email = require('../utills/email');
const crypto = require('crypto');

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

exports.protect = catchAsync(async (req, res, next) => {
  let token;

  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith('Bearer')
  ) {
    token = req.headers.authorization.split(' ')[1];
  }

  console.log(req.headers);

  if (!token) {
    return res
      .status(400)
      .json({ message: 'You are not logged in. Please logged in.' });
  }

  // verify token
  const decoded = await promisify(jwt.verify)(token, process.env.JWT_SECRET);

  // check the user still exist
  const user = await User.findById(decoded.id);

  if (!user) {
    return res.status(400).json({
      message: 'user belong to this token no longer exist',
    });
  }

  // check password is changed
  if (user.isPasswordChanged(decoded.iat)) {
    return res
      .status(401)
      .json({ message: 'User has changed password, please login agian' });
  }

  req.user = user;
  next();
});

exports.forgotPassword = catchAsync(async (req, res, next) => {
  // 1. Get the user based on mail
  const email = req.body.email;
  const user = await User.findOne({ email });

  console.log(user);

  if (!user) {
    return res.status(404).json({
      message: 'User does not exist with this email address',
    });
  }

  // 2. Generate random otp and save time in database 10 mins
  const OTP = user.createPasswordResetOTP();
  await user.save({ validateBeforeSave: false });

  try {
    // 3. send otp to email address
    await new Email(user).send(
      `The otp(${OTP}) will expire in 10 min`,
      'Reset Password OTP'
    );

    console.log(user.passwordResetToken);
    console.log(user.passwordResetExpires);

    res.status(200).json({ message: 'OTP has been sent to your email' });
  } catch (error) {
    user.passwordResetToken = undefined;
    user.passwordResetExpires = undefined;
    await user.save({ validateBeforeSave: false });
    console.log(`error: ${error}`);
    res
      .status(500)
      .json({ message: 'Problem occur while sending an otp', error });
  }
});

exports.resetPassword = catchAsync(async (req, res, next) => {
  // 1. Validate otp
  const hashedOTP = crypto
    .createHash('sha256')
    .update(req.body.otp.toString())
    .digest('hex');

  console.log(hashedOTP);

  // 2. find user with otp hashed
  const user = await User.findOne({
    passwordResetToken: hashedOTP,
    passwordResetExpires: { $gt: Date.now() },
  });

  console.log(user);

  if (!user) {
    return res.status(400).json({ message: 'OTP is invalid or expired' });
  }

  user.password = req.body.password;
  user.passwordConfirm = req.body.passwordConfirm;
  user.passwordResetExpires = undefined;
  user.passwordResetToken = undefined;

  await user.save();

  res.status(200).json({ message: 'Password updated successfully' });
});

exports.updatePassword = catchAsync(async (req, res, next) => {
  // req.user.id -> from protect middleware

  // 1. Get user from collection.
  const user = await User.findById(req.user.id).select('+password');

  // Check current password is correct.
  if (!(await user.checkPasswords(req.body.currentPassword, user.password))) {
    return res.status(401).json({
      message: 'Entered password is incorrect',
    });
  }

  // Update the password
  user.password = req.body.password;
  user.passwordConfirm = req.body.passwordConfirm;
  await user.save();

  // create and send new token as password is change old token not be valid
  createAndSendToken(user, req, res, 200);
});
