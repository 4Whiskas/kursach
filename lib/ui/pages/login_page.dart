import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kursach/data/constants/colors.dart';
import 'package:kursach/logic/controllers.dart';
import 'package:kursach/ui/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();


}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MaterialApp(
          builder: (context, child) => Scaffold(
            body: SafeArea(
              child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [lightPageUpGradient, lightPageDownGradient],
                  )),
                  child: Stack(
                    children: [
                      Center(
                        child: Neumorphic(
                          style: const NeumorphicStyle(
                            depth: 5,
                            color: lightPageMainColor,
                            shadowDarkColor: Color(0xff9893A1),
                            shadowLightColor: Color(0xffF4EFFF),
                          ),
                          child: Container(
                            height: 269,
                            width: 333,
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InputField(
                                  contoller: loginController,
                                  hint: 'login',
                                  obscured: false,
                                ),
                                InputField(
                                  contoller: passwordController,
                                  hint: 'password',
                                  obscured: true,
                                ),
                                const LoginButton()
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    titlePadding: const EdgeInsets.all(40),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    backgroundColor: const Color(0xffDDD6EA),
                                    actionsAlignment: MainAxisAlignment.center,
                                    title: const Text(
                                      "Если вы забыли логин или пароль от своей учетной записи, вам необходимо обратиться к администратору для восстановления этих данных",
                                      style: TextStyle(
                                          color: Color(0xff776A94),
                                          fontFamily: "Sansita"),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                });
                          },
                          child: const Text(
                            "Забыли пароль?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffBEB0D7),
                                fontFamily: 'Sansita',
                                fontSize: 24,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ));
  }
}