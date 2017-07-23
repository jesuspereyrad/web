var order = require('../model/orderModel.js');
var pizza = require('../model/pizzaModel.js');
var mongoose = require('mongoose');
// set Promise provider to bluebird
mongoose.Promise = require('bluebird');
mongoose.Promise = require('q').Promise;

function getPizza(oneOrder) {
  return pizza
    .findOne({"_id": oneOrder.pizza})
    .then(function(currentPizza) {
        return({order: oneOrder, pizza: currentPizza});
    })
    .catch(function(err) {
        console.log(err);
    });
}

module.exports = function(app) {
  //GET - get order from DB
  getOrder = function() {

  };

  //GET - get a list of order from the DB
  getOrders = function(req, res) {
    var orderDetail = new Array();
    var promise = order.find().exec();
    var promises = new Array();
    promise.then(function(orders) {
      for (var x in orders) {
        promises.push(getPizza(orders[x]));
      };
      return Promise.all(promises);
    }).then(function(result) {
      res.status(200).json(result);
    }).catch(function(err) {
        console.log(err);
    });
  };


  //POST - create an order an put it in the DB
  addOrder = function(req, res) {
    var newOrder = new order({
     price: req.body.price,
     size: req.body.size,
     pizza: req.body.pizza,
     status: req.body.status
    });
    newOrder.save(function(err, resultObj) {
     if(err) {
       return res.status(500)
       .send("Error trying to save the Order");
     }
     else {
      console.log('POST /newOrder');
       res.status(200).json(newOrder);
     }
    });
  };

  //DELETE - delete an order from the DB
  deleteOrder = function() {

  };

  //PUT - update an order in the DB
  updateOrder = function() {

  };
}