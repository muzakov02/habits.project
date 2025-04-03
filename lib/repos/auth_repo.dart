import 'dart:convert';
import 'package:habits_project/core/constans/api.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  Future<void> signUp({required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('${Api.baseUrl}${Api.signUp}'),
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
    } catch (e) {
      throw Exception("❌ Xatolik yuz berdi: ${e.toString()}");
    }
  }
}
