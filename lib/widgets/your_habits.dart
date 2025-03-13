import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habits_project/widgets/delete_goal_dialog.dart';
import 'package:habits_project/widgets/edit_goal_dialog.dart';

class YourHabits extends StatefulWidget {
  const YourHabits({super.key, required this.habits,});

  final List<Map<String, dynamic>> habits;


  @override
  State<YourHabits> createState() => _YourHabitsState();
}

class _YourHabitsState extends State<YourHabits> {
  List<bool> isCheckingMe = [];
  final TextEditingController goalController = TextEditingController();
  final TextEditingController habitController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isCheckingMe = List.generate(widget.habits.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.habits.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(widget.habits[index]['name'] ?? ""),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                Checkbox(
                  checkColor: Color(0xFF37C871),
                  value: isCheckingMe[index],
                  onChanged: (value) {
                    setState(() {
                      isCheckingMe[index] = value!;
                    });
                  },
                ),
            PopupMenuButton(
                icon: Icon(Icons.more_vert),
                onSelected: (value) async {
                  if (value == "Edit") {
                    habitController.text = widget.habits[index]['name'];
                    habitController.text = widget.habits[index]['habitType'];
                    EditGoalDialog().showEditGoalDialog(
                        context, goalController, habitController);
                  } else {
                    bool isDeleted = await DeleteGoalDialog()
                        .showDeleteGoalDialog(context, widget.habits[index]['id']);
                    if (isDeleted) {
                      setState(() {
                        widget.habits.removeAt(index);
                      });
                    }
                  }
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: "Edit",
                      child: Text("Edit"),
                    ),
                    PopupMenuItem(
                      value: "Delete",
                      child: Text("Delete"),
                    ),
                  ];
                }
                ),


              ],
            ),
          ),
        );
      },
    );
  }

  void showEditDialog(BuildContext context, String currentHabit,
      Function(String) onEdit) {
    TextEditingController controller = TextEditingController(
        text: currentHabit);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Habit"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter new habit name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  onEdit(controller.text);
                }
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}


