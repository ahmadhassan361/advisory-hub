const express = require('express');
const router = express.Router();
const { homeController } = require('../controllers/homeController.js');
const { loginController, loginFormController } = require('../controllers/loginController.js');
const { signupController, signupFormController } = require('../controllers/signupController.js');
const { ensureAuthenticated, ensureNotAuthenticated, ensureAdminAuthenticated } = require('../middleware/authMiddleware');
const { logoutController } = require('../controllers/logoutController.js');
const { adminController, adminFAQFormController, adminPostFormController } = require('../controllers/adminController.js');


module.exports = app => {

    // Public Routes
    //login
    router.get('/login', ensureNotAuthenticated, loginController);
    router.post('/login', ensureNotAuthenticated, loginFormController);
    
    //signup
    router.get('/signup', ensureNotAuthenticated, signupController);
    router.post('/signup', ensureNotAuthenticated, signupFormController);

    // Index Protected Routes
    router.get('/', ensureAuthenticated, homeController);
    router.get('/logout', ensureAuthenticated, logoutController);
    
    // Admin Protected Routes
    router.get('/admin', ensureAdminAuthenticated, adminController);
    router.post('/faq-create', ensureAdminAuthenticated, adminFAQFormController);
    router.post('/post-create', ensureAdminAuthenticated, adminPostFormController);
    app.use('/', router);
}
