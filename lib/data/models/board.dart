import 'package:kursach/data/models/trello_card.dart';
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;

class Board {
  late int boardId;
  late int userId;
  late String title;
  late bool priv;
  late List<TrelloCard> cards;

  Board(this.boardId, this.userId, this.title, this.priv, this.cards);

  Board.fromJson(Map<String, dynamic> data) {
    boardId = data['cardid'];
    userId = data['userid']??data['companyid'];
    title = data['title'];
    priv = data['userid']!=null?true:false;
    List<TrelloCard> tempCards = [];
    List<dynamic> td = data['cards'];
    for (var el in td) {
      Map<String, dynamic> element = el;
      tempCards.add(TrelloCard.fromJson(element));
    }
    cards = tempCards;
  }

  Map<String, dynamic> toCreateJson() => {
    'token': user_data.token,
    'title': title,
    'priv': priv
  };

}