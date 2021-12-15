import 'package:http/http.dart' as http;
import 'package:kursach/data/headers/login_header.dart';

///Data looks like:
///{
///  "token": "string",
///  "id": 0,
///  "skip": 0,
///  "take": 0
///}
///
///Response looks like:
///
Future<http.Response> getHistory(String data)async{
  var url = Uri.parse("http://217.25.89.68:25448/Message/history");
  var response = await http.post(url, headers: loginHeaders, body: data);
  return response;
}