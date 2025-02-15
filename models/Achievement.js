const mongoose = require('mongoose');

// Define Achievement Schema
const achievementSchema = new mongoose.Schema({
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
  dateEarned: {
    type: Date,
    default: Date.now
  },
  points: {
    type: Number,
    required: true,
    min: 0
  },
  category: {
    type: String,
    enum: ['Sleep', 'Education', 'Exercise', 'Other'],
    required: true
  }
});

// 🔍 Index for optimizing queries based on userId and category
achievementSchema.index({ userId: 1, category: 1 });

// 🏅 Pre-save hook to format the title for consistency
achievementSchema.pre('save', function (next) {
  this.title = this.title.replace(/\b\w/g, (char) => char.toUpperCase());
  next();
});

// 📊 Virtual property to provide a friendly display name for the category
achievementSchema.virtual('categoryDisplay').get(function () {
  return this.category.charAt(0).toUpperCase() + this.category.slice(1).toLowerCase();
});

module.exports = mongoose.model('Achievement', achievementSchema);
