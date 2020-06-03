import 'dart:convert';

import 'package:http/http.dart' as http;
class RequestResult{
  bool ok;
  dynamic data;
  RequestResult(this.ok,this.data);  
}
const Protocol="http";
const Domain="192.168.43.165:8000";
Future<RequestResult> http_get(String route,[dynamic data])async{
  var datastr=jsonEncode(data);
var url="$Protocol://$Domain/$route?data=$datastr";
var result= await http.get(url,headers:{"Accept":"application/json"});
var value =jsonDecode(result.body).toString();
return RequestResult(true,jsonDecode(result.body));
}
Future<RequestResult> http_post(String route,[dynamic data])async{
  var datastr=jsonEncode(data);
var url="$Protocol://$Domain/$route?data=$datastr";
var result= await http.post(url,body: datastr,headers:{"Content-Type":"application/json"} );
return RequestResult(true,jsonDecode(result.body));
}