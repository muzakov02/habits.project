import 'dart:convert';

import 'package:habits_project/core/constans/api.dart';
import 'package:http/http.dart' as http;

class VerifyOtpRepo {
  Future<void> verifyOtp(
      {required String email,
        required String otp}) async {
    try {
      final response = await http.post(
        Uri.parse('${Api.baseUrl}${Api.verifyOtp}'),
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"email": email, "otp": otp}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode < 200 || response.statusCode >= 300) {
        print("❌ Xatolik: ${jsonEncode(data)}");
        throw Exception("Server xatosi: ${data['message']}");
      }

      print("✅ Ro‘yxatdan o‘tish muvaffaqiyatli: ${jsonEncode(data)}");
    } catch (e) {
      throw Exception("❌ Xatolik yuz berdi: ${e.toString()}");
    }
  }
}
