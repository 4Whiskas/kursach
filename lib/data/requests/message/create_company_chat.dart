import 'package:http/http.dart' as http;
import 'package:kursach/data/headers/login_header.dart';

///Data looks like:
///{
///  "token": "string",
///  "name": "string"
///}
///
///
///Response looks like:
///
Future<http.Response> createCompanyChat(String data)async{
  var url = Uri.parse("http://217.25.89.68:25448/Message/chat");
  var response = await http.post(url, headers: loginHeaders, body: data);
  return response;
}