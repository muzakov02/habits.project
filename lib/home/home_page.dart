import 'package:flutter/material.dart';
import 'package:habits_project/db/db.dart';
import 'package:habits_project/home/added_page.dart';
import 'package:habits_project/home/edit_goal.dart';
import 'package:habits_project/home/edit_habit.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> habits = [];
  List<Map<String, dynamic>> goals = [];
  final TextEditingController goalController = TextEditingController();
  final TextEditingController habitController = TextEditingController();
  bool isCheckingMe = false;

  @override
  void initState() {
    super.initState();
    habits = Db.habits;
    goals = Db.goals;
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
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Container(
                      width: 350,
                      height: 189,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.orange, Colors.deepOrange],
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(20.0),
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 130,
                            height: 130,
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  width: 130,
                                  height: 130,
                                  child: CircularProgressIndicator(
                                    value: .7,
                                    color: Colors.white.withValues(
                                      alpha: .8,
                                    ),
                                    backgroundColor: Colors.white.withValues(
                                      alpha: .6,
                                    ),
                                    strokeWidth: 20,
                                    strokeCap: StrokeCap.round,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '70%',
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "3 of 5 habits",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              Text(
                                "completed today!",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      right: -20,
                      child: Image(
                        image: AssetImage('assets/images/Calendar.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditHabit(habits: habits),
                          ),
                        );
                      },
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
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => EditGoal()));
                      },
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
                      leading: Text(goals[index]['name'] ?? ""),
                      subtitle: Text(goals[index]['habitType'] ?? ""),
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
          _showAddHabitDialog(context);
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  void _showAddHabitDialog(BuildContext context) {
    List<Map<String, String>> items = [
      {
        'value': 'month',
        'text': "1 month(30 days)",
      },
      {
        'value': 'week',
        'text': "1 week (7 days)",
      },
      {
        'value': 'day',
        'text': "1 day",
      },
    ];
    String dropDownValue = 'month';

    List<Map<String, String>> names = [
      {
        'value': 'month',
        'text': "Everymonth",
      },
      {
        'value': 'week',
        'text': "Everyweek",
      },
      {
        'value': 'day',
        'text': " Everyday",
      },
    ];
    String habitdropDownValue = 'month';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding: EdgeInsets.all(16),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Create New Habit Goal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your Goal",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  TextFormField(
                    controller: goalController,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Habit Name",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  TextFormField(
                    controller: habitController,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pariod',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButton(
                          padding: EdgeInsets.zero,
                          value: dropDownValue,
                          underline: SizedBox(),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          items: items.map(
                                (item) {
                              return DropdownMenuItem(
                                value: item['value'],
                                child: Text(item['text'].toString()),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropDownValue = value.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Habit type',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButton(
                          value: habitdropDownValue,
                          underline: SizedBox(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                          items: names.map(
                                (item) {
                              return DropdownMenuItem(
                                value: item['value'],
                                child: Text(item['text'].toString()),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            setState(() {
                              habitdropDownValue = value.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (dropDownValue == 'month') {}
                      final Map<String, dynamic> habit = {
                        'id': Db.habits.length + 1,
                        'userId': 1,
                        'name': habitController.text,
                        'completed': false,
                      };
                      Db.habits.add(habit);

                      final Map<String, dynamic> goals = {
                        'id': Db.goals.length + 1,
                        'userId': 1,
                        'name': goalController.text,
                        'progress': 5,
                        'target': 7,
                        'habitType': habitdropDownValue,
                      };
                      Db.goals.add(habit);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddedPage()),
                      );
                    },
                    child: Container(
                      height: 49,
                      width: 298,
                      decoration: BoxDecoration(
                        color: Color(0XFFFF5C00),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Create New",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
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
