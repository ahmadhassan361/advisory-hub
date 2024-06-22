// authMiddleware.js
module.exports = {
    ensureAdminAuthenticated: (req, res, next) => {
      if (req.session.user && req.session.user.roles === 'admin') {
        return next();
      }
      res.redirect('/login');
    },
    ensureAuthenticated: (req, res, next) => {
      if (req.session.user) {
        return next();
      }
      res.redirect('/login');
    },
    ensureNotAuthenticated: (req, res, next) => {
      if (req.session.user) {
        return res.redirect('/');
      }
      next();
    }
  };
  