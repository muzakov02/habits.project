import 'package:flutter/cupertino.dart';
import 'package:habits_project/models/goal.dart';
import 'package:habits_project/repos/goals/get_goals_repo.dart';

class GoalsProvider extends ChangeNotifier {
  bool isLoading = false;
  String? error;

  List<Goal> _goals = [];
  List<Goal> get goals => _goals;

  Future<void> getGoals() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final List<Goal> fetchedGoals = await GetGoalsRepo().getGoals();
      _goals = fetchedGoals;
      print('✅ Goals fetched: ${_goals.length}');
    } catch (e) {
      error = "❌ Ma'lumot olishda xatolik: ${e.toString()}";
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
