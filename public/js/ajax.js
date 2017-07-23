// <script>
// getRequest = function(method, father, url, func) {
//     var client = new XMLHttpRequest();
//     client.onreadystatechange = function() {
//       if(client.readyState === 4) {
//         var clientjs = JSON.parse(client.responseText);
//         var string = "";
//         clientjs.forEach(function (element) {
//           string += func(element);
//         })
//         if(document.getElementById(father) != null) {
//           document.getElementById(father).innerHTML = string;
//         }
//         else {
//           (document.getElementsByClassName(father))[0].innerHTML = string;
//         }
//       }
//     }
//     client.open(method, url);
//     client.send();
//   }

// </script>