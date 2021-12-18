import 'dart:convert';
import 'package:kursach/data/models/chat.dart';
import 'package:kursach/data/requests/message/create_private_chat.dart' as request;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;

Future<void> createPrivateChat(int friendId) async {
  Map<String, dynamic> data = {
    'token': user_data.token,
    'friend': friendId,
  };
  String jsonData = jsonEncode(data);
  var response = await request.createPrivateChat(jsonData);
  print(response.body);
  if (response.statusCode != 200) {
    return;
  }
  Chat chat = Chat(
      jsonDecode(response.body),
      app_data.users.firstWhere((element) => element.id == friendId).nickName,
      [
        app_data.users.firstWhere((element) => element.id == friendId)
      ],
      true);
  app_data.chats.add(chat);
}
