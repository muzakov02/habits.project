import 'package:flutter/material.dart';
import 'package:habits_project/models/goal.dart';
import 'package:habits_project/widgets/your_goals.dart';
class EditGoal extends StatefulWidget {
  const EditGoal({super.key, required this.goals});
  final List<Goal> goals;

  @override
  State<EditGoal> createState() => _EditGoalState();
}

class _EditGoalState extends State<EditGoal> {
  @override
  Widget build(BuildContext context) {
    print(widget.goals.first.id);
    // asdfasdf/goals/widget.goals.first.id
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Habit",
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
          itemCount: widget.goals.length,
          itemBuilder: (context, index){
        return YourGoals(goals: widget.goals);
      }),
    );
  }
}
