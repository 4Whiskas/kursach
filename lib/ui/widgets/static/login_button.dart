import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kursach/logic/functions/user/user_functions.dart' as user_functions;
import 'package:kursach/logic/functions/user/get_users_boards.dart' as user;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/ui/pages/profile_page.dart';

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
          String resp = await user_functions.login();
          switch(resp){
            case 'Authorized':
              await user.getUsersBoards();
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
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