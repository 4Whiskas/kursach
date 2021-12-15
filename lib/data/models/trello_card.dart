import 'package:kursach/data/temp_storage/user_data.dart' as user_data;

class TrelloCard {
  late int cardId;
  late String label;
  late String description;
  late String state;
  late String deadline;

  TrelloCard(this.cardId, this.label, this.description, this.state, this.deadline);

  TrelloCard.fromJson(Map<String, dynamic> data) {
    cardId = data['cardid'];
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
