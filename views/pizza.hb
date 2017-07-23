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
    console.log(element.name);
    return "<tr class='col-12 col-lg-12'><td class='col-6 col-lg-3'>" + element.title + "</td><td class='col-6 col-lg-5'>One of our best pizzas, have " + element.crust + ", " + element.sauce + "topping: " + element.topping +"</td><td class='col-6 col-lg-2'><img class='image' src='" + element.image + "'></td><td class='col-lg-2'><a href='' class='btn btn-primary'>Order now</a></td></tr>";
  }

  getRequest("get", "pizzaTable", "http://localhost:5331/DB/pizzas/PREMADE", option);

</script>