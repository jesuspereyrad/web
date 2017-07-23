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
  </div>
</div>

<script>
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
    var total = (element.order.price) * 0.90;
    console.log(element.name);
    return "<tr class='col-md-12'><td class='col-6 col-md-4'>" + element.pizza.title + "<span class='offer'> $" + total.toFixed(2) + "</span><br><small class='text-muted'>Before: <span> $" + element.order.price.toFixed(2) + "</span></small></td><td class='col-6 col-md-6'>One of our best pizzas, have have " + element.pizza.crust + ", " + element.pizza.sauce + "topping: " + element.pizza.topping + "</td><td class='col-md-2'><a href='' class='btn btn-primary'>Order now</a></td></tr>"
  }

  getRequest("get", "dealTable", "http://localhost:5331/DB/orders", option);

</script>