import 'package:flutter/material.dart';
import 'package:habits_project/widgets/your_habits.dart';
import 'package:intl/intl.dart';


class EditHabit extends StatefulWidget {
  const EditHabit({super.key, required this.habits});

  final List<Map<String, dynamic>> habits;

  @override
  State<EditHabit> createState() => _EditHabitState();
}

class _EditHabitState extends State<EditHabit> {
  final List<DateTime> next7Days = List.generate(
    7,
        (index) => DateTime.now().add(Duration(days: index)),
  );
  List<Map<String, dynamic>> habits = [];
  final TextEditingController habitController = TextEditingController();
  bool isCheckingMe = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Habit",
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
        SizedBox(
        height: 66,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: next7Days.length,
          reverse: false,
          itemBuilder: (context, index) {
            DateTime date = next7Days[index];

            bool isToday = DateFormat('yyyy-MM-dd').format(date) ==
                DateFormat('yyyy-MM-dd').format(DateTime.now());

            return _buildDateItem(date, isToday);
          },
        ),
      ),
      SizedBox(
        height: 20,
      ),

         Expanded(
           child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: widget.habits.length,
              itemBuilder: (context, index) {
                return YourHabits(habits: widget.habits, );
              }),
         ),

        ],
      ),
    );
  }

  Widget _buildDateItem(DateTime date, bool isSelected) {
    return Container(
      width: 59,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange.shade50 : Colors.white,
        border: Border.all(color: Colors.blue.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat.d().format(date),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.orange : Colors.black,
            ),
          ),
          Text(
            DateFormat.MMM().format(date),
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.orange : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
