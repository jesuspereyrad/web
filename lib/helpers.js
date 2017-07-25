var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;
var handlebars = require('handlebars');

var fetch = function(url) {
  var client = new XMLHttpRequest();
    client.onreadystatechange = function() {
      if(client.readyState === 4) {
        var object = (JSON.parse(client.response));
        return client.responseText;
      }
    }
    client.open("get", url);
    client.send();
}
