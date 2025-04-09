import 'dart:convert';
import 'package:habits_project/models/goal.dart';
import 'package:http/http.dart' as http;
import 'package:habits_project/core/constans/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateGoalsRepo {
  Future<void> createGoal(Goal goal) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await http.post(
      Uri.parse('${Api.baseUrl}${Api.goals}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(goal.toJson()),
    );

    if (response.statusCode < 200 || response.statusCode > 300) {
      throw Exception('Xatolik: ${response.body}');
    }
  }

}
