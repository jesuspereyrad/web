var mongoose = require('mongoose');
var order = require('./orderModel.js');

//User Model
var userSchema = new mongoose.Schema({
  id:  { type: Number },
  name:    { type: String },
  email:     { type: String },
  password:  { type: String },
  online: {type: Boolean},
  listOrder: [{type: mongoose.Schema.Types.ObjectId,  ref: 'order'}]
}, {collection: 'user'});

module.exports = mongoose.model('user', userSchema);
