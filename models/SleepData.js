const mongoose = require('mongoose');

// Define the Sleep Data Schema
const sleepDataSchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  date: {
    type: Date,
    default: Date.now,
    required: true
  },
  sleepDuration: {
    type: Number,
    required: true, // duration in hours
    min: 0
  },
  sleepQuality: {
    type: String,
    enum: ['Poor', 'Fair', 'Good', 'Excellent'],
    required: true
  },
  bedtime: {
    type: String,
    required: true,
    trim: true
  },
  wakeUpTime: {
    type: String,
    required: true,
    trim: true
  },
  notes: {
    type: String,
    maxlength: 500,
    default: ''
  }
});

// 🔍 Index for optimizing queries based on userId and date
sleepDataSchema.index({ userId: 1, date: -1 });

// ⏳ Pre-save hook for time formatting
sleepDataSchema.pre('save', function (next) {
  if (this.bedtime && this.wakeUpTime) {
    // Ensure time is formatted correctly if needed (example: "8:00 PM" -> "8:00 PM")
    this.bedtime = this.bedtime.trim();
    this.wakeUpTime = this.wakeUpTime.trim();
  }
  next();
});

// 📊 Virtual property for calculating sleep hours (for convenience)
sleepDataSchema.virtual('sleepHours').get(function () {
  const sleepDuration = this.sleepDuration || 0;
  return sleepDuration;
});

module.exports = mongoose.model('SleepData', sleepDataSchema);
