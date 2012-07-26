
express = require("express")
app=express.createServer()
app.use(express.static(__dirname))
app.set "views", __dirname + "/views"
app.set "view engine", "jade"
app.get "/", (req,res)->
	res.render "index"

server=app.listen(80)

io=require("socket.io").listen(server)
io.sockets.on "connection", (socket)->
	socket.broadcast.emit "news", "someone has joined us"
	socket.emit "news", "hi"
	socket.emit "news", "hello world"
	socket.on "news", (data)->
		io.sockets.emit "news", data
	socket.on "disconnect", ()->
		io.sockets.emit "news", "someone has left us"