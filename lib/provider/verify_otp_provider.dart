import 'package:flutter/cupertino.dart';
import 'package:habits_project/repos/verify_otp_repo.dart';

class VerifyOtpProvider extends ChangeNotifier {
  bool isLoading = false;
  String? error;

  Future<void> verifyOtp({required String email, required String otp}) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      await VerifyOtpRepo().verifyOtp(email: email, otp: otp);
    } catch (e) {
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