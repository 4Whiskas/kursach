import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kursach/data/constants/colors.dart';
import 'package:kursach/ui/widgets/static/bottom_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [lightPageUpGradient, lightPageDownGradient],
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                Stack(
                  alignment: Alignment.bottomRight,
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
                      padding: const EdgeInsets.only(right: 20),
                      child: FloatingActionButton(onPressed: (){},backgroundColor: Color(0xffE2DAF0),child: Icon(Icons.add),),
                    )
                  ],
                ),
                Neumorphic(
                  style: NeumorphicStyle(
                      color: const Color(0xffE0D8ED),
                      shadowLightColor: const Color(0xffEFE8FC),
                      shadowDarkColor: const Color(0xffCDC5DC),
                      boxShape:
                          NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
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
                Neumorphic(
                  style: NeumorphicStyle(
                      color: const Color(0xffF1C8C8),
                      shadowLightColor: const Color(0xffFFE0E0),
                      shadowDarkColor: const Color(0xffE8BFBF),
                      boxShape:
                          NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
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
      bottomNavigationBar: BottomBar(),
    );
  }
}


