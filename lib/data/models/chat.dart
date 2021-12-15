import 'package:kursach/data/models/user.dart';
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;

class Chat {
  late int chatId;
  late String chatName;
  late List<User> users;
  late String priv;

  Chat(this.chatId, this.chatName, this.users, this.priv);

  Chat.fromJson(Map<String, dynamic> data) {
    List<dynamic> users = data['users'];
    for (var element in users) {
      Map<String, dynamic> mappedUser = element;
      var user = User(mappedUser['id'], mappedUser['nick']);
      this.users.add(user);
    }
    chatId = data['chatid'];
    chatName = data['name']??this.users.first.nickName;
    priv = data['priv'];
  }

  Map<String, dynamic> toCreatePrivateJson() => {
    'token': user_data.token,
    'friend': users.firstWhere((user) => user.id!=user_data.userId),
  };

  Map<String, dynamic> toCreateCompanyJson() => {
    'token': user_data.token,
    'chatName': chatName,
  };


}