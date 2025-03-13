import 'package:flutter/material.dart';
import 'package:habits_project/widgets/delete_goal_dialog.dart';
import 'package:habits_project/widgets/edit_goal_dialog.dart';

class YourGoals extends StatefulWidget {
  const YourGoals({super.key, required this.goals});

  final List<Map<String, dynamic>> goals;


  @override
  State<YourGoals> createState() => _YourGoalsState();
}

class _YourGoalsState extends State<YourGoals> {
  final TextEditingController goalController = TextEditingController();

  final TextEditingController habitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.goals.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(widget.goals[index]['name'] ?? ""),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LinearProgressIndicator(
                //   value:
                //  widget.goals[index]['progres']/widget.goals[index]['target'],
                //   backgroundColor: Colors.grey.shade300,
                //   valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                // ),
                Text(widget.goals[index]['habitType'] ?? ""),
              ],
            ),
            trailing: PopupMenuButton(
                icon: Icon(Icons.more_vert),
                onSelected: (value) async {
                  if (value == "Edit") {
                    goalController.text = widget.goals[index]['name'];
                    habitController.text = widget.goals[index]['habitType'];
                    EditGoalDialog().showEditGoalDialog(
                        context, goalController, habitController);
                  } else {
                    bool isDeleted = await DeleteGoalDialog()
                        .showDeleteGoalDialog(context, widget.goals[index]['id']);
                    if (isDeleted) {
                      setState(() {
                        widget.goals.removeAt(index);
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
                }));
      },
    );
  }
}
// icon: Icon(Icons.more_vert)
