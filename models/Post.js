const { Model, DataTypes } = require('sequelize');
const sequelize = require('./sequelize');

class Post extends Model {
    static async findAllGroupedByCategory() {
        try {
            const results = await this.findAll({
                where: {}, // Optionally add conditions here if needed
                order: [['category', 'ASC']], // Optional: Order by category ascending
                raw: true // Ensures the results are plain objects
            });

            // Grouping posts by category
            const groupedPosts = results.reduce((acc, post) => {
                const existingCategory = acc.find(item => item.category === post.category);
                if (existingCategory) {
                    existingCategory.posts.push(post);
                } else {
                    acc.push({
                        category: post.category,
                        posts: [post]
                    });
                }
                return acc;
            }, []);

            return groupedPosts;
        } catch (error) {
            console.error('Error fetching posts grouped by category:', error);
            throw error;
        }
    }
}

Post.init({
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
        allowNull: true
        
    },
    image: {
        type: DataTypes.STRING,
        allowNull: true
    },
    category: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            notNull: {
                msg: 'Category is required.'
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
    modelName: 'Post',
    underscored: true,
    timestamps: false // since we are defining created_at manually
});

module.exports = Post;
