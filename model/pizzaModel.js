var mongoose = require('mongoose');
var ingredient = require('/mode/ingredientModel.js');
//User Model
var pizzaSchema = new mongoose.Schema({
  id:  { type: Number },
  title:    { type: String },
  ingredients:  {type: ingredient},
  description:     { type: String },
  image:  { type: Number }
}, {collection: 'pizza'});

module.exports = mongoose.model('pizza', pizzaSchema);
