const bcrypt = require('bcryptjs');
const User = require('../models/User');

const loginController = (req, res) => {
  res.render('login', { message: '' });
};

const loginFormController = async (req, res) => {
  const { username, password } = req.body;
  if (!username || !password) {
    return res.render('login', { message: 'Invalid username or password' });
  }

  try {
    const user = await User.findOne({ where: { username } });

    if (!user) {
      console.log('User not found');
      return res.render('login', { message: 'Invalid username or password' });
    }

    const verifiedPassword = bcrypt.compareSync(password, user.password);
    if (!verifiedPassword) {
      console.log('Password mismatch');
      return res.render('login', { message: 'Invalid username or password' });
    }

    req.session.user = user;

    res.redirect(user.dataValues.roles === 'admin' ? '/admin' : '/');  // Redirect to home page after login
  } catch (error) {

    res.render('login', { message: 'Invalid username or password' });
  }
};

module.exports = { loginController, loginFormController };
