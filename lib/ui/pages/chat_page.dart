import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kursach/data/constants/colors.dart';
import 'package:kursach/data/models/message.dart';
import 'package:kursach/data/models/user.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {Key? key,
      required this.chatName,
      required this.chatHistory,
      required this.chatUsers})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();

  final String chatName;
  final List<User> chatUsers;
  final List<Message> chatHistory;
}

class _ChatPageState extends State<ChatPage> {
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
          IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.more_vert, color: Color(0xff776A94)))
        ],
        title: Text(widget.chatName,
            style: const TextStyle(
                color: Color(0xff776A94), fontFamily: "Sansita")),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("name"), Text("time")],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffCDC6DC),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text("text"),
                        ),
                      ],
                    )
                  ],
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
                        onPressed: () {},
                        icon: const Icon(Icons.attach_file)),
                    SizedBox(
                      height: 50,
                      width: 200,
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
                        child: const TextField(
                          style: TextStyle(
                            decoration: TextDecoration.none,
                          ),
                          decoration:
                          InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.send))
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
