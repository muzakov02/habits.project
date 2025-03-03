import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditHabit extends StatefulWidget {
  EditHabit({super.key, required List<Map<String, dynamic>> habits});

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
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
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
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Today Habit",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: habits.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(habits[index]['name'] ?? ""),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                Checkbox(
                                  checkColor: Color(0xFF37C871),
                                  value: isCheckingMe,
                                  onChanged: (value) {
                                    setState(() {
                                      isCheckingMe = value!;
                                    });
                                  },
                                ),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.more_vert))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
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
