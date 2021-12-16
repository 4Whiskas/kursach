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
    cardId = data['cardid'];
    boardId = data['boardid'];
    label = data['label'];
    description = data['description'];
    state = data['state'];
    deadline = data['deadline'];
  }

  Map<String, dynamic> toCreateJson() => {
    'token': user_data.token,
    'cardid': cardId,
    'label': label,
    'description': description,
    'state': state,
    'deadline': deadline,
  };

  Map<String, dynamic> toUpdateJson() => {
    'token': user_data.token,
    'cardid': cardId,
    'label': label,
    'description': description,
    'state': state,
    'deadline': deadline,
  };

  Map<String, dynamic> toDeleteJson() => {
    'token': user_data.token,
    'cardid': cardId,
  };

}
