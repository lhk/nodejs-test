// Generated by CoffeeScript 1.3.3
(function() {

  $(function() {
    var input, socket;
    $("#log").append("<li>to the low-level chat room </li>");
    input = $("#entry");
    socket = io.connect("http://privatechat.jit.su/");
    socket.on("news", function(data) {
      $("#log").append("<li>" + data + "</li>");
      window.scrollBy(0, 1000);
      return input.focus;
    });
    return input.keypress(function(event) {
      var message;
      if (event.which !== 13) {
        return;
      }
      message = input.attr("value");
      if (message) {
        return socket.emit("news", message);
      }
    });
  });

}).call(this);
