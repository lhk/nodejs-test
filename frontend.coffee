$ ->
	alert("ready")
	$("p").html "jQuery test passed"
	$("#log ul").append "<li>low-level chat room </li>"

///socket=io.connect("http://localhost")
socket.on("message", (data)->
	console.log(data)
	alert("message")
	$("ul").append("<li>"+data+"</li>"))
///