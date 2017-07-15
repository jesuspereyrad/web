var mongoose = require('mongoose');

//User Model
var ingredientSchema = new mongoose.Schema({
  id:  { type: Number },
  pizzaCrust:    { type: String },
  pizzaToppings:  {type: String},
  PizzaSauce:     { type: String },
  PizzaCheese:  { type: String }
}, {collection: 'ingredients'});

module.exports = mongoose.model('ingredient', ingredientSchema);
