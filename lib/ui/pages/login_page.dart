import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kursach/data/constants/colors.dart';
import 'package:kursach/logic/controllers.dart';
import 'package:kursach/logic/functions/login.dart' as login_func;
import 'package:kursach/ui/pages/profile_page.dart';
import 'package:kursach/data/local_storage/data_load.dart' as dt;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kursach/data/temp_storage/user_data.dart' as td;

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
        title: 'Flutter Demo',
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
                                LoginButton()
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
                                      "If you forgot your password or login you need to call to your system administrator, because we can`t automatically reset them for safety of data",
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

class LoginButton extends StatefulWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    int depth = 5;
    return Neumorphic(
      style: NeumorphicStyle(
          color: const Color(0xffCADCD4),
          shadowLightColor: const Color(0xffFBFFFD),
          shadowDarkColor: const Color(0xff86948E),
          depth: depth.toDouble(),
          shape: NeumorphicShape.convex),
      child: TextButton(
        onPressed: () async {
          String resp = await login_func.login();
          switch(resp){
            case 'Authorized':

              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                      (route) => false);
              break;
            case 'WrongData':
              showDialog(context: context, builder: (context){
                return const AlertDialog(
                  title: Text('Неправильные логин или пароль', style: TextStyle(
                    color: Color(0xff4B4B4B),
                    fontSize: 24,
                    fontFamily: "Sansita",
                  ),),
                );
              });
              break;
            case 'ServerProblems':
              showDialog(context: context, builder: (context){
                return const AlertDialog(
                  title: Text('На сервере ведутся технические работы', style: TextStyle(
                    color: Color(0xff4B4B4B),
                    fontSize: 24,
                    fontFamily: "Sansita",
                  ),),
                );
              });
              break;
          }
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "Войти",
            style: TextStyle(
              color: Color(0xff4B4B4B),
              fontSize: 24,
              fontFamily: "Sansita",
            ),
          ),
        ),
      ),
    );
  }
}

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    required this.contoller,
    required this.hint,
    required this.obscured,
  }) : super(key: key);
  final TextEditingController contoller;
  final String hint;
  final bool obscured;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: const NeumorphicStyle(
        depth: -3,
        shadowLightColor: lightInputFieldLightColor,
        shadowDarkColor: lightInputFieldShadeColor,
      ),
      child: TextField(
        textAlign: TextAlign.center,
        controller: widget.contoller,
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: "Sansita",
        ),
        obscureText: widget.obscured,
        decoration: InputDecoration(
            fillColor: lightPageMainColor,
            filled: true,
            hintStyle: const TextStyle(color: Color(0xff9893A1)),
            hintText: widget.hint,
            border: InputBorder.none),
      ),
    );
  }
}
