<!-- REORDER PATH -->
<div id="re_order">
  <!-- Authentication MODAL -->
  {{> logInModal}}
  <!-- Show Previous Orders -->
  <div class="jumbotron">
    <h1>Your orders</h1>
    <h4>Buy one again!</h4>
  </div>
  <div class="container">
    <div class="alert alert-success hidden-xs-up" id="registerSuccess" role="alert">
    </div>
    <table class="table table-sm table-responsive">
      <thead>
        <tr class="col-12 col-lg-12">
          <th class="col-6 col-lg-3">Pizza</th>
          <th class="col-6 col-lg-5">Date</th>
          <th class="col-6 col-lg-2">Price</th>
          <th class="col-6 col-lg-2">Get It Now</th>
        </tr>
      </thead>
      <tbody id="reorderTable">
      </tbody>
    </table>
  </div>
  <!-- Make Order Again -->
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

  function formattedDate(date) {
    let month = String(d.getMonth() + 1);
    let day = String(d.getDate());
    const year = String(d.getFullYear());

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return `${month}/${day}/${year}`;
  }

  function init(userId) {
    var option = function(element) {
      var date = (new Date(element.order.date)).toDateString();
      return "<tr class='col-12 col-lg-12'><td class='col-6 col-lg-3'>" + element.pizza.title + "</td><td class='col-6 col-lg-5'>" + date + "</td><td class='col-6 col-lg-2'>" + element.order.price + " </td><td class='col-6 col-lg-2'><a href=' 'class='btn btn-primary'>Order now</a></td></tr>"
    }

    getRequest("get", "reorderTable", "http://localhost:5331/DB/userOrders/" + userId, option);
  }

</script>