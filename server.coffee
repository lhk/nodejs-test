express=require("express")
app = express.createServer()

io = require("socket.io").listen(app)
app.set("views", __dirname + "/views")
app.set("view engine", "jade")

app.get("/",(req,res) -> res.render("index"))
app.listen(4000)



