<div id="team"> 
  <div class="container">
    <h1 class="title">Team Members</h1>
    <ul>
      <li>
        <div class="profile">
          <img src="http://placehold.it/100">
        </div>
        <div class="header">
          <h4>Mario Perez</h4>
          <p>dev</p>
        <div>
        <div class="body">
          <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
        </div>
      </li>
      <li>
        <div class="profile">
          <img src="http://placehold.it/100">
        </div>
        <div class="header">
          <h4>Mario Perez</h4>
          <p>dev</p>
        <div>
        <div class="body">
          <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
        </div>
      </li>
      <li>
        <div class="profile">
          <img src="http://placehold.it/100">
        </div>
        <div class="header">
          <h4>Mario Perez</h4>
          <p>dev</p>
        <div>
        <div class="body">
          <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
        </div>
      </li>
      <li>
        <div class="profile">
          <img src="http://placehold.it/100">
        </div>
        <div class="header">
          <h4>Mario Perez</h4>
          <p>dev</p>
        <div>
        <div class="body">
          <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
        </div>
      </li>
    </ul>
  </div>
  <div class="container">
    <h2 class="subtitle">Top projects</h2>
    <table class="table">
      <thead>
        <tr>
          <th>Name</th>
          <th>Team</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Perreo.net</td>
          <td>Blue Team</td>
        </tr>
        <tr>
          <td>Sancocho.do</td>
          <td>Red Team</td>
        </tr>
        <tr>
          <td>Greenworld.com</td>
          <td>Aguacate Team</td>
        </tr>
      </tbody>
    </table>
  </div>
  <div id="tree">
  </div>
  <div id="creation">
  </div>
</div>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) { 
  var footer = document.getElementsByClassName('footer');
  // footer.style.position = "relative";
  console.log(footer);
    //do work
  document.querySelector('.footer').style = 'position: inherit !important'
});
var tree = document.createElement('ul');
var lastfather;
var colors = {};
function init() {
  tree.setAttribute('class', 'treeExpansion');
  li = document.createElement('li');

  li.innerHTML = document.tagName;
  tree.appendChild(li)
    ul = document.createElement('ul');
    ul.setAttribute('class', 'father');
    tree.appendChild(ul);
    renderNode(0, ul, document.children[0]);
    document.getElementById("creation").appendChild(tree);
}

function renderNode(lvl, father, child)
{
  if(!colors[lvl]) {
    colors[lvl] = getRandomColor();
  }
  if(child.children) {
    if(child.children.length >= 0){
      li = document.createElement('li');
      li.innerHTML = child.tagName;
      li.style.backgroundColor = colors[lvl];
      father.appendChild(li)
    }

    for(var j = 0; j < child.children.length; j++) {
      ul = document.createElement('ul');
      ul.setAttribute('class', 'child');
      father.appendChild(ul);

      renderNode(lvl + 1, ul, child.children[j]);
    }    
  } 
}

function getRandomColor() {
  var letters = '0123456789ABCDEF';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}

init();

console.log(tree);
</script>
