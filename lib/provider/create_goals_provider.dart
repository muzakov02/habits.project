import 'package:flutter/cupertino.dart';
import 'package:habits_project/models/goal.dart';
import 'package:habits_project/repos/goals/create_goals_repo.dart';
import 'package:habits_project/repos/goals/get_goals_repo.dart';

class CreateGoalsProvider extends ChangeNotifier {
  bool isLoading = false;
  String? error;

  List<Goal> _goals = [];
  List<Goal> get goals => _goals;

  Future<void> createGoal(Goal goal) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
     await CreateGoalsRepo().createGoal(goal);
      print('✅ Goals fetched: ${_goals.length}');
    } catch (e) {
      error = "❌ Goal yaratishda xatolik: ${e.toString()}";
      print(error);
    }

    isLoading = false;
    notifyListeners();
  }

  void clearError() {
    error = null;
    notifyListeners();
  }
}
