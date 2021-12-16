import 'dart:convert';
import 'package:kursach/data/requests/card/delete_card.dart' as request;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
Future<void> deleteCard(int cardId, int boardId)async
{
  Map<String, dynamic> data=
  {
    'token':user_data.token,
    'cardid':cardId
  };
  String jsonData = jsonEncode(data);
  var response = await request.deleteCard(jsonData);
  if(response.statusCode!=200)
  {
    return;
  }

  var card = app_data.boards.firstWhere((board) => board.userId==boardId).cards.firstWhere((card) => card.cardId==cardId);
  app_data.boards.firstWhere((board) => board.userId==boardId).cards.remove(card);
}