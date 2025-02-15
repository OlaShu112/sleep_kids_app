const mongoose = require('mongoose');

// Define Items Schema
const itemsSchema = new mongoose.Schema({
  name: {
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
    required: true,
    enum: ['Toy', 'Book', 'Reward', 'Other'],
    default: 'Other'
  },
  quantity: {
    type: Number,
    required: true,
    min: 0,
    default: 0
  },
  price: {
    type: Number,
    required: true,
    min: 0.01
  },
  createdBy: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
}, { timestamps: true }); // ✅ Adds createdAt & updatedAt

// 🎯 Indexes to speed up item searches
itemsSchema.index({ name: 1, category: 1 });

// 🧠 Virtual field to check stock availability
itemsSchema.virtual('isInStock').get(function () {
  return this.quantity > 0;
});

// 🚦 Pre-save hook to format names
itemsSchema.pre('save', function (next) {
  // Capitalize each word in the name
  this.name = this.name.replace(/\b\w/g, char => char.toUpperCase());
  next();
});

// 🔍 Custom validation for name
itemsSchema.path('name').validate((value) => {
  return /^[A-Za-z0-9\s]+$/.test(value);
}, 'Item name can only contain letters, numbers, and spaces.');

module.exports = mongoose.model('Item', itemsSchema);
