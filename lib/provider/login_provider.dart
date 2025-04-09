import 'package:flutter/cupertino.dart';
import 'package:habits_project/repos/auth/auth_repo.dart';
import 'package:habits_project/repos/auth/login_repo.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  String? error;

  Future<void> login({required String email, required String password}) async {
    isLoading = true;
    error = null;
    notifyListeners();
    print("Provider ishladi");
    try {
      print('try');
      await LoginRepo().LogIn(email: email, password: password);
    } catch (e) {
      print('catch: $e');
      error = "❌ Loginda xatolik: ${e.toString()}";
    }
    isLoading = false;
    notifyListeners();
  }

  void clearError() {
    error = null;
    notifyListeners();
  }
}
