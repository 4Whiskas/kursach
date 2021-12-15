import 'package:http/http.dart' as http;
import 'package:kursach/data/headers/login_header.dart';

///Data looks like:
///{
///'token':String,
///'boardid':int,
///}
///Response looks like:
///
///token - user`s auth token;
Future<http.Response> getBoard(String data)async{
  var url = Uri.parse("http://217.25.89.68:25448/Board/getboard");
  var response = await http.post(url, headers: loginHeaders, body: data);
  return response;
}