const mongoose = require('mongoose');

// Define Education Schema
const educationSchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  title: {
    type: String,
    required: true,
    trim: true,
    maxlength: 100
  },
  description: {
    type: String,
    maxlength: 500,
    default: ''
  },
  category: {
    type: String,
    enum: ['Sleep Science', 'Healthy Habits', 'Relaxation Techniques', 'General Knowledge'],
    required: true
  },
  difficultyLevel: {
    type: String,
    enum: ['Beginner', 'Intermediate', 'Advanced'],
    default: 'Beginner'
  },
  contentUrl: {
    type: String,
    required: true,
    validate: {
      validator: function (url) {
        return /^(https?:\/\/)[\w.-]+(\.[a-z]{2,})+\/?.*$/.test(url);
      },
      message: 'Invalid URL format.'
    }
  },
  createdAt: {
    type: Date,
    default: Date.now
  }
});

// 🎓 Index for user-based education material lookup
educationSchema.index({ userId: 1, category: 1 });

// 🔍 Pre-save hook to capitalize the title
educationSchema.pre('save', function (next) {
  this.title = this.title.replace(/\b\w/g, (char) => char.toUpperCase());
  next();
});

module.exports = mongoose.model('Education', educationSchema);
