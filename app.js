var express = require("express");
var cookieSession = require('cookie-session');
var app = express();
var exphbs = require("express-handlebars");
var config = require('./config');
var helpers = require("./lib/helpers");
var mongoose = require("mongoose");
var bodyParser = require("body-parser");
var price = require("./price.js");

app.use("/static", express.static("public"));
app.set('superSecret', config.secret); // secret variable

app.use(cookieSession({
  name: 'session',
  keys: ['platanoPower'],
  maxAge: 24 * 60 * 60 * 1000 // 24 hours
}))

app.use(bodyParser.urlencoded({
    extended: true
}));

app.use(bodyParser.json());

app.engine(".hb", exphbs({
  defaultLayout: "main",
  extname: "hb",
  layoutsDir: "views/layouts/",
  partialsDir: "views/partials/",
  helpers: helpers
  }
));

app.set("view engine", ".hb");

app.get("/", function (req, res) {
  res.render("home");
  req.session.logged = false;
});

app.get("/about", function (req, res) {
  res.render("about");
});

app.get("/team", function (req, res) {
  res.render("team");
});

app.get("/pizza", function (req, res) {
  res.render("pizza", {size: price});
});

app.get("/deals", function (req, res) {
  res.render("deals");
});

app.get("/re_order", function (req, res) {
  res.render("reorder");
});

app.get("/new_order", function (req, res) {
  res.render("neworder");
});

app.get("/order", function (req, res) {
  res.render("order");
});

app.post("/checkout", function (req, res) {
  console.log(req.body);
  res.render("checkout", {id: req.body.pizzaId, order: JSON.parse(req.body.other)})
});

require('./app/routes.js')(app);

mongoose.connect(config.database, function(err, res) {
  if (err) {
    console.log('ERROR: connecting to Database. ' + err);
  } else {
    console.log("Connected to the db");
  }
  app.listen(config.Port, function () {
    console.log("Server listen on port 5331");
  });
});
