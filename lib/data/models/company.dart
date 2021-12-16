import 'package:kursach/data/models/board.dart';

class Company {
  late int id;
  late String name;
  List<Board> boards=[];

  Company(this.id, this.name ,this.boards);

  Company.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    List<dynamic> tempBoards = data['boards'];
    for (Map<String, dynamic> tempBoard in tempBoards) {
      Board board = Board.fromJson(tempBoard);
      boards.add(board);
    }
  }

}