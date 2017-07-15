var mongoose = require('mongoose');

//Deal Model
var dealSchema = new mongoose.Schema({
  id:  { type: Number },
  pizza:    { type: String },
  priceDiscount:  {type: String}
}, {collection: 'deal'});

module.exports = mongoose.model('deal', dealSchema);
