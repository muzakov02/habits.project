import 'package:flutter/cupertino.dart';
import 'package:habits_project/models/habit.dart';
import 'package:habits_project/repos/habits/create_new_habit_repo.dart';
import 'package:habits_project/repos/habits/get_habits_repo.dart';

class HabitsProvider extends ChangeNotifier {
  bool isLoading = false;
  String? error;


  Future<List<Habit>?> getHabits() async {
    isLoading = true;
    error = null;
    notifyListeners();


    try {
      final List<Habit> habits = await GetHabitsRepo().getHabits();
      isLoading = false;
      notifyListeners();
      print("Done");
      return habits;
    } catch (e) {
      error = "❌ Ma'lumot olishda xatolik: ${e.toString()}";
      print(error);
    }

    isLoading = false;
    notifyListeners();
    return null;
  }

  Future<String?> createNewHabit(String title,
      String frequency,
      String createdAt) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      await CreateNewHabitRepo().createNewHabit(title, frequency, createdAt);
      print("succes");
      return null;
    }
    catch (e) {
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
