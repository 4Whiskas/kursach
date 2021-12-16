import 'dart:convert';
import 'package:kursach/data/models/board.dart' as board_model;
import 'package:kursach/data/requests/board/create_board.dart' as request;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
import 'package:kursach/data/temp_storage/company_data.dart' as company_data;
Future<void> createBoard(String title, bool priv)async
{
  Map<String, dynamic> data=
  {
    'token':user_data.token,
    'title':title,
    'priv':priv
  };
  String jsonData = jsonEncode(data);
  var response = await request.createBoard(jsonData);
  if(response.statusCode!=200)
    {
      return;
    }
  int boardId = priv?int.parse(response.body):-int.parse(response.body);
  int ownerId = priv?user_data.userId:company_data.companyId;
  var board = board_model.Board(boardId,ownerId,title, priv, []);
  app_data.boards.add(board);
}