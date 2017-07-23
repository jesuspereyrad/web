var pizza = require('../model/pizzaModel.js');
var crust = require('../model/ingredientModel.js');
var sauce = require('../model/ingredientModel.js');
var topping = require('../model/toppingModel.js');

module.exports = function(app) {

  //Get - pizza by id from the DB
  getPizza = function() {

  };

  //Get - all pizzas from premade or user
  getPizzasByType = function(req,res) {
    console.log(req.params.type);
    pizza.find({type: req.params.type}, function(err, pizzas) {
      if (err){
        res.status(404).send("Pizzas not found");
      }
      else {
        console.log('GET /PizzasByType');
        res.status(200).json(pizzas);
      }
    });
  };

  //Get - all pizzas from DB
  getPizzas = function(req, res) {
    pizza.find(function(err, pizzas) {
      if (err){
        res.status(404).send("Pizzas not found");
      }
      else {
        console.log('GET /List of Pizzas');
        res.status(200).json(pizzas);
      }
    });
  };

  //Get - set of pizzas from the DB
  showPizzas = function(req, res) {
    pizza.find(function(err, pizzas) {
      if (err){
        res.status(404).send("Pizzas not found");
      }
      else {
        console.log('GET /List of Pizzas');
        pizzas.forEach(function(pizza) {
          // console.log('hola');
          console.log(pizzaToString(pizza));
        });
      }
    });
  };

  pizzaToString = function(pizza) {
    var newPizza = {};
    crust.find({"_id": pizza.crust}, function(err, crustOne) {
      // console.log(crustCurrent);
      // newPizza.crust = crustCurrent;
    });
    console.log(crustOne);
    newPizza.title = pizza.title;
    return newPizza;
  }

  //POST - create a pizza
  addPizza = function(req, res) {
    console.log(req.body);
    var description = (req.body.cheese.name.concat(req.body.meat.name)).concat(req.body.vegetable.name);
    console.log(description);
    var newPizza = new pizza({
      title: req.body.title,
      crust: req.body.crust.name,
      sauce: req.body.sauce.name,
      description: description, 
      type: req.body.type,
      image: req.body.image
    });
    console.log(newPizza);
    newPizza.save(function(err, resultObj) {
      if (err){
        console.log("error");
        return res.status(500)
        .send("Error trying to save the pizza");
      }
      else{
        console.log('POST /PIZZA');
        return res.status(200).json(resultObj);
      }
    });
  };

  //Delete - delete a pizza from the DB
  deletePizza = function() {

  };

  //PUT - edit a pizza from the DB
  editPizza = function() {
    
  }
}