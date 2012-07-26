http = require("http")
fs = require("fs")

file_path = __dirname + "index.html"
fs.stat(file_path, (err,stat)->

	server = http.createServer((req,res)->
		console.log("new request")
		res.writeHead(200, 
			{"Content-Type":"text/html",
			"Content-Length":stat.size})
		fs.readFile("file_path", (err, file_content)->
			res.write(file_content)
			res.end)
	server.listen(4000)))



///io = require("socket.io").listen(app)
io.sockets.on("connection", (socket)->
	socket.send("Welcome to this chat server")
	socket.send("Please input your username: ")

	socket.on("message",(message)->
		io.sockets.send(message)))
///
///
app.set("views", __dirname + "/views")
app.set("view engine", "jade")

app.get("/",(req,res) -> res.render("index"))
///