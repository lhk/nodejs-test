express=require("express")
app = express.createServer()

app.set("views", __dirname + "/views")
app.set("view engine", "jade")

app.get("/",(req,res) -> res.render("index"))
app.listen(80)

io = require("socket.io").listen(app)
io.sockets.on("connection", (socket)->
	socket.emit("news", {hello:"world"})
	socket.on("other event", (data) -> 
		console.log(data)))