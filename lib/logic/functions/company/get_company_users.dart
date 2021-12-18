import 'dart:convert';
import 'package:kursach/data/models/user.dart';
import 'package:kursach/data/requests/company/get_company_users.dart' as request;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
Future<void> getCompanyUsers()async
{
  Map<String, dynamic> tempData ={
    'token':user_data.token
  };
  String tempJsonData = jsonEncode(tempData);
  var response = await request.getCompanyUsers(tempJsonData);
  //print(response.body);
  if(response.statusCode!=200)
  {
    return;
  }
  List<dynamic> data = jsonDecode(response.body);
  //print(data);
  app_data.users.clear();
  for (Map<String,dynamic> user in data) {
    app_data.users.add(User.fromJson(user));
  }
}