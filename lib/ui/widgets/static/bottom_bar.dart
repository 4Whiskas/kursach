import 'package:flutter/material.dart';
import 'package:kursach/ui/pages/chats_page.dart';
import 'package:kursach/ui/pages/profile_page.dart';
import 'package:kursach/ui/pages/tree_page.dart';
import 'package:kursach/logic/functions/user/get_users_boards.dart' as user;
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xffE2DAF0),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: const Color(0xff9893A1),
      unselectedItemColor: const Color(0xff9893A1),
      onTap: (index){
        switch(index){
          case 0:
            user.getUsersBoards();
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => ProfilePage(boards: app_data.boards)),
                    (route) => false);
            break;
          case 1:
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => const ChatsPage()),
                    (route) => false);
            break;
          case 2:
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => const TreePage()),
                    (route) => false);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
      ],
    );
  }
}