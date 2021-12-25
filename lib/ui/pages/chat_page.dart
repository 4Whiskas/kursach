import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kursach/data/constants/colors.dart';
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/logic/controllers.dart';
import 'package:kursach/ui/widgets/widgets.dart' as widgets;
import 'package:kursach/logic/functions/message/send_message.dart'
    as send_message;
import 'package:kursach/logic/functions/message/get_history.dart'
    as get_history;
import 'package:list_picker_dialog_plus/list_picker_dialog_plus.dart';
import 'package:kursach/logic/functions/company/get_company_users.dart'
    as company_users;
import 'package:kursach/logic/functions/message/add_user_to_chat.dart'
    as add_user_to_chat;

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
    required this.chatId,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();

  final int chatId;
}

class _ChatPageState extends State<ChatPage> {
  Timer? timer;

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) =>
        chatScrollingController
            .jumpTo(chatScrollingController.position.maxScrollExtent));
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        chatScrollingController
            .jumpTo(chatScrollingController.position.maxScrollExtent);
      });
    });
    timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await get_history.getHistory(widget.chatId);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE2DAF0),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_left_rounded, color: Color(0xff776A94)),
        ),
        shadowColor: Colors.transparent,
        centerTitle: true,
        actions: [
          PopupMenuButton(
            color: const Color(0xffD0C9DC),
            itemBuilder: (context) => [
              app_data.chats
                      .firstWhere((element) => element.chatId == widget.chatId)
                      .priv
                  ? const PopupMenuItem(
                      child: Text('Удалить'),
                      value: 'Удалить',
                    )
                  : const PopupMenuItem(
                      child: Text('Пригласить пользователя'),
                      value: 'Пригласить пользователя',
                    )
            ],
            onSelected: (String value) async {
              if (value != 'Пригласить пользователя') {
                return;
              }
              await company_users.getCompanyUsers();
              List<String> textUsers = [];
              for (var user in app_data.users) {
                textUsers.add(user.nickName);
              }
              var item = await showTextListPicker(
                  context: context, findFn: (str) async => textUsers);
              chatNameController.text = item!;
              if (chatNameController.text.isEmpty) {
                return;
              }
              await add_user_to_chat.addUserToChat(
                  widget.chatId,
                  app_data.users
                      .firstWhere((element) => element.nickName == item)
                      .id);
              setState(() {});
            },
            icon: const Icon(Icons.more_vert, color: Color(0xff776A94)),
          ),
        ],
        title: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: lightPageMainColor,
                builder: (context) {
                  return SingleChildScrollView(
                    child: SizedBox(
                      height: 350,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(40),
                        itemBuilder: (context, index) {
                          return Center(
                            child: Text(
                              app_data.chats
                                  .firstWhere((element) =>
                                      element.chatId == widget.chatId)
                                  .users[index]
                                  .nickName,
                              style: const TextStyle(
                                  fontFamily: "Sansita", fontSize: 24),
                            ),
                          );
                        },
                        itemCount: app_data.chats
                            .firstWhere(
                                (element) => element.chatId == widget.chatId)
                            .users
                            .length,
                      ),
                    ),
                  );
                });
          },
          child: Text(
              app_data.chats
                  .firstWhere((element) => element.chatId == widget.chatId)
                  .chatName,
              style: const TextStyle(
                  color: Color(0xff776A94), fontFamily: "Sansita")),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0, 1),
              end: Alignment(1, 0),
              colors: [lightPageUpGradient, lightPageDownGradient],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 160,
                    child: ListView.builder(
                        controller: chatScrollingController,
                        scrollDirection: Axis.vertical,
                        itemCount: app_data.messages.length,
                        itemBuilder: (context, index) {
                          return widgets.Message(
                            localMessageId: index,
                          );
                        }),
                  ),
                ),
              ),
              Container(
                color: const Color(0xffE2DAF0),
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.attach_file)),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20)),
                          color: const Color(0xffDDD6EA),
                          shadowDarkColor: const Color(0xffBDB7C8),
                          shadowLightColor: const Color(0xffB8B4C2),
                          depth: -5,
                        ),
                        child: TextField(
                          controller: messageController,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                          ),
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await send_message.sendMessage(
                              widget.chatId, messageController.text);
                          setState(() {
                            messageController.clear();
                            chatScrollingController.jumpTo(
                                chatScrollingController
                                    .position.maxScrollExtent);
                          });
                        },
                        icon: const Icon(Icons.send))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
