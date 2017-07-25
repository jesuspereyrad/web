  var mongoose = require('mongoose');
  var mail = require('./email.js')();
  mongoose.Promise = require('bluebird');
  mongoose.Promise = require('q').Promise;
  var config = require('./config');

  var Orders = require("./model/orderModel.js");
  var user = require("./model/userModel.js");
  var interval = null;

  function reviewOrders(err, orders) {
    if (err) {
      console.log(err);
        return false;
    }
    orders.forEach(function(order) {
      var now = new Date().getTime();
      console.log("tamo aqui");
      var difference =  (now/1000)- (order.date/1000);
      if(order.status[0] === "ACTIVE" && difference > 120) {
        var newOrder = order;
        newOrder.beforeTwo = false;
        newOrder.save(function (err, updated) {
          if (err) {
            return err;
          } else {
            console.log(order);
          }
        });
      }
      if (order.status[0] === "ACTIVE" && (difference >= waitTime())) {
        deliverOrder(order, function(result, err) {
          console.log("bajamo");
          if (err) {
            console.log(err);
          } else {
            console.log("order");
            load(order);
          }
        });
      }
    });
  };

  function load(order) {
    var promise = Orders.findById(order._id, function(err, obj) {
      user.findById(order.user, function(err, currentUser) {
        if(err) {
          console.log(err);
        } else {
            mail({name: currentUser.name, email: currentUser.email, number: order._id, date: order.date});
          }
        });
    });
  }

  function deliverOrder(order, callback) {
      Orders.findById(order._id, function (error, current) {
        if(error) {
          console.log("Something happen");
          return error;
        } else {
          var newOrder = current;
            newOrder.status = 'DELIVERED';
            newOrder.save(function (err, updated) {
            if (err) {
              return err;
            } else {
              return load(order);
            }
          });
        }
      }) 
  }

  function waitTime() {
    return Math.floor(Math.random() * (300 - 180)) + 180;
  }

  function Daemon() {
    Orders.find({status: "ACTIVE"}, function(err, orders) {
      if (err){
        console.log("Orders not found");
      }
      else {
        reviewOrders(err, orders)
      }
    });
  }

  console.log('Pizza Deamon is watching ', new Date());


  mongoose.connect(config.database, function(err, res) {
    if (err) {
      console.log('ERROR: connecting to Database. ' + err);
    } else {
      console.log("Connected to the db");
      interval = setInterval(Daemon, 1000);
    }
  });
