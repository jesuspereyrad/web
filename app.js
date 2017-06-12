const express = require('express');
const app = express();
const exphbs = require('express-handlebars');
const helpers = require('./lib/helpers');

app.use('/static', express.static(__dirname + '/public'))

app.engine('.hb', exphbs ({
  defaultLayout: 'main',
  extname: 'hb',
  layoutsDir: 'views/layouts/',
  partialsDir: 'views/partials/',
  helpers: helpers 
  }
));

app.set('view engine', '.hb');

app.get('/', function (req, res) {
  res.render('home');
});

app.get('/about', function (req, res) {
  res.render('about');
});

// app.get('/about', function (req, res) {
//   res.sendFile('about.html', options, function (err) {
//     if (err) {
//       console.log(err);
//     }
//   });
// });

app.listen(5331, function () {
  console.log("Server listen on port 5331");
});