import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kursach/data/models/trello_card.dart' as model;

class TrelloCard extends StatefulWidget {
  const TrelloCard({
    Key? key, required this.cardModel,
  }) : super(key: key);

  final model.TrelloCard cardModel;

  @override
  State<TrelloCard> createState() => _TrelloCardState();
}

class _TrelloCardState extends State<TrelloCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
        padding: const EdgeInsets.all(30),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)),
          height: 260,
          width: 260,
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.cardModel.label),
                  Text(
                    widget.cardModel.deadline,
                    textAlign: TextAlign.end,
                  )
                ],
              ),
              Text(widget.cardModel.description),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.attach_file)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.create_outlined)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.check)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}