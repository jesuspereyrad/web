var mongoose = require('mongoose');

//Topping Model
var toppingSchema = new mongoose.Schema({
  type: ['CHEESE', 'MEAT', 'VEGETABLE'],
  name:    { type: String }
}, {collection: 'topping'});

module.exports = mongoose.model('topping', toppingSchema);
