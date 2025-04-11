import 'dart:convert';
import 'package:habits_project/authetincation/log_in.dart';
import 'package:habits_project/core/constans/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo {
  Future<void> LogIn({required String email, required String password}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();


      final response = await http.post(
        Uri.parse('${Api.baseUrl}${Api.login}'),
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"email": email, "password": password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode < 200 || response.statusCode >= 300) {
        print("❌ Xatolik: ${jsonEncode(data)}");
        throw Exception("Server xatosi: ${data['message']}");
      }

      print("✅ Ro‘yxatdan o‘tish muvaffaqiyatli: ${jsonEncode(data)}");
      await prefs.setString('token', data['token']);
    } catch (e) {
      throw Exception("❌ Xatolik yuz berdi: ${e.toString()}");
    }
  }
}