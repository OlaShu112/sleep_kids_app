const mongoose = require('mongoose');

// Define the Reward Schema
const rewardSchema = new mongoose.Schema({
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
    maxlength: 500
  },
  rewardPoints: {
    type: Number,
    required: true,
    min: 0
  },
  dateAwarded: {
    type: Date,
    default: Date.now,
    required: true
  },
  category: {
    type: String,
    enum: ['Sleep', 'Exercise', 'Education', 'Achievement', 'Other'],
    required: true
  }
});

// 🔍 Index for optimizing queries based on userId and dateAwarded
rewardSchema.index({ userId: 1, dateAwarded: -1 });

// ⏳ Pre-save hook to sanitize or format data
rewardSchema.pre('save', function (next) {
  if (this.title) {
    // Ensure title is trimmed of any unnecessary spaces
    this.title = this.title.trim();
  }
  next();
});

// 📊 Virtual property to display total points (if required in future)
rewardSchema.virtual('totalPoints').get(function () {
  return this.rewardPoints || 0;
});

module.exports = mongoose.model('Reward', rewardSchema);
