var express = require("express");
var app = express();
var exphbs = require("express-handlebars");
var helpers = require("./lib/helpers");

app.use("/static", express.static("public"));

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
});

app.get("/about", function (req, res) {
  res.render("about");
});

app.get("/team", function (req, res) {
  res.render("team");
});

app.get("/pizza", function (req, res) {
  res.render("pizza");
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

app.listen(5331, function () {
  console.log("Server listen on port 5331");
});
