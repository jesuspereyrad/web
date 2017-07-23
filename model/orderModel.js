var mongoose = require('mongoose');
var pizza = require('./pizzaModel.js');
//User Model
var orderSchema = new mongoose.Schema({
  id:  { type: Number },
  status:    ['DELIVERED', 'CANCELED', 'ACTIVE'],
  pizza: {type: mongoose.Schema.Types.ObjectId,  ref: 'pizza'},
  size: {type: String},
  price:  { type: Number },
  date: { type: Date, default: Date.now }
}, {collection: 'order'});

module.exports = mongoose.model('order', orderSchema);
