import 'package:shared_preferences/shared_preferences.dart';
import 'package:kursach/data/temp_storage/user_data.dart' as ud;

Future<void> saveToken(String token)async
{
    var sh = await SharedPreferences.getInstance();
    ud.token = token;
    sh.setString('token', token);
}

Future<void> saveNickName(String nickName)async
{
    var sh = await SharedPreferences.getInstance();
    ud.nickName = nickName;
    sh.setString('nickName', nickName);
}

Future<void> saveId(int userId)async
{
    var sh = await SharedPreferences.getInstance();
    ud.userId = userId;
    sh.setInt('userId', userId);
}