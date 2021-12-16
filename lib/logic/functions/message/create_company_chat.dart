import 'dart:convert';
import 'package:kursach/data/models/chat.dart';
import 'package:kursach/data/models/company.dart';
import 'package:kursach/data/requests/message/create_company_chat.dart' as request;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;

Future<void> createCompanyChat(String name) async
{
  Map<String, dynamic> data = {
    'token': user_data.token,
    'name': name,
  };
  String jsonData = jsonEncode(data);
  var response = await request.createCompanyChat(jsonData);
  if (response.statusCode != 200) {
    return;
  }
  Chat chat = Chat(jsonDecode(response.body), name,
      [app_data.users.firstWhere((element) => element.id == user_data.userId)],
      false);
  app_data.chats.add(chat);
}