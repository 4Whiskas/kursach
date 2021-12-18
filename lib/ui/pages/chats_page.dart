import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kursach/data/constants/colors.dart';
import 'package:kursach/ui/widgets/static/bottom_bar.dart';
import 'package:kursach/logic/functions/message/get_history.dart' as message_history;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;

import 'chat_page.dart';

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
                child: app_data.chats.isNotEmpty?ListView.builder(

                  scrollDirection: Axis.vertical,
                  itemCount: app_data.chats.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: GestureDetector(
                      onTap: ()async{
                        await message_history.getHistory(app_data.chats[index].chatId);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ChatPage(chatUsers: app_data.chats[index].users, chatName: 'test',)));
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ):SizedBox(height: MediaQuery.of(context).size.height,),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: FloatingActionButton(onPressed: (){},backgroundColor: const Color(0xffE2DAF0),child: const Icon(Icons.add),),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
