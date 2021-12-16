import 'dart:convert';
import 'package:kursach/data/models/company.dart';
import 'package:kursach/data/requests/message/add_user_to_chat.dart' as request;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
Future<void> addUserToChat(int chatId)async
{
  Map<String, dynamic> data={
    'token':user_data.token,
    'userid':user_data.userId,
    'chatId':chatId
  };
  String jsonData = jsonEncode(data);
  var response = await request.addUserToChat(jsonData);
  if(response.statusCode!=200)
  {
    return;
  }
}