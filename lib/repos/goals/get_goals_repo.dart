import 'dart:convert';

import 'package:habits_project/core/constans/api.dart';
import 'package:habits_project/models/goal.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetGoalsRepo {
  Future<List<Goal>> getGoals() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      if (token != null) {
        final response = await http.get(
          Uri.parse('${Api.baseUrl}${Api.goals}'),
          headers: {
            'accept': '*/*',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
        );

        if (response.statusCode < 200 || response.statusCode > 300) {
          print("❌ Xatolik: ");
          throw Exception("Server xatosi:");
        }
        final data = jsonDecode(response.body);

        List goalsJson = data['goals'];
        List<Goal> goals =
            goalsJson.map((goal) => Goal.fromJson(goal)).toList();

        return goals;
      } else {
        throw Exception("Token topilmadi");
      }
    } catch (e) {
      print("ERROR $e");
      throw Exception("❌ Xatolik yuz berdi: ${e.toString()}");
    }
  }
}
