//Base controller

//Get entity from the database
module.exports = {

getObject: function(object, type, req, res) {
  object.find(function(err, crust) {
    if (err){
      res.status(404).send(type + "not found");
    }
    else {
      console.log('GET /' + type);
      res.status(200).json(object);
    }
  });
};

module.exports = "baseController";


