const logoutController = (req, res) => {
    req.session.destroy(err => {
        if (err) {
          return res.redirect('/');
        }
        res.clearCookie('connect.sid'); // Clear the default session cookie
        res.redirect('/login');
      });
}



module.exports = { logoutController }