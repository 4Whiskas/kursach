import 'dart:convert';
import 'package:kursach/data/models/trello_card.dart' as trello_card;
import 'package:kursach/data/requests/card/create_card.dart' as request;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;

Future<void> createCard(String title, String description, String state,
    int boardId, String deadline, bool priv) async {
  Map<String, dynamic> data = {
    'token': user_data.token,
    'title': title,
    'description': description,
    'state': state,
    'boardid': boardId,
    'deadline': deadline
  };
  String jsonData = jsonEncode(data);
  var response = await request.createCard(jsonData);
  if (response.statusCode != 200) {
    return;
  }
  int cardId = int.parse(response.body);
  var card = trello_card.TrelloCard(
      cardId, boardId, title, description, state, deadline);
  !priv
      ? app_data.company.boards
          .firstWhere((board) => board.boardId == boardId)
          .cards
          .add(card)
      : app_data.boards
          .firstWhere((board) => board.boardId == boardId)
          .cards
          .add(card);
}
