import 'package:flutter/material.dart';
import 'package:habits_project/home/edit_goal.dart';
class YourGoals extends StatelessWidget {
  const YourGoals({super.key, required this.goals});
  final List<Map<String, dynamic>> goals;

  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: goals.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(goals[index]['name'] ?? ""),
          subtitle: Text(goals[index]['habitType'] ?? ""),
          trailing: PopupMenuButton(
            onSelected: (value){
              if(value == "Edit"){

              }
              else{

              }
            },
              icon: Icon(Icons.more_vert),
              itemBuilder: (context){
                return [
                  PopupMenuItem(
                      value: "Edit",
                      child: Text("Edit"),),
                  PopupMenuItem(
                    value: "Delete",
                    child: Text("Delete"),),
                ];
              })
        );
      },
    );
  }
}
// icon: Icon(Icons.more_vert)