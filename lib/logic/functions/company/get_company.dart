import 'dart:convert';
import 'package:kursach/data/models/company.dart';
import 'package:kursach/data/requests/company/get_company.dart' as request;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
Future<void> getCompany()async
{
  var response = await request.getCompany();
  if(response.statusCode!=200)
  {
    return;
  }
  Map<String, dynamic> data = jsonDecode(response.body);
  app_data.company = Company.fromJson(data);
}