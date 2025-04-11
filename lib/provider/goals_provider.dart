import 'package:flutter/cupertino.dart';
import 'package:habits_project/models/goal.dart';
import 'package:habits_project/repos/goals/create_new_goal_repo.dart';
import 'package:habits_project/repos/goals/get_goals_repo.dart';

class GoalsProvider extends ChangeNotifier {
  bool isLoading = false;
  String? error;

  Future<List<Goal>?> getGoals() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      final List<Goal> goals = await GetGoalsRepo().getGoals();
      isLoading = false;
      notifyListeners();
      print("Done");
      return goals;
    } catch (e) {
      error = "❌ Ma'lumot olishda xatolik: ${e.toString()}";
      print("error");
    }

    isLoading = false;
    notifyListeners();
    return null;
  }

  Future<String?> createNewGoal(
      String title,
      String description,
      String endDate) async {

    isLoading = true;
    error = null;
    notifyListeners();
    try {
      await CreateNewGoalRepo().createNewGoal(title, description, endDate);
      print("succes");
      return null;
    } catch (e) {
      error = "❌ Ma'lumot olishda xatolik: ${e.toString()}";
      print("error");
      return error;
    }
  }

  void clearError() {
    error = null;
    notifyListeners();
  }
}
