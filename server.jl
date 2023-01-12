using Genie, Genie.Requests, Genie.Renderer.Json
Genie.config.run_as_server = true

data = ["Hello", "World!"]

route("/") do 
	"Hello, World!"
	end
	
route("/data") do 
	json(data)
	end
	
route("/data/:index") do
	i = parse(Int64, payload(:index))
	data[i]
	end
	
route("/data", method = POST) do 
	message = jsonpayload()
	push!(data, message["data"])
	json(data)
	end
	
route("/data/:index", method = PUT) do
	i = parse(Int64, payload(:index))
	message = jsonpayload()
	data[i] = message["data"]
	json(data)
	end
	
route("/data/:index", method = DELETE) do
	i = parse(Int64, payload(:index))
	deleteat!(data, i)
	json(data)
	end
	
up()