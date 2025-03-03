import 'package:flutter/material.dart';

class HabitProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _habits = [];
   List<Map<String, dynamic>> _goals = [];

  List<Map<String, dynamic>> get habits => _habits;
  List<Map<String, dynamic>> get goals => _goals;

  void addHabit(String habitName) {
    _habits.add({
      'id': _habits.length + 1,
      'name': habitName,
      'completed': false,
    });

    notifyListeners();
  }
  void addGoal(String goalName, dynamic habitType) {
    _goals.add({
      'id':_goals.length + 1,
      'userId': 1,
      'name': 'goalsName',
      'progress': 5, // Number of days completed
      'target': 7,   // Total target days
      'habitType': habitType ,
    });

    notifyListeners();
  }
}
