var topping = require('../model/toppingModel.js');

module.exports = function(app) {

  //Get - toppings by type from the DB
  getToppingsByType = function(req,res) {
    console.log(req.params.type);
    topping.find({type: req.params.type}, function(err, toppings) {
      if (err){
        res.status(404).send("Topping not found");
      }
      else {
        console.log('GET /ToppingsByType');
        res.status(200).json(toppings);
      }
    });
  };

  //Get - all topping from DB
  getToppings = function(req, res) {
    topping.find(function(err, toppings) {
      if (err){
        res.status(404).send("Topping not found");
      }
      else {
        console.log('GET /Toppings');
        res.status(200).json(toppings);
      }
    });
  };

  //POST - create a topping
  addTopping = function(req,res) {
    topping.findOne({name: req.body.name},  function(err, current) {
      if(err){
        res.status(504).send("Topping already exist");
      }
      else {
        console.log('POST');
        var newTopping = new topping({
          type: req.body.type,
          name: req.body.name,
          url: req.body.url
        });
        newTopping.save(function(err, resultObj) {
          if (err){
            return res.status(500)
            .send("Error trying to save the topping");
          }
          else{
            res.status(200).json(resultObj);
          }
        });
      };
    });
  };
};