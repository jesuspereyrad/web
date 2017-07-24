  var mongoose = require('mongoose');
  var mail = require('./email.js')();
  mongoose.Promise = require('bluebird');
  mongoose.Promise = require('q').Promise;
  var config = require('./config');

  var Orders = require("./model/orderModel.js");
  var user = require("./model/userModel.js");
  var intervalObject = null;

  function reviewOrders(err, orders) {
    if (err) {
      console.log(err);
        return false;
    }
    orders.forEach(function(order) {
      var now = new Date().getTime() / 1000 
      var time =  now - order.date/1000
      console.log(order.status);
      if(order.status[0] === "ACTIVE" && time > 120) {
        console.log("cant cancel");
      }
      var timeBeforeDelivered = waitTime();
      if (order.status[0] === "ACTIVE" && (time >= timeBeforeDelivered)) {
        console.log("hey");
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
    // console.log("Last cancel");
  };

  function getUser(oneOrder) {
    user.findById(oneOrder.user, function(err, currentUser) {
      if(err) {
        console.log(err);
      } else {
        // console.log(currentUser);
        return({currentUser});
      }
    })
  }


  function load(order) {
    var promise = Orders.findById(order._id).exec();
    promise.then(function(orders) {
      return getUser(orders);
    }).then(function(user) {
      // console.log(user);
      mail({user: "pedro", order: order.date});
    }).catch(function(err) {
      console.log(err);
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
    return Math.floor(Math.random() * (300 - 180), 180);
  }

  function PizzaService() {
    Orders.find({status: "ACTIVE"}, function(err, orders) {
      if (err){
        console.log("Orders not found");
      }
      else {
        // console.log('GET /OrdersByStatus');
        reviewOrders(err, orders)
      }
    });
    // console.log("termino pizzaservice");
    // clearInterval(intervalObject);
  }

  console.log('Pizza Service started to run: ', new Date());


  mongoose.connect(config.database, function(err, res) {
    if (err) {
      console.log('ERROR: connecting to Database. ' + err);
    } else {
      console.log("Connected to the db");
      intervalObject = setInterval(PizzaService, 1000);
      // PizzaService();
    }
  });
