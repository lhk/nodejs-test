// Generated by CoffeeScript 1.3.3
(function() {
  var app, express, io, server;

  express = require("express");

  app = express.createServer();

  app.use(express["static"](__dirname));

  app.set("views", __dirname + "/views");

  app.set("view engine", "jade");

  app.get("/", function(req, res) {
    return res.render("index");
  });

  server = app.listen(80);

  io = require("socket.io").listen(server);

  io.sockets.on("connection", function(socket) {
    socket.broadcast.emit("news", "someone has joined us");
    socket.emit("news", "hi");
    socket.emit("news", "hello world");
    socket.on("news", function(data) {
      return io.sockets.emit("news", data);
    });
    return socket.on("disconnect", function() {
      return io.sockets.emit("news", "someone has left us");
    });
  });

}).call(this);
