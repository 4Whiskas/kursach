import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kursach/data/constants/colors.dart';
import 'package:kursach/logic/controllers.dart';
import 'package:kursach/ui/widgets/static/bottom_bar.dart';
import 'package:kursach/logic/functions/message/get_history.dart'
    as message_history;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/ui/widgets/static/input_field.dart';
import 'package:list_picker_dialog_plus/list_picker_dialog_plus.dart';
import 'chat_page.dart';
import 'package:kursach/logic/functions/company/get_company_users.dart'
    as company_users;
import 'package:kursach/logic/functions/message/create_private_chat.dart'
    as private_chat;
import 'package:kursach/logic/functions/message/create_company_chat.dart'
    as company_chat;
import 'package:kursach/logic/functions/user/get_users_chats.dart'
    as user_chats;

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [lightPageUpGradient, lightPageDownGradient],
          )),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              SafeArea(
                child: app_data.chats.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: app_data.chats.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          child: GestureDetector(
                            onTap: () async {
                              await message_history.getHistory(app_data.chats[index].chatId);
                              await company_users.getCompanyUsers();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatPage(
                                            chatId:
                                                app_data.chats[index].chatId,
                                          )));
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.convex,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(20)),
                                color: const Color(0xffDDD6EA),
                                shadowDarkColor: const Color(0xffBDB7C8),
                                shadowLightColor: const Color(0xffECE1FF),
                                depth: 5,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                height: 135,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.person),
                                    Text(app_data.chats[index].chatName),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height,
                      ),
              ),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: PopupMenuButton(
                    color: const Color(0xffD0C9DC),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        child: Text("Общий"),
                        value: "Общий",
                      ),
                      const PopupMenuItem(
                        child: Text("Личный"),
                        value: "Личный",
                      )
                    ],
                    onSelected: (String value) {
                      chatNameController.clear();
                      switch (value) {
                        case "Общий":
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: const Color(0xffD0C9DC),
                                  actionsAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  actions: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            height: 50,
                                            width: 250,
                                            child: InputField(
                                              hint: 'Название чата',
                                              obscured: false,
                                              contoller: chatNameController,
                                            )),
                                        IconButton(
                                            onPressed: () async {
                                              await company_chat
                                                  .createCompanyChat(
                                                      chatNameController.text);
                                              await user_chats.getUsersChats();
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ChatsPage()),
                                                  (route) => false);
                                            },
                                            icon: const Icon(Icons.check))
                                      ],
                                    ),
                                  ],
                                );
                              });
                          break;
                        case "Личный":
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: const Color(0xffD0C9DC),
                                  actionsAlignment: MainAxisAlignment.center,
                                  actions: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    const Color(0xffBCB6C7))),
                                        onPressed: () async {
                                          await company_users.getCompanyUsers();
                                          List<String> textUsers = [];
                                          for (var user in app_data.users) {
                                            textUsers.add(user.nickName);
                                          }
                                          var item = await showTextListPicker(
                                              context: context,
                                              findFn: (str) async => textUsers);
                                          chatNameController.text = item!;
                                          if (chatNameController.text.isEmpty) {
                                            return;
                                          }
                                          await private_chat.createPrivateChat(
                                              app_data.users
                                                  .firstWhere((element) =>
                                                      element.nickName ==
                                                      chatNameController.text)
                                                  .id);
                                          await user_chats.getUsersChats();
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ChatsPage()),
                                              (route) => false);
                                        },
                                        child: const Text(
                                          'Выберите пользователя',
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ],
                                );
                              });
                          break;
                      }
                    },
                    icon: Neumorphic(
                        style: const NeumorphicStyle(
                            shape: NeumorphicShape.convex,
                            depth: 5,
                            color: Color(0xffDDD0EA),
                            shadowDarkColor: Color(0xffBDB7C8),
                            shadowLightColor: Color(0xffECE1FF),
                            boxShape: NeumorphicBoxShape.circle()),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        )),
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
