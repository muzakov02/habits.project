import 'package:flutter/material.dart';
import 'package:habits_project/home/add_habit_dialog.dart';
import 'package:habits_project/models/goal.dart';
import 'package:habits_project/models/habit.dart';
import 'package:habits_project/provider/goals_provider.dart';
import 'package:habits_project/provider/habits_provider.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Habit> habits = [];
  List<Goal> goals = [];
  final TextEditingController goalController = TextEditingController();
  final TextEditingController habitController = TextEditingController();
  bool isCheckingMe = false;

  @override
  void initState() {
    super.initState();
    getGoals();
  }

  void getGoals() async {
    WidgetsBinding.instance.addPostFrameCallback(
          (_) {
        Provider.of<GoalsProvider>(context, listen: false).getGoals().then(
              (value) {
            if (value != null) {
              goals = value;
              setState(() {});
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("ERROR"),
                ),
              );
            }
          },
        );
      },
    );
  }
  void getHabits() async {
    WidgetsBinding.instance.addPostFrameCallback(
          (_) {
        Provider.of<HabitsProvider>(context, listen: false).getHabits().then(
              (value) {
            if (value != null) {
              habits = value;
              setState(() {});
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("ERROR"),
                ),
              );
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String formattedDate =
    DateFormat('EEE, MMM d, yyyy', 'en_US').format(today);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  " $formattedDate",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      "Hello,",
                      style:
                      TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Suys!",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Color(0XFFFF5C00)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today Habit",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0XFFFF5C00),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: habits.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(habits[index].title),
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Goals",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0XFFFF5C00),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: goals.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(goals[index].title),
                      subtitle: Text(goals[index].description),
                      trailing: IconButton(
                          onPressed: () {}, icon: Icon(Icons.more_vert)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade300,
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 30, color: Colors.white),
        onPressed: () {
          AddHabitDialog().showAddHabitDialog(
            context,
            goalController,
            habitController,
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_heart), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
      ],
    );
  }
}
