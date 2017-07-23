var mongoose = require('mongoose');

//Deal Model
var ingredientSchema = new mongoose.Schema({
  type: ['SAUCE', 'CRUST'],
  name:    { type: String },
  description: { type: String },
  url: { type: String },
}, {collection: 'ingredient'});

module.exports = mongoose.model('ingredient', ingredientSchema);
