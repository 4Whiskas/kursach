import 'dart:convert';
import 'package:kursach/data/models/message.dart';
import 'package:kursach/data/requests/message/get_history.dart' as request;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
Future<void> getHistory(int chatId, {int skip=0, int take=0})async
{
  Map<String, dynamic> sendData = {
    'token':user_data.token,
    'chatid':chatId,
    'skip':skip==0?null:skip,
    'take':take==0?null:take
  };
  String jsonSendData = jsonEncode(sendData);
  var response = await request.getHistory(jsonSendData);
  if(response.statusCode!=200)
  {
    return;
  }
  List<dynamic> data = jsonDecode(response.body);
  app_data.messages.clear();
  for (Map<String, dynamic> dataMessage in data) {
    Message message = Message.fromJson(dataMessage);
    app_data.messages.add(message);
  }
}