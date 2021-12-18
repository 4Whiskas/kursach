import 'dart:convert';
import 'package:kursach/data/models/company.dart';
import 'package:kursach/data/models/user.dart';
import 'package:kursach/data/requests/message/add_user_to_chat.dart' as request;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;

Future<void> addUserToChat(int chatId, int userId) async {
  Map<String, dynamic> data = {
    'token': user_data.token,
    'userid': userId,
    'chatId': chatId
  };
  String jsonData = jsonEncode(data);
  var response = await request.addUserToChat(jsonData);
  if (response.statusCode != 200) {
    return;
  }
  app_data.chats.firstWhere((element) => element.chatId == chatId).users.add(
      User(
          userId,
          app_data.users
              .firstWhere((element) => element.id == userId)
              .nickName));
}
