import 'package:shared_preferences/shared_preferences.dart';
import 'package:kursach/data/temp_storage/user_data.dart' as ud;

Future<bool> loadToken()async
{
  var sh = await SharedPreferences.getInstance();
  if(!sh.containsKey('token')) {
    return false;
  }
  ud.token = await sh.getString('token')!;
  return true;
}

Future<bool> loadNickName()async
{
  var sh = await SharedPreferences.getInstance();
  if(!sh.containsKey('nickName')) {
    return false;
  }
  ud.nickName = await sh.getString('nickName')!;
  return true;
}

Future<bool> loadId()async
{
  var sh = await SharedPreferences.getInstance();
  if(!sh.containsKey('userId')) {
    return false;
  }
  ud.userId = await sh.getInt('userId')!;
  return true;
}