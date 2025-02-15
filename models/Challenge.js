const mongoose = require('mongoose');

// Define Challenge Schema
const challengeSchema = new mongoose.Schema({
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
  difficulty: {
    type: String,
    enum: ['Easy', 'Medium', 'Hard'],
    default: 'Easy'
  },
  goal: {
    type: String,
    required: true,
    trim: true
  },
  progress: {
    type: Number,
    min: 0,
    max: 100,
    default: 0
  },
  isCompleted: {
    type: Boolean,
    default: false
  },
  createdAt: {
    type: Date,
    default: Date.now
  },
  deadline: {
    type: Date,
    required: true
  }
});

// 🔍 Index for performance on user-based challenge queries
challengeSchema.index({ userId: 1, isCompleted: 1 });

// 🛠️ Pre-save hook to format the title
challengeSchema.pre('save', function (next) {
  this.title = this.title.replace(/\b\w/g, (char) => char.toUpperCase());
  next();
});

// 🏆 Virtual property to get status
challengeSchema.virtual('status').get(function () {
  return this.isCompleted ? 'Completed' : 'In Progress';
});

module.exports = mongoose.model('Challenge', challengeSchema);
