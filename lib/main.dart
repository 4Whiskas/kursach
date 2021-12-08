import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kursach/ui/pages/login_page.dart';
import 'package:kursach/ui/pages/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    _seen = (prefs.containsKey('token') ?? false);

    if (_seen) {
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
                "home": (context) => const ProfilePage(),
              },
            );
          }
        });
  }
}