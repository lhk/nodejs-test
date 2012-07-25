$ ->
	socket=io.connect("http://localhost")
	socket.on("message", (data)->
		alert("message")
		$("ul").append("<li>"+data+"</li>"))
