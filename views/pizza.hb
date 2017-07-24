<!-- PIZZA PATH -->
<div id="pizza">
<!-- PIZZA JUMBOTRON -->

  <div class="jumbotron">
    <h1>Our top pizzas of this week</h1>
    <h4>Try one and tell us your opinion</h4>
  </div>

  <!-- Pizza Table -->
  <div class="container">
    <table class="table table-sm table-responsive">
      <thead class="thead-default">
        <tr class="col-12 col-lg-12">
          <th class="col-6 col-lg-3">Title</th>
          <th class="col-6 col-lg-5">Description</th>
          <th class="col-6 col-lg-2">How it looks</th>
          <th class="col-6 col-lg-2">Get It know</th>
        </tr>
      </thead>
      <tbody id="pizzaTable">
      </tbody>
      <div id="hide" class="hidden-up">
      </div>
    </table>
  </div>
</div>

<script>
  var order = {};
  var pizza = {};
  var getRequest = function(method, father, url, func) {
    var client = new XMLHttpRequest();
    client.onreadystatechange = function() {
      if(client.readyState === 4) {
        var clientjs = JSON.parse(client.responseText);
        var string = "";
        clientjs.forEach(function (element) {
          string += func(element);
        })
        if(document.getElementById(father) != null) {
          document.getElementById(father).innerHTML = string;
        }
        else {
          (document.getElementsByClassName(father))[0].innerHTML = string;
        }
      }
    }
    client.open(method, url);
    client.send();
  }

  

  var option = function(element) {
    console.log(element.description);
    return "<tr class='col-12 col-lg-12' id='"+ element._id + "' items='"+ element.description.length +"'><td class='col-6 col-lg-3'>" + element.title + "</td><td class='col-6 col-lg-5'>One of our best pizzas, have " + element.crust + ", " + element.sauce + "topping: " + element.description +"</td><td class='col-6 col-lg-2'><img class='image' src='" + element.image + "'></td><td class='col-lg-2'>" + {{>checkbox}} + "<a href='' class='btn btn-primary' onclick='checkout(event, this);' father='"+ element._id + "'>Order now</a></td></tr>"
  }

  checkSize = function(element) {
    var radios = document.getElementsByName(element);
    var formValid = false;

    var i = 0;
    while (!formValid && i < radios.length) {
        if (radios[i].checked) {
          formValid = true;
          order.size = radios[i].getAttribute("size");
          order.price = radios[i].value;
        }
        i++;        
    }

    if (!formValid) alert("Must check some option!");
    return formValid;
  }

  var checkout = function(e, element) {
    e.preventDefault();
    var father = (document.getElementById(element.getAttribute("father")));
    order.pizza = father.id;
    if(Number(father.getAttribute('items')) > 3) {
      order.extraPrice = ((Number(father.getAttribute('items')) - 3) * 2).toFixed(2);
    } else {
      order.extraPrice = Number(0.00);
    }
    checkSize(father.id);
    createForm();
    document.getElementById("lastOne").click();
  }

  function createForm() {
    document.getElementById("hide").innerHTML = "<form type='hidden' id='submitObject' onsubmit='return(checkout());' method='POST' action='/checkout'><input name='pizzaId' value='"+ order.pizza +"'><input name='other' value='"+ JSON.stringify(order) + "'><input type='submit' id='lastOne' class='btn btn-primary col-6 col-md-3 offset-md-9'/></form>";
  }

  function checkout() {
    var xmlhttp = new XMLHttpRequest();   // new HttpRequest instance 
    xmlhttp.open("POST", "/checkout");
    xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xmlhttp.send(JSON.stringify(pizza), JSON.stringify(order));
  }
  getRequest("get", "pizzaTable", "http://localhost:5331/DB/pizzas/PREMADE", option);

</script>