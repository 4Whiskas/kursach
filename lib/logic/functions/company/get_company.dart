import 'dart:convert';
import 'package:kursach/data/models/company.dart';
import 'package:kursach/data/requests/company/get_company.dart' as request;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
Future<void> getCompany()async
{
  Map<String, dynamic> tempData ={
    'token':user_data.token
  };
  String tempJsonData = jsonEncode(tempData);
  var response = await request.getCompany(tempJsonData);
  if(response.statusCode!=200)
  {
    return;
  }
  Map<String, dynamic> data = jsonDecode(response.body);
  app_data.company = Company.fromJson(data);
}