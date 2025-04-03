import 'package:flutter/cupertino.dart';
import 'package:habits_project/repos/auth_repo.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  String? error;

  Future<void> signUp({required String email, required String password}) async {
    isLoading = true;
    error = null;
    notifyListeners();
    print("Provider ishladi");
    try {
      print('try');
      await AuthRepo().signUp(email: email, password: password);
    } catch (e) {
      print('catch: $e');
      error = "❌ Ro‘yxatdan o‘tishda xatolik: ${e.toString()}";
    }
    isLoading = false;
    notifyListeners();
  }

  void clearError() {
    error = null;
    notifyListeners();
  }
}
