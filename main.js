const express=require("express");
const mysql=require("mysql2/promise");
let conn=null;
const app= express();
app.use(express.json());


app.post('/create-person', async(req,res,next
 )=>{
     const name =req.body.name;

 await conn.query("INSERT INTO person (name) VALUES (?);",[name]);
     res.json({status:"OK"})
 next();
 });
app.get('/person',async(req,res,next)=>{
 const [rows]= await conn.query("SELECT * FROM person;");
 res.json(rows);
 next();
 });



async function main(){	
var config =
{
	host: 'rychus-server.mysql.database.azure.com',
	user: 'rychusCEO@rychus-server',
	password: 'iamceo@123',
	database: 'rychu',
	port: 3306,
};
 conn = await mysql.createConnection(config);
app.listen(8000);
}
main()

// conn.connect(
// 	function (err) { 
// 	if (err) { 
// 		console.log("!!! Cannot connect !!! Error:");
// 		throw err;
// 	}
// 	else
// 	{
// 	   console.log("Connection established.");
// 	   app.listen(8000);
// 	//    insertquery();
//     //     readData();
// 	 }	
// 	function insertquery(){
// 		conn.query('INSERT INTO person(name) VALUES(?);',['Yash'],
// 		function(err,results,fields){
// 			if(err)throw err;
// 		else console.log("Values is Inserted")
// 		})
// 	};
// function readData(){
// 	conn.query('SELECT * FROM person', 
// 		function (err, results, fields) {
// 			if (err) throw err;
// 			else console.log('Selected ' + results.length + ' row(s).');
// 			for (i = 0; i < results.length; i++) {
				
// 				console.log('Row: ' + JSON.stringify(results[i]));
// 			}
// 			console.log('Done.');
// 		})
//    conn.end(
// 	   function (err) { 
// 			if (err) throw err;
// 			else  console.log('Closing connection.') 
// 	});
