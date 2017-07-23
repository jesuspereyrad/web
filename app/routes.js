var bodyParser = require("body-parser");

module.exports = function(app) {
  require('../controller/userController.js')(app);
  require('../controller/pizzaController.js')(app);
  // require('../controllers/dealController.js')(app);
  require('../controller/ingredientController.js')(app);
  require('../controller/toppingController.js')(app);
  require('../controller/orderController.js')(app);


  // var apiRoutes = express.Router();
  // var path = require("path");

  //Topping route
  app.post('/db/topping', addTopping);
  app.get('/db/toppings', getToppings);
  app.get('/db/toppings/:type', getToppingsByType);

  //Ingredient route
  app.post('/db/ingredient', addIngredient);
  app.get('/db/ingredients', getIngredients);
  app.get('/db/ingredients/:type', getIngredientsByType);

  //User route
  app.get('/db/users', getUsers);
  app.post('/db/user', addUser);
  app.post('/db/authenticate', authenticationUser);
  app.put('/db/user', editOrder);
  app.get('/db/userOrders/:id', getOrdersByUser);

  //Pizza route
  app.post('/db/pizza', addPizza);
  app.get('/db/pizzas', getPizzas);
  app.get('/db/pizzasDetail', showPizzas);
  app.get('/db/pizzas/:type', getPizzasByType);

  //Order route
  app.post('/db/order', addOrder);
  app.get('/db/orders', getOrders);

};
