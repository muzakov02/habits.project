import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourHabits extends StatefulWidget {
  final List<Map<String, dynamic>> habits;

  const YourHabits({super.key, required this.habits,});

  @override
  State<YourHabits> createState() => _YourHabitsState();
}

class _YourHabitsState extends State<YourHabits> {
  List<bool> isCheckingMe = [];

  @override
  void initState() {
    super.initState();
    isCheckingMe = List.generate(widget.habits.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.habits.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(widget.habits[index]['name'] ?? ""),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                Checkbox(
                  checkColor: Color(0xFF37C871),
                  value: isCheckingMe[index],
                  onChanged: (value) {
                    setState(() {
                      isCheckingMe[index] = value!;
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
    );
  }
}

