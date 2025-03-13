import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpRepo {
  Future<bool> fetchSignUp(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('your_api_url_here'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {"Content-Type": "application/json"},
      );

      print("Serverdan javob: ${response.body}"); // 🔎 Debug uchun

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == 'success') {
          return true; // ✅ Ro‘yxatdan o‘tish muvaffaqiyatli
        } else if (data['message'] == 'Email is already registered') {
          return false; // ❌ Email allaqachon mavjud
        }
      }

      return false;
    } catch (e) {
      print("❌ Xatolik: $e");
      return false;
    }
  }
}
