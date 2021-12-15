import 'package:kursach/data/temp_storage/user_data.dart' as user_data;

class Message {
  late int toId;
  late int fromId;
  late String text;
  late String reply;

  Message(this.toId, this.text ,{reply=null});

  Message.fromJson(Map<String, dynamic> data) {
    toId = data['toid'];
    fromId = data['fromid'];
    text = data['text'];
    reply = data['reply'];
  }

  Map<String, dynamic> toCreateJson() => {
    'token': user_data.token,
    'toid': toId,
    'text': text,
    'reply': reply,
  };

}