var mongoose = require('mongoose');
var pizza = require('./pizzaModel.js');
//User Model
var orderSchema = new mongoose.Schema({
  id:  { type: Number },
  status:    ['DELIVERED', 'CANCELED', 'ACTIVE'],
  pizza: {type: mongoose.Schema.Types.ObjectId,  ref: 'pizza', required: true},
  size: {type: String, required: true},
  price:  { type: Number, required: true},
  date: { type: Date, default: Date.now },
  user: {type: mongoose.Schema.Types.ObjectId,  ref: 'pizza', required: true}
}, {collection: 'order'});

module.exports = mongoose.model('order', orderSchema);
