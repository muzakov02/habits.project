import 'dart:convert';

import 'package:habits_project/core/constans/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CreateNewGoalRepo {
  Future<int> createNewGoal(String title, String description, String endDate) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      if (token != null) {
        final response = await http.post(
          Uri.parse('${Api.baseUrl}${Api.goals}'),
          headers: {
            'accept': '*/*',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode({
            "title": title,
            "description": description,
            "end_date": endDate,
          }),
        );

        if (response.statusCode < 200 || response.statusCode > 300) {
          print("❌ Xatolik:  ");
          throw Exception("Server xatosi:");
        }

        final data = jsonDecode(response.body);
        print("✅ muvaffaqiyatli: ${jsonEncode(data)}");

        if (data["goal_id"] != null) {
          return data["goal_id"];
        } else {
          throw Exception("goal_id topilmadi");
        }
      } else {
        throw Exception("Token topilmadi");
      }
    } catch (e) {
      print("ERROR $e");
      throw Exception("❌ Xatolik yuz berdi: ${e.toString()}");
    }
  }
}

