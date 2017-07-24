<!-- CREATE ORDER PATH -->
<div id="new_order">
<!-- GUIDE JUMBOTRON -->
  
  <div class="jumbotron col-10 offset-1">
  <div class="alert alert-success hidden-up" role="alert">
    <strong>Something wrong!</strong> Complete everything.
  </div>

    <div class="box">
      <!-- Nav tabs -->
      <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" data-toggle="tab" href="#readyTab" role="tab">Ready</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#sizeTab" role="tab">Size</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#sauceTab" role="tab">Sauce</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#crustTab" role="tab">Crust</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#toppingTab" role="tab">Toppings</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#reviewTab" role="tab" onclick="populateTable();">Review</a>
        </li>
      </ul>

      <!-- Tab panes -->
      <div class="tab-content">
        <div class="tab-pane active" id="readyTab" role="tabpanel">
          <div class="center">
            <h1>Are your ready to create your own pizza</h1>
            <h4>Click the button when you are ready!</h4>
            <div class="col-6 offset-3">
              <input type="text" name="title" id="pizzaTitle" class="form-control" placeholder="Name your pizza!" />
              <!-- <button style="margin: 15px" type="button" id="next" class="btn btn-primary">Next</button> -->
            </div>
          </div>
        </div>
        <div class="tab-pane" id="sizeTab" role="tabpanel">
          <div class="center">
            <h2>Select a Size</h2>
            <div class="row box">
              <div onclick="selectSize(this)" value="20.00" class="col-12 col-md-3 size">
                <h2>X Large</h2>
                <h3>$20.00</h3>
                <div class="item col-12">
                  <img class="image img-fluid activeImage" id="xLarge" src="https://www.placehold.it/300x300">
                </div>
              </div>
              <div onclick="selectSize(this)" value="15.00" class="col-12 col-md-3 size">
                <h2>Large</h2>
                <h3>$15.00</h3>
                <div class="item col-10">
                  <img class="image img-fluid" id="large" src="https://www.placehold.it/300x300">
                </div>
              </div>
              <div onclick="selectSize(this)" value="13.00" class="col-12 col-md-3 size">
                <h2>Medium</h2>
                <h3>$13.00</h3>
                <div class="item col-8">
                  <img class="image img-fluid" id="medium" src="https://www.placehold.it/300x300">
                </div>
              </div>
              <div onclick="selectSize(this)" value="10.00" class="col-12 col-md-3 size">
                <h2>Small</h2>
                <h3>$10.00</h3>
                <div class="item col-6">
                  <img class="image img-fluid" id="small" src="https://www.placehold.it/300x300">
                </div>
              </div>
            </div>
          </div>
  <!--         <div class="col-6 col-md-4 offset-md-8">
            <a href="#crust" class="btn btn-lg btn-danger">Next</a>
          </div> -->
        </div>
        <div class="tab-pane" id="sauceTab" role="tabpanel">
          <div class="center">
            <h2>Select Sauce</h2>
            <div class="container">
              <div class="card-deck" id="sauce">
                
              </div>
            </div>
          </div>
        </div>
        <div class="tab-pane" id="crustTab" role="tabpanel">
          <div class="center">
            <h2>Select Crust</h2>
            <div class="container">
              <div class="card-deck" id="crust">
                
              </div>
            </div>
          </div>
        </div>
        <div class="tab-pane" id="toppingTab" role="tabpanel">
          <div class="center">
            <h2>Select Topping</h2>
            <form>
              <div class="col-8 offset-2">
                <div class="row">
                  <div class="col-12 col-md-4">
                    <div class="form-group">
                      <label for="cheese">Cheese</label>
                      <select multiple class="form-control" id="cheese">
                        
                      </select>
                    </div>
                  </div>
                  <div class="col-12 col-md-4">
                    <div class="form-group">
                      <label for="meat">Meat</label>
                      <select multiple class="form-control" id="meat">
                      </select>
                    </div>
                  </div>
                  <div class="col-12 col-md-4">
                    <div class="form-group">
                      <label for="vegetable">Vegetable</label>
                      <select multiple class="form-control" id="vegetable">
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="tab-pane" id="reviewTab" role="tabpanel">
          <div class="container">
            <table class="table">
              <thead class="thead-default">
                <tr class="row col-12">
                  <th class="col-12" style="text-align: center" id="PizzaTitleDescription"></th>
                </tr>
              </thead>
              <tbody id="tableBody">
                
              </tbody>
            </table>
            <input type='submit' onclick="return(submitPizza(event));" class='btn btn-primary col-6 col-md-3 offset-md-9'/>
            <div id="hide" class="hidden-sm-up">
            </div>
          </div>
        </div>
      </div>
       <div class="col-6 offset-3">
         <button style="margin: 15px" type="button" id="back" class="btn btn-primary">Back</button>
         <button style="margin: 15px" type="button" id="next" class="btn btn-primary">Next</button>
       </div>
    </div>
  </div>
</div>

<!-- Login MODAL -->
{{> logInModal}}

<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

<script>
  var formData = new FormData();
  var pizza = {};
  var order = {};
  pizza.type = 'USER';
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
    return ("<option value=" + element._id + " name=' "+ element.name + " '>" + element.name + "</option>");
  }

  var card = function(element) {
    console.log(element.name);
    return "<div class='card' onclick='select(this)' id='" + element._id + "' name='"+ element.name + "' style='width:20%;'><img class='card-img-top' src='" + element.url + "' alt='Card image cap' width=100% height=200px/> <div class='card-block'><h4 class='card-title'>" + element.name + "</h4> <p class='card-text'>" + element.description + "</p></div></div>"
  }

  getRequest("get", "cheese", "http://localhost:5331/DB/toppings/CHEESE", option);
  getRequest("get", "meat", "http://localhost:5331/DB/toppings/MEAT", option);
  getRequest("get", "vegetable", "http://localhost:5331/DB/toppings/VEGETABLE", option);
  getRequest("get", "crust", "http://localhost:5331/DB/ingredients/CRUST", card);
  getRequest("get", "sauce", "http://localhost:5331/DB/ingredients/SAUCE", card);

  var selectSize = function(element, active) {
    var active = document.getElementsByClassName("activeImage");
    active[0].classList.remove('activeImage');
    var test = element.getElementsByClassName("image")[0];
    test.classList.add("activeImage");
    pizza.size = ({
      type: "size",
      value: element.getAttribute("value"),
      name: test.id
    });
    order.size = test.id;
    order.value = element.getAttribute("value");
  }
  var select = function(element) {
    var father = element.parentElement.id;
    // console.log(document.getElementsByClassName("activeSelect"))
    if(document.getElementsByClassName(father + "active").length == 1) {
      var active = document.getElementsByClassName(father+"active");
      active[0].classList.remove(father+'active');
    }
    element.classList.add(father+"active");
    pizza[father] = ({
      type: "ingredient",
      _id: element.id,
      name: element.getAttribute("name")
    });
  };

  var getValues = function(topping) {
    var topping = document.getElementById(topping);
    var item = [];
    var name = [];
    for (var i = 0; i < topping.length; i++) {
      if (topping.options[i].selected) {
        item.push(topping.options[i].value);
        name.push(topping.options[i].text);
      };
    };

    pizza[topping.id] =  ({
      type: "topping",
      _id: item,
      name: name
    });
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

function submitPizza(e)
  {
    e.preventDefault();
    var xmlhttp = new XMLHttpRequest();   // new HttpRequest instance 
    xmlhttp.open("POST", "/db/pizza");
    xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xmlhttp.send(JSON.stringify(pizza));
    xmlhttp.onreadystatechange = function() {
      if(xmlhttp.readyState === 4) {
        pizza._id =  JSON.parse(xmlhttp.responseText);
        order.pizza = pizza._id;
        order.status = ['ACTIVE'];
        createForm();
        if(document.getElementById("lastOne")) {
          document.getElementById("lastOne").click();
        }
      }
    }
  }

function createForm() {
  document.getElementById("hide").innerHTML = "<form type='hidden' id='submitObject' onsubmit='return(checkout());' method='POST' action='/checkout'><input name='pizzaId' value='"+ order.pizza._id +"'><input name='other' value='"+ JSON.stringify(order) + "'><input type='submit' id='lastOne' class='btn btn-primary col-6 col-md-3 offset-md-9'/></form>";
}

function checkout() {
  var xmlhttp = new XMLHttpRequest();   // new HttpRequest instance 
  xmlhttp.open("POST", "/checkout");
  xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
  xmlhttp.send(JSON.stringify(pizza), JSON.stringify(order));
}
</script>

<script>
  $('#next').click(function(){
    console.log("lkl");
    if($('.nav-tabs > .nav-item > .active').parent().next('li').length > 0) {
      $('.nav-tabs > .nav-item > .active').parent().next('li').find('a').trigger('click');
    } else {
      $('#next').hide();
    }
  });
  $('#back').click(function(){
    if($('.nav-tabs > .nav-item > .active').parent().prev('li').length > 0) {
      $('#back').show();
      $('.nav-tabs > .nav-item > .active').parent().prev('li').find('a').trigger('click');
    } else {
      $('#back').hide();
    }  
  });
</script>