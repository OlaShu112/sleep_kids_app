const mongoose = require('mongoose');

// Define Goals Schema
const goalsSchema = new mongoose.Schema({
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
  targetDate: {
    type: Date,
    required: true
  },
  progress: {
    type: Number,
    min: 0,
    max: 100,
    default: 0
  },
  status: {
    type: String,
    enum: ['Not Started', 'In Progress', 'Completed'],
    default: 'Not Started'
  },
  createdAt: {
    type: Date,
    default: Date.now
  }
});

// 🎯 Index for quick goal lookups by user
goalsSchema.index({ userId: 1, status: 1 });

// 🚦 Pre-save hook to capitalize title
goalsSchema.pre('save', function (next) {
  this.title = this.title.replace(/\b\w/g, (char) => char.toUpperCase());
  next();
});

// 🔍 Custom validator for targetDate
goalsSchema.path('targetDate').validate(function (value) {
  return value >= new Date();
}, 'Target date must be in the future.');

module.exports = mongoose.model('Goal', goalsSchema);
