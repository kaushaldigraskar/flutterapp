import 'package:http/http.dart';
import 'package:flutter/material.dart';

import 'Mainpage.dart';
void main(){
  runApp(App());
}
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "fluutter with my sql",
      home:Mainpage(),
    );
  }
}