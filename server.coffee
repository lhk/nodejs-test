express=require("express")
app = express.createServer()

app.set("views", __dirname + "/views")
app.set("view engine", "jade")

app.get("/",(req,res) -> res.render("index"))
app.listen(4000)

io = require("socket.io").listen(app)
io.sockets.on("connection", (socket)->
	socket.send("Welcome to this chat server")
	socket.send("Please input your username: ")

	socket.on("message",(message)->
		io.sockets.send(message)))