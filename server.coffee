http = require("http")
fs = require("fs")
sys = require("sys")

file_path = __dirname + "/index.html"
fs.stat file_path, (err,stat)->
	console.log err
	server = http.createServer (req,res)->
		console.log "new request"

		res.writeHead(200, 
			{"Content-Type":"text/html",
			"Content-Length":stat.size})

		rs=fs.createReadStream file_path

		sys.pump rs,res, (err)->
			if err
				throw err

	server.listen 4000