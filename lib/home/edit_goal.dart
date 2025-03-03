import 'package:flutter/material.dart';
class EditGoal extends StatefulWidget {
  const EditGoal({super.key});

  @override
  State<EditGoal> createState() => _EditGoalState();
}

class _EditGoalState extends State<EditGoal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Habit",
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
