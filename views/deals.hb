<!-- DEAL PATH -->
<div id="deals">
<!-- Deal JUMBOTRON -->

  <div class="jumbotron">
    <h1>Our deals of the week</h1>
    <h4>Try one and tell us your opinion!</h4>
  </div>

  <!-- Deal Table -->
  <div class="container">
    <table class="table table-sm table-responsive">
      <thead class"thead-default">
        <tr class="col-12">
          <th class="col-6 col-md-4">Title</th>
          <th class="col-6 col-md-6">Description</th>
          <th class="col-6 col-md-2">Get It know</th>
        </tr>
      </thead>
      <tbody id="dealTable">
        
       
      </tbody>
    </table>
    <div id="hide" class="hidden-up"></div>
  </div>
</div>

<script>
  var order = {};
  var pizza = {};
  var total;
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
    total = (element.order.price) * 0.90;
    var order = element.order;
    var element = element.pizza;

    return "<tr class='col-md-12'><td class='col-6 col-md-4' id='"+ element._id + "' items='"+ element.description.length +"'>" + element.title + "<span class='offer'> $" + total.toFixed(2) + "</span><br><small class='text-muted'>Before: <span> $" + order.price.toFixed(2) + "</span></small></td><td class='col-6 col-md-6'>One of our best pizzas, have have " + element.crust + ", " + element.sauce + "topping: " + element.topping + "</td><td class='col-md-2'>"+ {{>checkbox}}  +"<a href='' class='btn btn-primary' onclick='checkout(event, this);' father='"+ element._id + "'>Order now</a></td></tr>"
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
    order.price = total;
    var xmlhttp = new XMLHttpRequest();   // new HttpRequest instance 
    xmlhttp.open("POST", "/checkout");
    xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xmlhttp.send(JSON.stringify(pizza), JSON.stringify(order));
  }

  getRequest("get", "dealTable", "/DB/orders", option);

</script>