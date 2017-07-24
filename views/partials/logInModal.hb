<!-- Small modal -->
<div id="login_modal">
  <div class="modal fade logInModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="container-fluid">
          <div class="alert alert-danger hidden-xs-up" id="registerFail" role="alert">
          </div>
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" data-toggle="tab" href="#login" role="tab">Log In</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#register" role="tab">Register</a>
            </li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="login" role="tabpanel">
              <form>
                <div class="form-group">
                  <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="email" placeholder="Enter email" required/>
                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                  <input type="password" name="password" class="form-control" id="password" placeholder="Password"/>
                </div>
                <input type="submit" value="Log In!" class="btn btn-primary" onclick="return(submitForm(event, this, './db/authenticate'));" required/>
              </form>
            </div>
            <div class="tab-pane" id="register" role="tabpanel">
              <form>
                <div class="form-group">
                  <input type="text" class="form-control" id="username" placeholder="Enter name" name="name" required/>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control" id="newEmail" aria-describedby="emailHelp" placeholder="Enter email" name="email" required/>  
                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                  <input type="password" class="form-control" id="newPassword" name="password" placeholder="Password"/>
                </div>
                <input type="submit" 
                onclick="return(submitForm(event, this,'./db/user'));" 
                value="Register" class="btn btn-primary" required/>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script>

function login() {
  return ({
    email: document.getElementById("email").value,
    password: document.getElementById("password").value
  })
}

function register() {
  return ({
    name: document.getElementById("username").value,
    email: document.getElementById("newEmail").value,
    password: document.getElementById("newPassword").value
  })
}

function submitForm(e, element, url)
{
  var user = {}
  e.preventDefault();
  var xhr = new XMLHttpRequest();
  xhr.onload = function() { 
  }
  if(element.value === "Register") {
    user = register();
  } else {
    user = login();
  }
  xhr.open("POST", url);
  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
  xhr.send(JSON.stringify(user));
  xhr.onreadystatechange = function() {
    if(xhr.readyState === 4) {
      console.log(xhr);
    if(xhr.status != 200) {
      document.getElementById("registerFail").classList.remove("hidden-xs-up");
      document.getElementById("registerFail").innerHTML = "<strong>Something wrong!</strong>" + xhr.responseText;
    } else {
      var userElement = JSON.parse(xhr.response);
      document.getElementById("registerSuccess").classList.remove("hidden-xs-up");
      document.getElementById("registerSuccess").innerHTML = "<strong>Hello Pizza eater! </strong> How you feel today Mr/Ms " + userElement.name;
      hide();
      init(userElement._id);
      }
    }
  }
  return false;
}
</script>