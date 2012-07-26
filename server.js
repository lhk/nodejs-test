// Generated by CoffeeScript 1.3.3
(function() {
  var file_path, fs, http, sys;

  http = require("http");

  fs = require("fs");

  sys = require("sys");

  file_path = __dirname + "/index.html";

  fs.stat(file_path, function(err, stat) {
    var server;
    console.log(err);
    server = http.createServer(function(req, res) {
      var rs;
      console.log("new request");
      res.writeHead(200, {
        "Content-Type": "text/html",
        "Content-Length": stat.size
      });
      rs = fs.createReadStream(file_path);
      return sys.pump(rs, res, function(err) {
        if (err) {
          throw err;
        }
      });
    });
    return server.listen(4000);
  });

}).call(this);
