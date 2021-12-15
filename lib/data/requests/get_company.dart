import 'package:http/http.dart' as http;
import 'package:kursach/data/headers/login_header.dart';
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;

Future<http.Response> getCompany()async{
  var url = Uri.parse("http://217.25.89.68:25448/User/fullcompany");
  var response = await http.post(url, headers: loginHeaders, body: user_data.token);
  return response;
}
