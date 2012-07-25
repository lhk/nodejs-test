express=require("express")
app = express.createServer()

listen=(req,res)->
	 res.send("Hello World")

app.get("/",listen)
app.listen(4000)
