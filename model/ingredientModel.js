var mongoose = require('mongoose');

//Deal Model
var ingredientSchema = new mongoose.Schema({
  type: ['SAUCE', 'CRUST'],
  name:    { type: String,  required: true},
  description: { type: String, required: true},
  url: { type: String },
}, {collection: 'ingredient'});

module.exports = mongoose.model('ingredient', ingredientSchema);
