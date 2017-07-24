function createForm() {
  document.getElementById("hide").innerHTML = "<form type='hidden' id='submitObject' onsubmit='return(checkout());' method='POST' action='./checkout'><input name='pizzaId' value='"+ order.pizza._id +"'><input name='other' value='"+ JSON.stringify(order) + "'><input type='submit' id='lastOne' class='btn btn-primary col-6 col-md-3 offset-md-9'/></form>";
}

function checkout() {
  var xmlhttp = new XMLHttpRequest();   // new HttpRequest instance 
  xmlhttp.open("POST", "./checkout");
  xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
  xmlhttp.send(JSON.stringify(pizza), JSON.stringify(order));
}

var populateTable = function() {
    pizza.title =  document.getElementById("pizzaTitle").value;
    document.getElementById("PizzaTitleDescription").innerHTML = pizza.title;
    getValues("cheese");
    getValues("meat");
    getValues("vegetable");
    extra = pizza["meat"].name.length + pizza["vegetable"].name.length + pizza["cheese"].name.length;
    console.log(extra);
    order.price = Number((pizza["size"].value));
    console.log(pizza);
    var string = " ";
    Object.keys(pizza).forEach(function(key,index) {
      if(pizza[key].name && pizza[key].name.length > 0) {
        string += "<tr class='row col-12'><td class='col-6'>" + key + "</td><td class='col-6'>" + pizza[key].name + "</td></tr>"
      }
    });
    string += "<tr class='row col-12'><td class='col-6'> Size </td><td class='col-6'>" + pizza["size"].value + "</td></tr>"
    if(extra > 3) {5
      order.extraPrice = Number((extra - 3) * 2);
      order.price += order.extraPrice;
      string += "<tr class='row col-12'><td class='col-6'> Extra topping </td><td class='col-6'>$" + order.extraPrice.toFixed(2) + "</td></tr>"
    }
    string += "<tr class='row col-12'><td class='col-6'> Total </td><td class='col-6'>$" + (order.price.toFixed(2)) + "</td></tr>"
    document.getElementById("tableBody").innerHTML = string;
  }