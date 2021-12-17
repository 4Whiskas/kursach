import 'dart:convert';
import 'package:kursach/data/models/board.dart';
import 'package:kursach/data/requests/user/get_users_boards.dart' as request;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
Future<void> getUsersBoards()async
{
  Map<String, dynamic> sendData = {
    'token':user_data.token,
  };
  String jsonSendData = jsonEncode(user_data.token);
  //print(user_data.token);
  var response = await request.getUsersBoards(jsonSendData);
  print(response.statusCode);
  //print(response.body);
  if(response.statusCode!=200)
  {
    return;
  }
  List<dynamic> data = jsonDecode(response.body);
  app_data.boards.clear();
  for (Map<String, dynamic> dataMessage in data) {
    print(dataMessage);
    Board board = Board.fromJson(dataMessage);
    app_data.boards.add(board);
  }
  print(app_data.boards);
}