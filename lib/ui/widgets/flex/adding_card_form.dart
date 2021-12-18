import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:kursach/data/constants/colors.dart';
import 'package:kursach/logic/controllers.dart';
import 'package:kursach/ui/pages/profile_page.dart';
import 'package:kursach/ui/pages/tree_page.dart';
import 'package:kursach/ui/widgets/static/input_field.dart';
import 'package:kursach/data/temp_storage/app_data.dart' as app_data;
import 'package:kursach/logic/functions/card/create_card.dart' as create_card;
import 'package:kursach/logic/functions/user/get_users_boards.dart' as user_boards;
import 'package:kursach/logic/functions/company/get_company.dart' as get_company;

class AddingButtonForm extends StatefulWidget {
  const AddingButtonForm({
    Key? key,
    required this.boardIndex,
    this.priv = false,
  }) : super(key: key);
  final int boardIndex;
  final bool priv;

  @override
  State<AddingButtonForm> createState() => _AddingButtonFormState();
}

class _AddingButtonFormState extends State<AddingButtonForm> {
  @override
  Widget build(BuildContext context) {
    cardNameController.clear();
    cardDescriptionController.clear();
    cardDeadlineController.clear();
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [lightPageUpGradient, lightPageDownGradient],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 50,
                width: 200,
                child: InputField(
                    contoller: cardNameController,
                    hint: "Заголовок",
                    obscured: false)),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 100,
                width: 200,
                child: SingleChildScrollView(
                  child: InputField(
                      contoller: cardDescriptionController,
                      hint: "Описание",
                      obscured: false),
                )),
            const SizedBox(
              height: 20,
            ),
            DateTimePicker(
              type: DateTimePickerType.dateTimeSeparate,
              dateMask: 'd MMM, yyyy',
              //initialValue: DateTime.now().toString(),
              firstDate: DateTime(2000),
              controller: cardDeadlineController,
              lastDate: DateTime(2100),
              icon: const Icon(Icons.event),
              dateLabelText: 'Дата',
              timeLabelText: "Время",
            ),
            const SizedBox(
              height: 20,
            ),
            IconButton(
                onPressed: () async {
                  await create_card.createCard(
                      cardNameController.text,
                      cardDescriptionController.text,
                      "todo",
                      widget.priv
                          ? app_data.boards.first.boardId
                          : app_data.company.boards[widget.boardIndex].boardId,
                      cardDeadlineController.text,
                      widget.priv);
                  await user_boards.getUsersBoards();
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) =>widget.priv?const ProfilePage():const TreePage()),
                          (route) => false);
                },
                icon: const Icon(Icons.check))
          ],
        ),
      ),
    );
  }
}
