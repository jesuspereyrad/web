var mongoose = require('mongoose');
var pizza = require('/mode/pizzaModel.js');
//User Model
var orderSchema = new mongoose.Schema({
  id:  { type: Number },
  status:    { type: String },
  pizza:     { type: Pizza },
  price:  { type: Number }
}, {collection: 'order'});

module.exports = mongoose.model('order', orderSchema);
