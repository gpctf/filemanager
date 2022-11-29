var express=require('express');
var app=express();
//add body parser
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
const fs = require('fs');
app.get('/',function(req,res){
    res.send(fs.readFileSync("app/index.html").toString());
});
//endpoint /data/:path and return content of file in folder data/path
app.get('/data/:path',function(req,res){
    res.send(fs.readFileSync("data/"+req.params.path).toString());
});
app.post('/upload',(req,res)=>{
    console.log(req.body)
    fs.writeFileSync("data/"+req.body.path,req.body.content);
    res.send("zapisano link do pliku: data/"+req.body.path);
});
app.listen(process.env.PORT||3000);