const express= require('express');
const app= express()
const fs= require('fs');
const { Console } = require('console');
app.get('/video',function(req,res){
	res.writeHead(200,{'Content-Type':'video/mp4'})
var rs=fs.createReadStream('D:/youtube/experiment/glichoo.mp4')
rs.pipe(res);
}
);
app.listen(8000,function(){
console.log("server is listening")
});
