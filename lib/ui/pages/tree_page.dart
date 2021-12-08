import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kursach/data/constants/colors.dart';
import 'package:kursach/ui/widgets/static/bottom_bar.dart';

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
        child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [lightPageUpGradient, lightPageDownGradient],
              ),
            ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 260,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
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
                                    Text("Label $index"),
                                    Text(
                                      "04.01.2022\n10:50",
                                      textAlign: TextAlign.end,
                                    )
                                  ],
                                ),
                                Text("Text $index"),
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 200),
              child: FloatingActionButton(onPressed: (){},backgroundColor: const Color(0xffE2DAF0),child: const Icon(Icons.add),),
            )
          ],
        ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
