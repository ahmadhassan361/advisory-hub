const bcrypt = require('bcryptjs');
const User = require('../models/User');

const signupController = async (req, res) => {
  res.render('signup',{message: ''});
};

const signupFormController = async (req, res) => {
  const { username, password, is_admin} = req.body;
  const user = await User.findOne({ where: { username } });

  if (user) {
    return res.render('signup', {message:'user already exists'});
  }
  const hashedPassword = bcrypt.hashSync(password, 10);  // No need for await since hashSync is synchronous
  
  try {
    await User.create({ username, password: hashedPassword,roles: is_admin === 'on'?'admin':'user' });
    res.redirect('/login');
  } catch (error) {
    console.log('Error creating user:', error);
    res.redirect('/signup');
  }
};

module.exports = { signupController, signupFormController };
