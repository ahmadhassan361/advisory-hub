const FAQ = require('../models/Faq');
const Post = require('../models/Post');


const adminController = async (req, res) => {
    const user = req.session.user;
    const faq = await FAQ.findAll()
    const post = await Post.findAll()


    res.render('admin', { user: user, faqs: faq, posts: post })
}

const adminFAQFormController = async (req, res) => {
    const { title, description } = req.body;
    try {
        await FAQ.create({ title, description })
        res.redirect('/admin')
    }
    catch (err) {
        res.redirect('/admin')
    }
}
const adminPostFormController = async (req, res) => {
    const { title, description, image, category } = req.body;
    try {
        await Post.create({ title, description, image, category })
        res.redirect('/admin')
    }
    catch (err) {
        res.redirect('/admin')
    }
}



module.exports = { adminController, adminFAQFormController, adminPostFormController }





