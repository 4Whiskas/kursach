import 'dart:convert';
import 'package:kursach/data/models/message.dart';
import 'package:kursach/data/requests/message/send_message.dart' as request;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
Future<void> sendMessage(int chatId, String text)async
{
  Map<String, dynamic> data={
    'token':user_data.token,
    'toId':chatId,
    'text':text,
    'reply':null
  };
  String jsonData = jsonEncode(data);
  var response = await request.sendMessage(jsonData);
  if(response.statusCode!=200)
  {
    return;
  }
  app_data.messages.add(Message.fromJson(data));
}