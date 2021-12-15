import 'package:http/http.dart' as http;
import 'package:kursach/data/headers/login_header.dart';

///Data looks like:
///{
///  "token": "string",
///  "toid": 0,
///  "text": "string",
///  "reply": "string"
///}
///
///Response looks like:
///
Future<http.Response> sendMessage(String data)async{
    var url = Uri.parse("http://217.25.89.68:25448/Message/message");
  var response = await http.post(url, headers: loginHeaders, body: data);
  return response;
}