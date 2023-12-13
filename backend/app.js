const express = require('express');
const userRouter = require('./routes/userRoutes');
const eventRouter = require('./routes/eventRoutes');
const bookingRouter = require('./routes/bookingRoutes');
const app = express();

// parse incoming JSON requests
app.use(express.json());

app.use('/api/v1/user', userRouter);
app.use('/api/v1/event', eventRouter);
app.use('/api/v1/event', eventRouter);
app.use('/api/v1/booking', bookingRouter);

// This will be consider as a global error handling middlewarw
// call when we call next(error)
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({
    message: 'Inrernal server error',
    err,
  });
});

module.exports = app;
