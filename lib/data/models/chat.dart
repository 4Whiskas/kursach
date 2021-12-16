import 'package:kursach/data/models/user.dart';

class Chat {
  late int chatId;
  late String chatName;
  List<User> users=[];
  late bool priv;

  Chat(this.chatId, this.chatName, this.users, this.priv);

  Chat.fromJson(Map<String, dynamic> data) {
    List<dynamic> users = data['users'];
    for (Map<String, dynamic> user in users) {
      this.users.add(User.fromJson(user));
    }
    chatId = data['chatid'];
    chatName = data['name']??this.users.first.nickName;
    priv = data['priv'];

  }


}