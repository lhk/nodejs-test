
express = require("express")
app=express.createServer()
app.use(express.static(__dirname))
app.set "views", __dirname + "/views"
app.set "view engine", "jade"
app.get "/", (req,res)->
	res.render "index"

app.listen(4000)