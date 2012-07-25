socket=io.connect("http://localhost")
socket.on("message", (data)-> 
	$("#log ul").append("<li>"+data+"</li>"))
