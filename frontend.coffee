$ ->
	$("#log").append "<li>to the low-level chat room </li>"
	input=$("#entry")

	socket=io.connect "http://privatechat.jit.su/"
	socket.on "news", (data)->
		$("#log").append "<li>"+data+"</li>"
		window.scrollBy(0,1000)
		input.focus

	input.keypress (event)->
		if event.which != 13 
			return
		message= input.attr("value")
		if message
			socket.emit("news",message)

