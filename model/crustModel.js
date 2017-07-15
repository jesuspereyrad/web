var mongoose = require('mongoose');

//Deal Model
var crustPizzaSchema = new mongoose.Schema({
  type: {type: Number}
  name:    { type: String },
  description:  {type: String}
}, {collection: 'crustPizza'});

module.exports = mongoose.model('crustPizza', crustPizzaSchema);
