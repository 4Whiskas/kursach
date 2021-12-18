import 'package:http/http.dart' as http;
import 'package:kursach/data/headers/login_header.dart';

///Data looks like:
///token - String
Future<http.Response> getCompany(String data)async{
  var url = Uri.parse("http://217.25.89.68:25448/User/fullcompany");
  var response = await http.post(url, headers: loginHeaders, body: data);
  return response;
}
