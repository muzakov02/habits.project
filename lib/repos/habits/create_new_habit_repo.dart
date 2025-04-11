import 'dart:convert';

import 'package:habits_project/core/constans/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CreateNewHabitRepo {
  Future<void> createNewHabit(
      String title, String frequency, String createdAt, int goalId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      if (token != null) {
        final response = await http.post(
          Uri.parse('${Api.baseUrl}${Api.habits}'),
          headers: {
            'accept': '*/*',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode({
            "title": title,
            "frequency": frequency,
            "createdAt": createdAt,
            "goal_id": goalId,
          }),
        );

        if (response.statusCode < 200 || response.statusCode > 300) {
          print("❌ Xatolik:  ");
          throw Exception("Server xatosi:");
        }

        final data = jsonDecode(response.body);
        print("✅ muvaffaqiyatli: ${jsonEncode(data)}");
      } else {
        throw Exception("Token topilmadi");
      }
    } catch (e) {
      print("ERROR $e");
      throw Exception("❌ Xatolik yuz berdi: ${e.toString()}");
    }
  }
}

