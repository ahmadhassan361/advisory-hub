const FAQ = require('../models/Faq');
const Post = require('../models/Post');

const homeController = async (req, res) => {
    const user = req.session.user;
    if (user === null) {
        res.redirect('/login')
    }
    const faq =await FAQ.findAll()
    const posts = await Post.findAllGroupedByCategory()
    
    res.render('home',{user:user, faqs:faq, posts})
}



module.exports = { homeController }