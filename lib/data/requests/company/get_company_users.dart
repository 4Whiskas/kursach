import 'package:http/http.dart' as http;
import 'package:kursach/data/headers/login_header.dart';

///Data looks like:
///token - String
Future<http.Response> getCompanyUsers(String data)async{
  var url = Uri.parse("http://217.25.89.68:25448/User/companyusers");
  var response = await http.post(url, headers: loginHeaders, body: data);
  return response;
}
