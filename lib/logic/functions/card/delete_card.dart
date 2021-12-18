import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kursach/data/requests/card/delete_card.dart' as request;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/data/temp_storage/user_data.dart' as user_data;
import 'package:kursach/ui/pages/profile_page.dart';
import 'package:kursach/ui/pages/tree_page.dart';
import 'package:kursach/logic/functions/user/get_users_boards.dart' as user_boards;
import 'package:kursach/logic/functions/company/get_company.dart' as get_company;
Future<void> deleteCard(int cardId, int boardId, bool priv, BuildContext context)async
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
  if(priv)
    {
      var card = app_data.boards.first.cards.firstWhere((card) => card.cardId==cardId);
      app_data.boards.first.cards.remove(card);
      await user_boards.getUsersBoards();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
              (route) => false);
    }
  else{
    var card = app_data.company.boards.firstWhere((board) => board.boardId==boardId).cards.firstWhere((card) => card.cardId==cardId);
    app_data.company.boards.firstWhere((board) => board.boardId==boardId).cards.remove(card);
    get_company.getCompany().then((value) => Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => const TreePage()),
            (route) => false));
  }
}