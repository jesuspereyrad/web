var mongoose = require('mongoose');
var order = require('./orderModel.js');

//User Model
var userSchema = new mongoose.Schema({
  id:  { type: Number },
  name:    { type: String, required: true},
  email:     { type: String, required: true},
  password:  { type: String, required: true},
  online: {type: Boolean},
  listOrder: [{type: mongoose.Schema.Types.ObjectId,  ref: 'order'}]
}, {collection: 'user'});

module.exports = mongoose.model('user', userSchema);
