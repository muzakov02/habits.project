import 'package:flutter/cupertino.dart';

class HabitsProvider extends ChangeNotifier {
  bool isLoading = false;
  String? error;

  List<Habit> _habits = [];
  List<Habit> get habits => _habits;

  Future<void> getHabits() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final List<Habit> fetchedHabits = await GetHabitsRepo().getHabits();
      _habits = fetchedHabits;
      print('✅ Goals fetched: ${_habits.length}');
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
