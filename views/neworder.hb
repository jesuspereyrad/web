<!-- CREATE ORDER PATH -->
<div id="new_order">
<!-- GUIDE JUMBOTRON -->
  
  <div class="jumbotron col-10 offset-1">
    <div class="box">
      <!-- Nav tabs -->
      <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" data-toggle="tab" href="#ready" role="tab">Ready</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#size" role="tab">Size</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#crust" role="tab">Crust</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#topping" role="tab">Toppings</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#review" role="tab">Review</a>
        </li>
      </ul>

      <!-- Tab panes -->
      <div class="tab-content">
        <div class="tab-pane active" id="ready" role="tabpanel">
          <div class="center">
            <h1>Are your ready to create your own pizza</h1>
            <h4>Click the button when you are ready!</h4>
            <div class="col-6 col-md-4 offset-md-4 offset-3">
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-md">Ready</button>
            </div>
          </div>
        </div>
        <div class="tab-pane" id="size" role="tabpanel">
          <div class="center">
            <h2>Select a Size</h2>
            <div class="row box">
              <div class="col-12 col-md-3">
                <h3>X Large</h3>
                <div class="item col-12">
                  <img class="image img-fluid active" src="https://www.placehold.it/300x300">
                </div>
              </div>
              <div class="col-12 col-md-3">
              <h3>Large</h3>
                <div class="item col-10">
                  <img class="image img-fluid" src="https://www.placehold.it/300x300">
                </div>
              </div>
              <div class="col-12 col-md-3">
              <h3>Medium</h3>
                <div class="item col-8">
                  <img class="image img-fluid" src="https://www.placehold.it/300x300">
                </div>
              </div>
              <div class="col-12 col-md-3">
                <h3>Small</h3>
                <div class="item col-6">
                  <img class="image img-fluid" src="https://www.placehold.it/300x300">
                </div>
              </div>
            </div>
          </div>
  <!--         <div class="col-6 col-md-4 offset-md-8">
            <a href="#crust" class="btn btn-lg btn-danger">Next</a>
          </div> -->
        </div>
        <div class="tab-pane" id="crust" role="tabpanel">
          <div class="center">
            <h2>Select Crust</h2>
            <div>
              <div class="card-deck">
                <div class="card">
                  <div class="card-block">
                    <h4 class="card-title">Crust title</h4>
                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                  </div>
                </div>
                <div class="card">
                  <div class="card-block">
                    <h4 class="card-title">Crust title</h4>
                    <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                  </div>
                </div>
                <div class="card">
                  <div class="card-block">
                    <h4 class="card-title">Crust title</h4>
                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="tab-pane" id="topping" role="tabpanel">
          <div class="center">
            <h2>Select Topping</h2>
            <form>
              <div class="col-8 offset-2">
                <div class="row">
                  <div class="col-12 col-md-4">
                    <div class="form-group">
                      <label for="exampleSelect2">Cheese</label>
                      <select multiple class="form-control" id="exampleSelect2">
                        <option>Provolone</option>
                        <option>Parmesan</option>
                        <option>Suize</option>
                        <option>Gouda</option>
                        <option>Mozarella</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-12 col-md-4">
                    <div class="form-group">
                      <label for="exampleSelect2">Meat</label>
                      <select multiple class="form-control" id="exampleSelect2">
                        <option>Provolone</option>
                        <option>Parmesan</option>
                        <option>Suize</option>
                        <option>Gouda</option>
                        <option>Mozarella</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-12 col-md-4">
                    <div class="form-group">
                      <label for="exampleSelect2">Vegetable</label>
                      <select multiple class="form-control" id="exampleSelect2">
                        <option>Provolone</option>
                        <option>Parmesan</option>
                        <option>Suize</option>
                        <option>Gouda</option>
                        <option>Mozarella</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="tab-pane" id="review" role="tabpanel">
          <div class="center">
            <h2>Review Order</h2>
            <h4>Size</h4>
            <h4>Crust</h4>
            <h4>Toppings</h4>
            <div class="col-6 col-sm-4 offset-4">
              <a href="" class="btn btn-sm btn-primary">Order now!</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Login MODAL -->
{{> logInModal}}