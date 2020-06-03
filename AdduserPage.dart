import 'package:flutter/material.dart';
import 'package:mongodb/connectivity.dart';
import 'package:http/http.dart'as http;
class AdduserPage  extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AdduserPageState();
}}

class _AdduserPageState extends State<AdduserPage> {
TextEditingController nameController=TextEditingController();
String response="";
createUser()async{
  var result=await http_post("create-user",{
    "name":nameController.text,
  });
  if(result.ok){
    setState(() {
      
  response=result.data['status'];
    });
  }

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Adduser"
      )
      ),
      body:Column(
        children:<Widget>[
          TextField(controller:nameController 
          ,decoration:InputDecoration(
            hintText:"Name"
          ),),
          RaisedButton(child:Text("Create"),onPressed:createUser),
          Text(response)
        ]
      ),
      );
      }
      }