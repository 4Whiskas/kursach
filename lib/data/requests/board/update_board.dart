import 'package:http/http.dart' as http;
import 'package:kursach/data/headers/login_header.dart';

///Data looks like:
///{
///  "token": "string",
///  "boardid": 0,
///  "title": "string"
///}
///Response looks like:
///
///token - user`s auth token;
///title - new name of board;
Future<http.Response> updateBoard(String data)async{
  var url = Uri.parse("http://217.25.89.68:25448/Board/updateboard");
  var response = await http.post(url, headers: loginHeaders, body: data);
  return response;
}