var mongoose = require('mongoose');
var ingredient = require('./ingredientModel.js');
var topping = require('./toppingModel.js');
//User Model
var pizzaSchema = new mongoose.Schema({
  id:  { type: Number },
  title:    { type: String },
  sauce: { type: String },
  crust: { type: String },
  description: [{ type:String }],
  image:  { type: String },
  type: ['PREMADE', 'USER']
}, {collection: 'pizza'});

module.exports = mongoose.model('pizza', pizzaSchema);
