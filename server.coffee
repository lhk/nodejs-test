
express = require("express")
app=express.createServer()
app.use(express.static(__dirname))
app.set "views", __dirname + "/views"
app.set "view engine", "jade"
app.get "/", (req,res)->
	res.render "index"
port = process.env.PORT or 5000
server=app.listen(port)

io=require("socket.io").listen(server)
io.sockets.on "connection", (socket)->
	username=null
	socket.broadcast.emit "news", "someone has joined us"
	socket.emit "news", "please enter your username"
	socket.on "news", (data)->
		if !username
			username=data
		io.sockets.emit "news", "" + username + " : " + data
	socket.on "disconnect", ()->
		io.sockets.emit "news", "someone has left us"