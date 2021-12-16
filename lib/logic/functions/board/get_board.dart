// import 'dart:convert';
// import 'package:kursach/data/models/board.dart' as board_model;
// import 'package:kursach/data/requests/board/get_board.dart' as request;
// import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
// import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
// import 'package:kursach/data/temp_storage/company_data.dart' as company_data;
// Future<void> getBoard(int boardId)async
// {
//   Map<String, dynamic> data=
//   {
//     'token':user_data.token,
//     'boardid':boardId
//   };
//   String jsonData = jsonEncode(data);
//   var response = await request.getBoard(jsonData);
//   if(response.statusCode!=200)
//   {
//     return;
//   }
//   String title = ;
//   bool priv = ;
//   int ownerId = ;
//   var board = board_model.Board(boardId,ownerId,title, priv, []);
//   priv?app_data.privateBoards.add(board):app_data.companyBoards.add(board);
// }