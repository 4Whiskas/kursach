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
  String jsonSendData = jsonEncode(sendData);
  var response = await request.getUsersBoards(jsonSendData);
  if(response.statusCode!=200)
  {
    return;
  }
  List<dynamic> data = jsonDecode(response.body);
  for (Map<String, dynamic> dataMessage in data) {
    Board board = Board.fromJson(dataMessage);
    app_data.boards.add(board);
  }
}