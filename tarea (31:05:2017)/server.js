var net = require('net');

//hacer que el programa de una respuesta al browser que diga 200 ok

const server = net.createServer((socket) => {
  socket.on('data', function(data) {
    console.log(data.toString())
}).on('error', (err) => {
  // handle errors here
  throw err;
});
  socket.write("HTTP/1.1 200 OK");
  socket.end();
});

// grab an arbitrary unused port.
server.listen(5331,() => {
  console.log('opened server on port 5331');
});

// server.connect()