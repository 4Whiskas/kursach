import 'package:http/http.dart' as http;
import 'package:kursach/data/headers/login_header.dart';

///Data looks like:
///{
///  "token": "string",
///  "title": "string",
///  "description": "string",
///  "state": "string",
///}
///Response looks like:
///
Future<http.Response> updateBoard(String data)async{
  var url = Uri.parse("http://217.25.89.68:25448/Board/card");
  var response = await http.post(url, headers: loginHeaders, body: data);
  return response;
}