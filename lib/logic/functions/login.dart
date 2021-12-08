import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kursach/data/requests/login.dart' as login_request;
import 'package:kursach/logic/controllers.dart';

Future<String> login() async {
  print(loginController.text);
  Map<String, dynamic> data = {
    'login': loginController.text,
    'password': passwordController.text
  };
  var jsonData = jsonEncode(data);
  http.Response response = await login_request.login(jsonData);
  print(response.statusCode);
  if (response.statusCode == 200) {

    return "Authorized";
  } else if (response.statusCode == 400) {
    return "WrongData";
  } else {
    return "ServerProblems";
  }
}
