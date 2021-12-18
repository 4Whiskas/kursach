import 'package:kursach/data/temp_storage/user_data.dart' as user_data;

class Message {
  late int messageId;
  late int toId;
  late int fromId;
  late String text;
  late DateTime utcTime;

  Message(this.toId, this.text);

  Message.fromJson(Map<String, dynamic> data) {
    messageId = data['id'];
    toId = data['toid'];
    fromId = data['fromid'];
    text = data['text'];
    utcTime = data['utctime'];
  }

  Map<String, dynamic> toCreateJson() => {
    'id':messageId,
    'token': user_data.token,
    'toid': toId,
    'text': text,
    'reply': null,
    'utctime':utcTime
  };

}