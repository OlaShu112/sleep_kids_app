const mongoose = require('mongoose');

// Define Progress Schema
const progressSchema = new mongoose.Schema({
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
  task: {
    type: String,
    required: true,
    trim: true,
    maxlength: 100
  },
  progressPercentage: {
    type: Number,
    required: true,
    min: 0,
    max: 100
  },
  notes: {
    type: String,
    maxlength: 500
  }
}, { timestamps: true }); // ✅ Add timestamps

// 🎯 Add an index to optimize queries by userId and date
progressSchema.index({ userId: 1, date: -1 });

// 🧠 Virtual field for task completion status
progressSchema.virtual('isComplete').get(function () {
  return this.progressPercentage === 100;
});

// 🚦 Pre-save hook to trim notes and enforce task naming convention
progressSchema.pre('save', function (next) {
  if (this.notes) {
    this.notes = this.notes.trim();
  }

  // Capitalize the first letter of each word in the task
  this.task = this.task.replace(/\b\w/g, char => char.toUpperCase());

  next();
});

// 🔍 Custom validation for task name
progressSchema.path('task').validate((value) => {
  return /^[A-Za-z0-9\s]+$/.test(value); // Alphanumeric and spaces only
}, 'Task name can only contain letters, numbers, and spaces.');

module.exports = mongoose.model('Progress', progressSchema);
