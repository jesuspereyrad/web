//server 
//

var express = require('express');
var bodyParser = require('body-parser');
var app = express();

// create application/json parser 
var jsonParser = bodyParser.json()
 
// create application/x-www-form-urlencoded parser 
var urlencodedParser = bodyParser.urlencoded({ extended: false })

app.get("/", function(req,res) {
  var answer = {version: req.httpVersion,
                method: req.method, 
                url: req.url,
                header: req.headers,
                route: req.route}
  res.json(answer);
  // res.json(req.httpVersion + "\n" + req.method + "\n" + req.url + "\n" + req.headers + "\n" + req.route);
});

app.post("/", function(req, res) {
  res.send("hello");
});

var server = app.listen(3000, function() {
  var host = server.address().address;
  var port = server.address().port;
   
   console.log("Example app listening at http://%s:%s", host, port);
})