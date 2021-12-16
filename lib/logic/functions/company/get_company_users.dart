import 'dart:convert';
import 'package:kursach/data/models/user.dart';
import 'package:kursach/data/requests/company/get_company_users.dart' as request;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
Future<void> getCompanyUsers()async
{
  var response = await request.getCompanyUsers();
  if(response.statusCode!=200)
  {
    return;
  }
  List<dynamic> data = jsonDecode(response.body);
  for (Map<String,dynamic> user in data) {
    app_data.users.add(User.fromJson(user));
  }
}