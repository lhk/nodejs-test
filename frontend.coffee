$ ->
	alert("welcome")
	$("p").html "jQuery test passed"
	$("#log").append "<li>low-level chat room </li>"
	socket=io.connect "http://localhost"
	alert("still running")
	socket.on "news", (data)->
		$("#log").append "<li>"+data+"</li>"

