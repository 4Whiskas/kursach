import 'package:http/http.dart' as http;
import 'package:kursach/data/headers/login_header.dart';

///Data looks like:
///{
///"token": "string",
///"cardid": 0,
///"title": "string",
///"description": "string",
///"state": "string",
///"deadline": "2021-12-15T21:28:32.072Z"
///}
///
///Response looks like:
///
Future<http.Response> updateCard(String data)async{
  var url = Uri.parse("http://217.25.89.68:25448/Board/updatecard");
  var response = await http.post(url, headers: loginHeaders, body: data);
  return response;
}