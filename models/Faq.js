const { Model, DataTypes } = require('sequelize');
const sequelize = require('./sequelize');

class FAQ extends Model {}

FAQ.init({
    title: {
        type: DataTypes.STRING(255),
        allowNull: false,
        validate: {
            notNull: {
                msg: 'Title is required.'
            }
        }
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: false,
        validate: {
            notNull: {
                msg: 'Description is required.'
            }
        }
    },
    created_at: {
        type: DataTypes.DATE,
        allowNull: false,
        defaultValue: DataTypes.NOW
    }
}, {
    sequelize,
    modelName: 'FAQ',
    underscored: true,
    timestamps: false // since we are defining created_at manually
});

module.exports = FAQ;
