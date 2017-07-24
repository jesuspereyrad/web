<!-- REORDER PATH -->
<div id="checkout">
  <!-- Authentication MODAL -->
  {{> logInModal}}
  <!-- Show Previous Orders -->
  <div class="jumbotron">
    <h1>Your orders is almost ready</h1>
    <h4>Just review it and click the hot button</h4>
  </div>
  <div class="container">
    <input id="orderId" type="hidden" value="{{id}}"/>
    <div class="alert alert-success hidden-xs-up" id="registerSuccess" role="alert">
    </div>
    <table class="table">
      <thead class="thead-default">
        <tr class="row col-12">
          <th class="col-12" style="text-align: center" id="PizzaTitleDescription"></th>
        </tr>
      </thead>
      <tbody id="tableBody">
      </tbody>
    </table>
      <input type='submit' onclick="return(submitOrder(event));" class='btn btn-primary col-6 col-md-3 offset-md-9'/>
    </form>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
<script>
  $( document ).ready(function() {
    $(".logInModal").modal('show');
  });
  function hide() {
    $(".logInModal").modal('hide');
  };
</script>


<script>
var userId;
var order = {};

function init(element) {
  order.status =['ACTIVE'];
  order.size = "{{order.size}}";
  order.extraPrice = {{order.extraPrice}};
  order.priceSize = {{order.price}};
  getRequest("get", "tableBody", "./DB/pizza/" + document.getElementById("orderId").value , populateTable);
  userId = element;
  console.log(userId);
}

var getRequest = function(method, father, url, func) {
  var client = new XMLHttpRequest();
  order.price = (order.extraPrice + order.priceSize);
  client.onreadystatechange = function() {
    if(client.readyState === 4) {
      document.getElementById(father).innerHTML = 
      func(JSON.parse(client.responseText)) + 
      "<tr class='row col-12'><td class='col-6'>size</td><td class='col-6'>{{order.size}}</td></tr> <tr class='row col-12'><td class='col-6'>Price</td><td class='col-6'>{{order.price}}</td></tr><tr class='row col-12'><td class='col-6'>Extra Topping</td><td class='col-6'>{{order.extraPrice}}</td></tr> <tr class='row col-12'><td class='col-6'>Total</td><td class='col-6'>"+  order.price + "</td></tr> ";
    }
  }
  client.open(method, url);
  client.send();
}

function populateTable(element) {
  var pizza = element;
  order.pizza = element;
  string = "";
  Object.keys(element).forEach(function(key,index) {
    console.log(key);
    if(key != "_id" && key !=  "__v" && key !=  "type" && key !=  "image") {
      string += "<tr class='row col-12'><td class='col-6'>" + key + "</td><td class='col-6'>" + element[key] + "</td></tr>"
    }
  });
  if(element.title) {
    document.getElementById("PizzaTitleDescription").innerHTML = element.title;
  }
  return string;
};

function submitOrder(event) {
  event.preventDefault();
  var xmlhttp = new XMLHttpRequest();   // new HttpRequest instance 
  xmlhttp.open("POST", "/db/order");
  xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
  xmlhttp.send(JSON.stringify(order));
  xmlhttp.onreadystatechange = function() {
    if(xmlhttp.readyState === 4) {
      orderId =  JSON.parse(xmlhttp.responseText);
      updateOrderList(orderId._id);
    }
  }
}

function updateOrderList(element) {
  var xmlhttp = new XMLHttpRequest();   // new HttpRequest instance 
  xmlhttp.open("PUT", "/db/user");
  xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
  xmlhttp.send(JSON.stringify({id: userId, order: element}));
}
</script>
