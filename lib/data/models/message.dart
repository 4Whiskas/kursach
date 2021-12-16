import 'package:kursach/data/temp_storage/user_data.dart' as user_data;

class Message {
  late int toId;
  late int fromId;
  late String text;

  Message(this.toId, this.text);

  Message.fromJson(Map<String, dynamic> data) {
    toId = data['toid'];
    fromId = data['fromid'];
    text = data['text'];
  }

  Map<String, dynamic> toCreateJson() => {
    'token': user_data.token,
    'toid': toId,
    'text': text,
    'reply': null,
  };

}