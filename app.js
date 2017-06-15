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


app.listen(5331, function () {
  console.log("Server listen on port 5331");
});
