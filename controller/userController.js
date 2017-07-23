var mongoose = require('mongoose');
mongoose.Promise = require('bluebird');
var user = require('../model/userModel.js');
var order = require('../model/orderModel.js');
var pizza = require('../model/pizzaModel.js');
var bcrypt = require('bcrypt');
const saltRounds = 10;
const myPlaintextPassword = 's0/\/\P4$$w0rD_blaahblah';
const someOtherPlaintextPassword = 'arroz_con_pollo'; 

function getOrder(oneOrder) {
  return order
    .findOne({"_id": oneOrder})
    .then(function(currentOrder) {
        return (getPizza(currentOrder));
    })
    .catch(function(err) {
        console.log(err);
    });
}

function getPizza(oneOrder) {
  return pizza
    .findOne({"_id": oneOrder.pizza})
    .then(function(currentPizza) {
        console.log(currentPizza);
        return({order: oneOrder, pizza: currentPizza});
    })
    .catch(function(err) {
        console.log(err);
    });
}

module.exports = function(app) {

  // Get - return all users in the DB
  getUsers = function(req, res) {
    user.find(function(err, current) {
      if (err){
        res.status(404).send("User not found");
      }
      else {
        console.log('GET /List of Users');
        res.status(200).json(current);
      }
    });
  };

  // Get - return a user in the DB
  getUser = function() {

  };

  //Get - return current user in the DB
  getCurrentUser = function() {

  };

  //POST - create user in the DB
  addUser = function(req, res) {
    console.log(req.body);
    user.findOne({"email": req.body.email},  function(err, current) {
      if(current){
        res.status(504).send("Email already exist");
      }
      else {
        console.log('POST');
        var salt = bcrypt.genSaltSync(saltRounds);
        var hash = bcrypt.hashSync(req.body.password, salt);
        var newUser = new user({
          name: req.body.name,
          email: req.body.email,
          password: hash,
          listOrder: [],
          online: false
        });
        newUser.save(function(err, resultObj) {
          if (err){
            return res.status(500).send("User fail to save in the DB");
          }
          else{
            res.status(200).json(resultObj);
          }
        });
      };
    });
  };


  //POST - authenticate user
  authenticationUser = function(req, res) {
    console.log(req.body.email);
    console.log(req.body.password);
    user.findOne({"email": req.body.email},  function(err, current) {
      if(!current){
        if(err) {
          res.status(404).send("Email not found in the db");
        }
      } 
      else {
        if(req.body.password) {
          if(bcrypt.compareSync(req.body.password, current.password)) {
            current.online = true;
            console.log(req.session);
            req.session.user = current._id;
            req.session.logged = true;
            console.log(req.session);
            res.status(200).json(current);
          } else {
            res.status(504).send("Password does not match");
          } 
        }
      }
    });
  };

  editOrder = function(req, res) {
    console.log(req.body);
    user.findById(req.body.id, function(err, current) {
      if (err) return handleError(err);
      if(current.listOrder.indexOf(req.body.order) > -1) {
        return res.send("this order already exist in your db");
      }
      current.listOrder.push(req.body.order);
      current.save(function (err, updated) {
        if (err) return handleError(err);
        res.send(updated);
      });
    });
  }

  getOrdersByUser = function(req, res) {
    var promise = user.findById(req.params.id).exec();
    var promises = new Array();
    promise.then(function(currentUser) {
      for (x = 0; x < currentUser.listOrder.length; x++) {
        console.log(currentUser.listOrder[x]);
        promises.push(getOrder(currentUser.listOrder[x]));
      };
      return Promise.all(promises);
    }).then(function(result) {
      res.status(200).json(result);
    }).catch(function(err) {
        console.log(err);
    });
  };

  //Delete - delete user in the DB
  deteleUser = function() {

  };
};