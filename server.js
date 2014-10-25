#!/bin/sh
':' //; exec "$(command -v nodejs || command -v node)" "$0" "$@"

var _ = require('underscore'),
    fs = require("fs"),
    sys = require("sys"),
    http = require("http"),
    exec = require('child_process').exec,
    moment = require("moment"),
    Convert = require('ansi-to-html');

var convert = new Convert()
var port = 1337;
var template = _.template(fs.readFileSync('template.html', 'utf-8'));

function timestamp() {
    return moment().format("YYYY-MM-DDThh:mm:ss");
}

function lagHtml(ansiText) {
    var status = convert.toHtml(ansiText);
    status = status.replace(/\n  /g , "<br/>&nbsp;&nbsp;");
    status = status.replace(/\n/g , "<br/>");
    return template({status: status});
}

http.createServer(function(request, response){
    exec('./status.sh', function (error, stdout, stderr) {
        sys.puts(timestamp());
        response.writeHeader(error ? 500 : 200, {"Content-Type": "text/html"});
        response.write(lagHtml(stdout));
        response.end();
    });
}).listen(port);

sys.puts("Serving health check on port " + port + " yo"); 
