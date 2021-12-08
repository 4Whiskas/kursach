import 'package:shared_preferences/shared_preferences.dart';
Future<bool> loadToken(String token)async
{
  var sh = await SharedPreferences.getInstance();
  if(!sh.containsKey('token')) {
    return false;
  }
  return true;
}