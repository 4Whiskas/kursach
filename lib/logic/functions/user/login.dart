import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kursach/data/requests/user/login.dart' as login_request;
import 'package:kursach/data/local_storage/data_save.dart' as ds;
import 'package:kursach/data/temp_storage/user_data.dart' as ud;
import 'package:kursach/logic/controllers.dart';

Future<String> login() async {
  Map<String, dynamic> data = {
    'login': loginController.text,
    'password': passwordController.text
  };
  var jsonData = jsonEncode(data);
  http.Response response = await login_request.login(jsonData);
  if (response.statusCode == 200) {
    var jsonData = response.body;
    Map<String,dynamic> data = jsonDecode(jsonData);
    ud.token = data['token'];
    ud.nickName = data['nickname'];
    ud.token = data['token'];
    ds.saveToken(ud.token);
    ds.saveId(ud.userId);
    ds.saveNickName(ud.nickName);
    return "Authorized";
  } else if (response.statusCode == 400) {
    return "WrongData";
  } else {
    return "ServerProblems";
  }
}
