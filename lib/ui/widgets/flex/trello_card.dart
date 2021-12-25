import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kursach/data/constants/colors.dart';
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/logic/functions/card/delete_card.dart' as delete_card;

class TrelloCard extends StatefulWidget {
  const TrelloCard({
    Key? key,
    required this.cardId,
    required this.boardId,
    this.company = false,
  }) : super(key: key);

  final int cardId;
  final int boardId;
  final bool company;

  @override
  State<TrelloCard> createState() => _TrelloCardState();
}

class _TrelloCardState extends State<TrelloCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: lightPageMainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: Text(widget.company
                    ? app_data.company.boards
                    .firstWhere(
                        (element) => element.boardId == widget.boardId)
                    .cards
                    .firstWhere(
                        (element) => element.cardId == widget.cardId)
                    .label
                    : app_data.boards
                    .firstWhere(
                        (element) => element.boardId == widget.boardId)
                    .cards
                    .firstWhere(
                        (element) => element.cardId == widget.cardId)
                    .label),
                content: SingleChildScrollView(
                  child: Text(widget.company
                      ? app_data.company.boards
                      .firstWhere(
                          (element) => element.boardId == widget.boardId)
                      .cards
                      .firstWhere(
                          (element) => element.cardId == widget.cardId)
                      .description
                      : app_data.boards
                      .firstWhere(
                          (element) => element.boardId == widget.boardId)
                      .cards
                      .firstWhere(
                          (element) => element.cardId == widget.cardId)
                      .description),
                ),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
            color: const Color(0xffDDD6EA),
            shadowDarkColor: const Color(0xffBDB7C8),
            shadowLightColor: const Color(0xffECE1FF),
            depth: 5,
          ),
          padding: const EdgeInsets.all(30),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            height: 100,
            width: 220,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.company
                        ? app_data.company.boards
                            .firstWhere(
                                (element) => element.boardId == widget.boardId)
                            .cards
                            .firstWhere(
                                (element) => element.cardId == widget.cardId)
                            .label
                        : app_data.boards
                            .firstWhere(
                                (element) => element.boardId == widget.boardId)
                            .cards
                            .firstWhere(
                                (element) => element.cardId == widget.cardId)
                            .label),
                    Text(
                      widget.company
                          ? app_data.company.boards
                              .firstWhere((element) =>
                                  element.boardId == widget.boardId)
                              .cards
                              .firstWhere(
                                  (element) => element.cardId == widget.cardId)
                              .deadline
                          : app_data.boards
                              .firstWhere((element) =>
                                  element.boardId == widget.boardId)
                              .cards
                              .firstWhere(
                                  (element) => element.cardId == widget.cardId)
                              .deadline,
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
                Text(widget.company
                    ? app_data.company.boards
                        .firstWhere(
                            (element) => element.boardId == widget.boardId)
                        .cards
                        .firstWhere(
                            (element) => element.cardId == widget.cardId)
                        .description
                    : app_data.boards
                        .firstWhere(
                            (element) => element.boardId == widget.boardId)
                        .cards
                        .firstWhere(
                            (element) => element.cardId == widget.cardId)
                        .description),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.attach_file)),
                    IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(Icons.create_outlined)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.check)),
                    IconButton(
                        onPressed: () async{
                          await delete_card.deleteCard(widget.cardId, widget.boardId, !widget.company, context);
                        },
                        icon: const Icon(Icons.remove))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
