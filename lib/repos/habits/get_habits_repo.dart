import 'dart:convert';
import 'package:habits_project/models/habit.dart';
import 'package:http/http.dart' as http;
import 'package:habits_project/core/constans/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetHabitsRepo {
  Future<List<Habit>> getHabits() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token != null) {
        final response = await http.get(
          Uri.parse('${Api.baseUrl}${Api.habits}'),
          headers: {
            'accept': '*/*',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
        );

        if (response.statusCode < 200 || response.statusCode > 300) {
          throw Exception("Server xatosi:");
        }

        final data = jsonDecode(response.body);
        List habitsJson = data['habits'];
        return habitsJson.map((e) => Habit.fromJson(e)).toList();
      } else {
        throw Exception("Token topilmadi");
      }
    } catch (e, s) {
      print("ERROR $e");
      print("Stack $s");
      throw Exception("❌ Xatolik yuz berdi: ${e.toString()}");
    }
  }
}

