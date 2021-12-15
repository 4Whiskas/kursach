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

Future<bool> loadNickName()async
{
  var sh = await SharedPreferences.getInstance();
  if(!sh.containsKey('nickName')) {
    return false;
  }
  ud.nickName = sh.getString('nickName')!;
  return true;
}

Future<bool> loadId()async
{
  var sh = await SharedPreferences.getInstance();
  if(!sh.containsKey('userId')) {
    return false;
  }
  ud.userId = sh.getInt('userId')!;
  return true;
}