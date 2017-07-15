var mongoose = require('mongoose');
var order = require('/mode/orderModel.js');

//User Model
var userSchema = new mongoose.Schema({
  id:  { type: Number },
  name:    { type: String },
  email:     { type: String },
  password:  { type: String },
  listOrder: {type: Order }
}, {collection: 'user'});

module.exports = mongoose.model('user', userSchema);
