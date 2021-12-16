import 'package:http/http.dart' as http;
import 'package:kursach/data/headers/login_header.dart';

///Data looks like:
///{
///  "token": "string",
///  "title": "string",
///  "description": "string",
///  "state": "string",
///  "boardid": int,
///   "deadline": "2021-12-16T07:04:57.161Z"
///}
///Response looks like:
///
Future<http.Response> createCard(String data)async{
  var url = Uri.parse("http://217.25.89.68:25448/Board/card");
  var response = await http.post(url, headers: loginHeaders, body: data);
  return response;
}