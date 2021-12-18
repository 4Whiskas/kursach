import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
///int cardId;
///
/// int boardId;
///
/// String label;
///
/// String description;
///
/// String state;
///
/// String deadline;
class TrelloCard {
  late int cardId;
  late int boardId;
  late String label;
  late String description;
  late String state;
  late String deadline;

  TrelloCard(this.cardId, this.boardId ,this.label, this.description, this.state, this.deadline);

  TrelloCard.fromJson(Map<String, dynamic> data) {
    cardId = data['id'];
    boardId = data['boardid'];
    label = data['title'];
    description = data['description'];
    state = data['state'];
    deadline = data['deadline'];
  }


}
