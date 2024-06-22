const sequelize = require('./sequelize');
const Sequelize = require('sequelize');

const db = {}

db.sequelize = sequelize;
db.Sequelize = Sequelize;


db.sequelize.sync({force: false})
// db.sequelize.sync()
    .then(()=>console.log('db synced'))
    .catch(err=>console.log(`Error db sync: ${err.message}`));



module.exports = db;