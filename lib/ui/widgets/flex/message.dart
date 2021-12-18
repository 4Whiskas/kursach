import 'package:flutter/material.dart';
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;

class Message extends StatefulWidget {
  const Message({
    Key? key,
    required this.localMessageId,
  }) : super(key: key);
  final int localMessageId;

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    String fromName = '';
    String utcDate = '';
    String mesText = '';
    bool ownMes = false;
    if (app_data.users.isNotEmpty) {
      ownMes =
          app_data.messages[widget.localMessageId].fromId == user_data.userId;
      fromName = ownMes
          ? user_data.nickName
          : app_data.users
              .firstWhere((element) =>
                  element.id == app_data.messages[widget.localMessageId].fromId)
              .nickName;
      utcDate = app_data.messages[widget.localMessageId].utcTime.replaceAll('T', '\n');
      mesText = app_data.messages[widget.localMessageId].text;
    }

    return Container(
      margin: EdgeInsets.fromLTRB(ownMes ? 170 : 20, 30, ownMes ? 20 : 170, 30),
      width: 200,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffBFB8CD)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(fromName), Expanded(child: Text(utcDate, textAlign: TextAlign.right,))],
          ),
          Text(mesText),
        ],
      ),
    );
  }
}
