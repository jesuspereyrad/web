var mongoose = require('mongoose');
var ingredient = require('./ingredientModel.js');
var topping = require('./toppingModel.js');
//User Model
var pizzaSchema = new mongoose.Schema({
  id:  { type: Number },
  title:    { type: String, required: true},
  sauce: { type: String, required: true},
  crust: { type: String, required: true},
  description: [{ type:String }],
  image:  { type: String },
  type: ['PREMADE', 'USER']
}, {collection: 'pizza'});

module.exports = mongoose.model('pizza', pizzaSchema);
