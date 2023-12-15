const express = require('express');
const userRouter = require('./routes/userRoutes');
const eventRouter = require('./routes/eventRoutes');
const bookingRouter = require('./routes/bookingRoutes');
const errorController = require('./controllers/errorController');
const app = express();

// parse incoming JSON requests
app.use(express.json());

app.use('/api/v1/user', userRouter);
app.use('/api/v1/event', eventRouter);
app.use('/api/v1/event', eventRouter);
app.use('/api/v1/booking', bookingRouter);

// This will be consider as a global error handling middleware
// call when we call next(error)
app.use(errorController);

module.exports = app;
