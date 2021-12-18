import 'package:kursach/data/temp_storage/user_data.dart' as user_data;

class Message {
  late int messageId;
  late int fromId;
  late int chatId;
  late String text;
  late String utcTime;

  Message(this.text);

  Message.fromJson(Map<String, dynamic> data) {
    messageId = data['id'];
    fromId = data['fromid'];
    chatId = data['chatid'];
    text = data['text'];
    utcTime = data['utctime'];
  }

  Map<String, dynamic> toCreateJson() => {
    'id':messageId,
    'token': user_data.token,
    'text': text,
    'chatid':chatId,
    'reply': null,
    'utctime':utcTime
  };

}