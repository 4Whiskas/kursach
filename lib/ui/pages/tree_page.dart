import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kursach/data/constants/colors.dart';
import 'package:kursach/logic/controllers.dart';
import 'package:kursach/ui/widgets/flex/adding_card_form.dart';
import 'package:kursach/ui/widgets/flex/trello_card.dart';
import 'package:kursach/ui/widgets/static/bottom_bar.dart';
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/logic/functions/board/create_board.dart'
    as create_board;
import 'package:kursach/ui/widgets/widgets.dart';

class TreePage extends StatefulWidget {
  const TreePage({Key? key}) : super(key: key);

  @override
  State<TreePage> createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [lightPageUpGradient, lightPageDownGradient],
              ),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: FloatingActionButton(
                      heroTag: "add_board",
                      onPressed: () async {
                        boardNameController.clear();
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                titlePadding: EdgeInsets.zero,
                                title: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        lightPageUpGradient,
                                        lightPageDownGradient
                                      ],
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          height: 50,
                                          width: 200,
                                          child: InputField(
                                              contoller: boardNameController,
                                              hint: "Название доски",
                                              obscured: false)),
                                      IconButton(
                                          onPressed: () async {
                                            await create_board.createBoard(
                                                boardNameController.text,
                                                false);
                                          },
                                          icon: const Icon(Icons.check))
                                    ],
                                  ),
                                ),
                              );
                            });
                        setState(() {});
                      },
                      backgroundColor: const Color(0xffE2DAF0),
                      child: const Icon(Icons.add),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  app_data.company.boards.isEmpty
                      ? const SizedBox(
                          height: 1,
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height - 187,
                          child: ListView.builder(
                              itemCount: app_data.company.boards.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, boardIndex) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    children: [
                                      Text(app_data
                                          .company.boards[boardIndex].title),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          app_data.company.boards[boardIndex]
                                                  .cards.isEmpty
                                              ? const SizedBox(
                                                  height: 1,
                                                )
                                              : SizedBox(
                                                  height: 260,
                                                  width: 300,
                                                  child: ListView.builder(
                                                      itemCount: app_data
                                                          .company
                                                          .boards[boardIndex]
                                                          .cards
                                                          .length,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return app_data
                                                                .company
                                                                .boards[
                                                                    boardIndex]
                                                                .cards
                                                                .isEmpty
                                                            ? const SizedBox(
                                                                height: 1,
                                                              )
                                                            : TrelloCard(
                                                                boardId: app_data
                                                                    .company
                                                                    .boards[
                                                                        boardIndex]
                                                                    .boardId,
                                                                cardId: app_data
                                                                    .company
                                                                    .boards[
                                                                        boardIndex]
                                                                    .cards[
                                                                        index]
                                                                    .cardId,
                                                                company: true,
                                                              );
                                                      }),
                                                ),
                                          FloatingActionButton(
                                            heroTag: app_data.company
                                                .boards[boardIndex].boardId,
                                            onPressed: () async {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
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
                                                          AddingButtonForm(boardIndex: boardIndex,),
                                                    );
                                                  });
                                            },
                                            backgroundColor:
                                                const Color(0xffE2DAF0),
                                            child: const Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 1,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: const Color(0xffA7A3AF),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
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


