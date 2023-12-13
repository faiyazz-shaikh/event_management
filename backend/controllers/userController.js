const User = require('../models/userModel');
const { catchAsync } = require('../utills/catchAsync');

exports.getUserProfile = catchAsync(async (req, res, next) => {
  const user = await User.findById(req.user.id);

  res.status(200).json({
    status: 'success',
    data: {
      user,
    },
  });
});
