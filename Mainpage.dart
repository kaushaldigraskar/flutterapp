import 'package:flutter/material.dart';
import 'package:mongodb/connectivity.dart';

import 'AdduserPage.dart';
class Mainpage  extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainpageState();
}}
class User{
  int  id;
  String name;
  User(this.id,this.name);
}

class _MainpageState extends State<Mainpage > {
  List<User> users=[];
  var inUser;
 Future<void> refreshUser() async{
   var result=await http_get("user");
  if(result.ok){
     setState(() {
       users.clear();
        inUser=result.data as List<dynamic>;
       inUser.forEach((inUser){
       users.add(User(
         inUser['id'] ,
         inUser['user']
       ));
     });
     });
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("User"
      ),
      actions: <Widget>[IconButton(icon:Icon(Icons.add),onPressed:(){
        Navigator.of(context).push(MaterialPageRoute(
        builder:(context){
          return AdduserPage();
        } ));
      
      }
      )
      ]
      ),
      body: RefreshIndicator(onRefresh:refreshUser,
      child: ListView.separated(
        itemCount:users.length,
        itemBuilder: (BuildContext context,int i)=>ListTile(leading:Icon(Icons.person),title:Text(users[i].name)
        ),
         separatorBuilder:(context,i)=>Divider(),
          ),),
      );
      }
      }