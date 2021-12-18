import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kursach/data/constants/colors.dart';
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/ui/widgets/flex/adding_card_form.dart';
import 'package:kursach/ui/widgets/flex/trello_card.dart';
import 'package:kursach/ui/widgets/static/bottom_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height:MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [lightPageUpGradient, lightPageDownGradient],
            )),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30,),
                  Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          border: const Border.fromBorderSide(
                              BorderSide(width: 3, color: Color(0xffF4EEFF)))),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.account_circle_rounded,
                          ))),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      app_data.boards.first.cards.isEmpty
                          ? const SizedBox(
                              height: 1,
                            )
                          : SizedBox(
                            height:
                                MediaQuery.of(context).size.height < 1000
                                    ? 200
                                    : 260,
                            width: 350,
                            child: ListView.builder(
                              itemCount: app_data.boards.first.cards.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return TrelloCard(
                                  boardId: app_data.boards.first.boardId,
                                  cardId: app_data
                                      .boards.first.cards[index].cardId,
                                );
                              },
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                      FloatingActionButton(
                        onPressed: () async {
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              shape:
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                      15)),
                              contentPadding:
                              EdgeInsets.zero,
                              content:
                              AddingButtonForm(boardIndex: app_data.boards.first.boardId,priv: true,),
                            );
                          });
                        },
                        backgroundColor: const Color(0xffE2DAF0),
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Neumorphic(
                    style: NeumorphicStyle(
                        color: const Color(0xffE0D8ED),
                        shadowLightColor: const Color(0xffEFE8FC),
                        shadowDarkColor: const Color(0xffCDC5DC),
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(15)),
                        depth: 5,
                        shape: NeumorphicShape.convex),
                    child: SizedBox(
                      width: 290,
                      height: 60,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Settings",
                            style: TextStyle(
                                color: Color(0xff4B4B4B),
                                fontFamily: 'Sansita',
                                fontSize: 24),
                          )),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Neumorphic(
                    style: NeumorphicStyle(
                        color: const Color(0xffF1C8C8),
                        shadowLightColor: const Color(0xffFFE0E0),
                        shadowDarkColor: const Color(0xffE8BFBF),
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(15)),
                        depth: 5,
                        shape: NeumorphicShape.convex),
                    child: SizedBox(
                      width: 290,
                      height: 60,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                                color: Color(0xff4B4B4B),
                                fontFamily: 'Sansita',
                                fontSize: 24),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
