import 'dart:convert';
import 'package:kursach/data/models/trello_card.dart' as trello_card;
import 'package:kursach/data/requests/card/update_card.dart' as request;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
Future<void> updateCard(String title, String description, String state, int boardId,int cardId, String deadline)async
{
  Map<String, dynamic> data=
  {
    'token':user_data.token,
    'title':title,
    'description':description,
    'state':state,
    'cardid':cardId,
    'deadline':deadline
  };
  String jsonData = jsonEncode(data);
  var response = await request.updateCard(jsonData);
  if(response.statusCode!=200)
  {
    return;
  }
  var cardR = app_data.boards.firstWhere((board) => board.userId==boardId).cards.firstWhere((card) => card.cardId==cardId);
  app_data.boards.firstWhere((board) => board.userId==boardId).cards.remove(cardR);
  var card = trello_card.TrelloCard(cardId,boardId,title, description,state,deadline);
  app_data.boards.firstWhere((board) => board.boardId==boardId).cards.add(card);
}