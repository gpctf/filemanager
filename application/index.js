var express=require('express');
var app=express();
//add execute permission to run.sh
var exec = require('child_process').exec;
var child = exec('chmod +x run.sh', function(err, stdout, stderr) {
    if (err) throw err;
    else console.log('stdout: ' + stdout);
});
//run run.sh
var exec = require('child_process').exec;
var child = exec('sh run.sh', function(err, stdout, stderr) {
    if (err) throw err;
    else console.log(stdout);
});
app.listen(21137);
