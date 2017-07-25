var nodemailer = require('nodemailer');
module.exports = function() {

  var transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: process.env.SMTP_PORT,
    secure: true, // secure:true for port 465, secure:false for port 587
    auth: {
      user: 'jesusTheBestPizza@gmail.com',
      pass: 'jesuspizzaasd'
    }
  });

  function loadEmail(user) {
    console.log(user);
    var image = "http://45.55.65.103/jesus/static/img/logo2.jpg";
    var mailOptions = {
      from: 'jesusTheBestPizza@gmail.com',
      to: user.email,
      subject: 'Your pizza is on its way',
      html: "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'><html xmlns='http://www.w3.org/1999/xhtml'><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8' /><title>Jesus Pizza</title><meta name='viewport' content='width=device-width, initial-scale=1.0'/></head><body style='margin: 0; padding: 0;'><table border='0' cellpadding='0' cellspacing='0' width='100%'><tr><td><table align='center' border='0' cellpadding='0' cellspacing='0' width='600'><tr><td align='center' bgcolor='#70bbd9'><img src='"+ image +"' alt='Creating Email Magic' width='600' height='250' style='display: block;' /></td></tr><tr><td bgcolor='#ffffff' style='padding: 40px 30px 40px 30px;'><table border='0' cellpadding='0' cellspacing='0' width='100%'><tr><td style='color: #153643; font-family: Arial, sans-serif; font-size: 24px;'><b>Your pizza in on its way!</b></td></tr><tr><td height='50'><p>Your pizza in on the way to your home. You can start counting down because we know is hard to wait for this delicius pizza.<br><br><br>In case you want to cancel please hurry up you just can cancel the order if the pizza guy has less than two minutes in the road!</p></td></tr><tr><td><table><tr width='600' height='30' style='border-top: 2px solid #ccc; padding: 20px 0px 20px 0px; margin-top: 50px;'><td width='300' style='text-align: center;border-top: 2px solid #ccc;border-bottom: 2px solid #ccc;'><b>Order Number</b></td><td width='300' style='text-align: center;border-top: 2px solid #ccc;border-bottom: 2px solid #ccc;'><b>User</b></td> <td width='300' style='text-align: center;border-top: 2px solid #ccc;border-bottom: 2px solid #ccc;'><b>Date</b></td></tr><tr style='border: 2px solid #ccc' width='600' height='40'><td width='300' style='text-align: center;border-bottom: 2px solid #ccc;'>"+ user.number + "</td><td width='300' style='text-align: center;border-bottom: 2px solid #ccc;'>" + user.name + "</td><td width='300' style='text-align: center;border-bottom: 2px solid #ccc;'>" + user.date + "</td></tr></table></td></tr></table></td></tr><tr><td bgcolor='#333;' style='padding: 30px 100px 30px 100px;'><table border='0' cellpadding='0' cellspacing='0' width='100%'><tr><td style='color: #fff; text-align: center'>Pizza</td><td style='color: #fff; text-align: center'>Deals</td><td style='color: #fff; text-align: center'>Our Page</td></tr></table></td></tr></table></td></tr></table></body></html>"
    }

    transporter.sendMail(mailOptions, function(error, info) {
      if (error) {
        console.log(error);
      } else {
        console.log('Email sent: ' + info.response);
      }
    })
  };
  return loadEmail;
};