import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveToken(String token)async
{
    var sh = await SharedPreferences.getInstance();
    sh.setString('token', token);
}