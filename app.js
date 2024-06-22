const express = require('express');
const session = require('express-session');
const app = express();
const port = process.env.PORT || '3000';

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));
app.use(session({
  secret: 'secret',
  resave: false,
  saveUninitialized: true,
}));

// Database sync
require('./models/DBsync');

// Add Routes
require('./routes/web.js')(app);

app.listen(port, () => {
  console.log('Server is running on http://localhost:3000');
});
