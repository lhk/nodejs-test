$ ->
	alert("ready")
	$("p").html "jQuery test passed"

///socket=io.connect("http://localhost")
socket.on("message", (data)->
	console.log(data)
	alert("message")
	$("ul").append("<li>"+data+"</li>"))
///