import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TrelloCard extends StatefulWidget {
  const TrelloCard({
    Key? key, required this.label, required this.text, required this.deadlineTime,
  }) : super(key: key);

  final String label;
  final String text;
  final String deadlineTime;

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
                  Text(widget.label),
                  Text(
                    widget.deadlineTime,
                    textAlign: TextAlign.end,
                  )
                ],
              ),
              Text(widget.text),
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