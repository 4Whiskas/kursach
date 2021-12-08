import 'package:shared_preferences/shared_preferences.dart';
import 'package:kursach/data/temp_storage/user_data.dart' as ud;

Future<void> saveToken(String token)async
{
    var sh = await SharedPreferences.getInstance();
    ud.token = token;
    sh.setString('token', token);
}