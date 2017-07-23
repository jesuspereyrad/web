var ingredient = require('../model/ingredientModel.js');

module.exports = function(app) {

  //Get - all Ingredient from DB
  getIngredients = function(req, res) {
    ingredient.find(function(err, ingredient) {
      if (err){
        res.status(404).send("Ingredient not found");
      }
      else {
        console.log('GET /List of Ingredients');
        res.status(200).json(ingredient);
      }
    });
  };

  //Get - Ingredient by type from the DB
  getIngredientsByType = function(req,res) {
    console.log(req.params.type);
    ingredient.find({type: req.params.type}, function(err, toppings) {
      if (err){
        res.status(404).send("Ingredient not found");
      }
      else {
        console.log('GET /IngredientsByType');
        res.status(200).json(toppings);
      }
    });
  };


  //POST - create a Ingredient
  addIngredient = function(req, res) {
    ingredient.findOne({name: req.body.name},  function(err, current) {
      if(err){
        res.status(504).send("Ingredient already exist");
      }
      else {
        console.log('POST');
        var newIngredient = new ingredient({
          name: req.body.name,
          description: req.body.description,
          url: req.body.url,
          type: req.body.type
        });
        newIngredient.save(function(err, resultObj) {
          if (err){
            return res.status(500)
            .send("Error trying to save the ingredient");
          }
          else{
            res.status(200).json(resultObj);
          }
        });
      };
    });
  };
};