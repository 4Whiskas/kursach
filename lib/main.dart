import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kursach/ui/pages/login_page.dart';
import 'package:kursach/ui/pages/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kursach/data/local_storage/data_load.dart' as data_load;
import 'package:kursach/logic/functions/user/get_users_boards.dart' as user;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;

void main() {
  runApp(App());
}

void autoLogin() async
{
  var sh= await SharedPreferences.getInstance();
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? _seen;

    _seen = (prefs.containsKey('token'));
    if(_seen)
      {
        _seen = (prefs.containsKey('userId'));
        if(_seen)
          {
            _seen = (prefs.containsKey('nickName'));
          }
      }
    if (_seen) {
      await data_load.loadId();
      await data_load.loadNickName();
      await data_load.loadToken();
      await user.getUsersBoards();
      return "home";
    } else {
      return "login";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkFirstSeen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return MaterialApp(
              initialRoute: snapshot.data.toString(),
              routes: {
                "login": (context) => const LoginPage(),
                "home": (context) => ProfilePage(),
              },
            );
          }
        });
  }
}