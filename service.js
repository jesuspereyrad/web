// require('dotenv').config();
// var orders = require("./model/orderModel.js");
var express = require("express");
var orders = express();
require('./app/routes.js')(orders);
var mongoose = require('mongoose');
const Mailer = require('./email.js')();
require("./controller/orderController.js")(orders);
var user = require('./controller/userController.js');
var intervalObject = PizzaService;

function reviewOrders(err, orders) {
  if (err) {
      return false;
  }
  orders.forEach(function(order) {
    var time = new Date().getTime() - order.date
    if(order.status === "ACTIVE" && time > 120) {
        console.log("cant cancel");
    }
    var timeBeforeDelivered = waitTime();
    if (order.status === "ACTIVE" && (time >= timeBeforeDelivered)) {
      deliverOrder(order, function(err, result) {
        if (err) {
          console.log(err);
        } else {
          load(order);
        }
      });
    }
  });
};


function load(order) {
  orders.orderByuser(order._id, function(err, user) {
   Mailer.loadEmail({name: user.name, order: order.date});
  });
}

function deliverOrder(order, callback) {
  orders.editOrder({id: order._id, status: 'DELIVERED'}, callback);
}

function waitTime() {
  return Math.floor(Math.random() * 180, 300);
}

function PizzaService() {
  orders.getOrderByStatus({status: 'active'}, reviewOrders);
  clearInterval(intervalObject);
}

console.log('Pizza Service started to run: ', new Date());
setInterval(PizzaService, 1000);
