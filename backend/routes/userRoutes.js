const express = require('express');

const router = express.Router();

router.post('/signup', (req, res) => {
  res.json({
    data: 'tantana',
  });
});
// router.post('/login', login);
// router.get('/logout', logout);

module.exports = router;
