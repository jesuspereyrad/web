<!-- Small modal -->
<div id="login_modal">
  <div class="modal fade bd-example-modal-md" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="container-fluid">
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
                  <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                  <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
                <button type="submit" class="btn btn-primary">Log In!</button>
              </form>
            </div>
            <div class="tab-pane" id="register" role="tabpanel">
              <form>
                <div class="form-group">
                  <input type="text" class="form-control" id="username" placeholder="Enter name">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control" id="userEmail" aria-describedby="emailHelp" placeholder="Enter email">  
                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                  <input type="password" class="form-control" id="userPassword" placeholder="Password">
                </div>
                <button type="submit" class="btn btn-primary">Register</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>