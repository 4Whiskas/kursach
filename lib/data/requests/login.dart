import 'package:http/http.dart' as http;
import 'package:kursach/data/headers/login_header.dart';

Future<http.Response> login(String data)async{
  var url = Uri.parse("http://37.112.229.253:25565/User/login");
  print(data);
  var response = await http.post(url, headers: loginHeaders, body: data);
  print(response);
  return response;
}