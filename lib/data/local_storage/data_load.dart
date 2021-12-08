import 'package:shared_preferences/shared_preferences.dart';
import 'package:kursach/data/temp_storage/user_data.dart' as ud;

Future<bool> loadToken()async
{
  var sh = await SharedPreferences.getInstance();
  if(!sh.containsKey('token')) {
    return false;
  }
  ud.token = sh.getString('token')!;
  return true;
}