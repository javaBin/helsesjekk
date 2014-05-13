#!/usr/bin/env node

var sys = require("sys"),
    http = require("http"),
    moment = require("moment"),
    exec = require('child_process').exec;

var port = 1337;

function timestamp() {
    return moment().format("YYYY-MM-DDThh:mm:ss");
}

http.createServer(function(request, response){
    exec('./status.sh', function (error, stdout, stderr) {
        sys.puts(timestamp());
        response.writeHeader(200, {"Content-Type": "text/plain"});
        response.write(stdout);
        response.end();
    });
}).listen(port);

sys.puts("Serving health check on port " + port + " yo"); 
