import 'package:flutter/material.dart';
import 'package:habits_project/db/db.dart';
import 'package:habits_project/home/added_page.dart';

class EditGoalDialog {
  void showEditGoalDialog(
    BuildContext context,
    TextEditingController goalController,
    TextEditingController habitController,
  ) {
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
      builder: (context) {
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
                        'Edit habit goal',
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

                      // final Map<String, dynamic> goals = {
                      //   'id': Db.goals.length + 1,
                      //   'userId': 1,
                      //   'name': goalController.text,
                      //   'progress': 5,
                      //   'target': 7,
                      //   'habitType': habitdropDownValue,
                      // };
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
