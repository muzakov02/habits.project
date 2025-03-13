import 'package:flutter/material.dart';

class ProgressHome extends StatefulWidget {
  const ProgressHome({super.key});

  @override
  State<ProgressHome> createState() => _ProgressHomeState();
}

class _ProgressHomeState extends State<ProgressHome> {
  List<Map<String, String>> items = [
    {
      'value': 'month',
      'text': "This Month",
    },
    {
      'value': 'week',
      'text': "This week",
    },
    {
      'value': 'day',
      'text': "This day",
    },
  ];
  String dropDownValue = 'month';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Progress",
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.w700),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Progress Report",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Goals",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.orange),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Center(
                      child: SizedBox(
                        width: 220,
                        height: 220,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              width: 220,
                              height: 220,
                              child: CircularProgressIndicator(
                                value: .6,
                                color: Colors.orange.withValues(
                                  alpha: .8,
                                ),
                                backgroundColor: Colors.white.withValues(
                                  alpha: .6,
                                ),
                                strokeWidth: 24,
                                strokeCap: StrokeCap.round,
                              ),
                            ),
                            Center(
                              child: Text(
                                '60%',
                                style: TextStyle(
                                    fontSize: 29,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.orange),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check),
                        Text(
                          '11 Habits goal has achieved',
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close),
                        Text(
                          '6 Habits goal hasn’t achieved',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                value: 1,
                                color: Colors.green.withValues(
                                  alpha: 1,
                                ),
                                backgroundColor: Colors.white.withValues(
                                  alpha: .0,
                                ),
                                strokeWidth: 3,
                                strokeCap: StrokeCap.round,
                              ),
                            ),
                            Center(
                              child: Text(
                                '100%',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.green),
                              ),
                            )
                          ],
                        ),
                      ),
                      title: Text(
                        "Journaling everyday",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        "7 from 7 days target",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Container(
                        width: 79,
                        height: 22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.blue.shade100),
                        child: Center(
                          child: Text('Achieved',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                value: 1,
                                color: Colors.green.withValues(
                                  alpha: 1,
                                ),
                                backgroundColor: Colors.white.withValues(
                                  alpha: .0,
                                ),
                                strokeWidth: 3,
                                strokeCap: StrokeCap.round,
                              ),
                            ),
                            Center(
                              child: Text(
                                '100%',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.green),
                              ),
                            )
                          ],
                        ),
                      ),
                      title: Text(
                        "Cooking Practice",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        "7 from 7 days target",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Container(
                        width: 79,
                        height: 22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.blue.shade100),
                        child: Center(
                          child: Text('Achieved',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                value: 1,
                                color: Colors.grey.withValues(
                                  alpha: .7,
                                ),
                                backgroundColor: Colors.white.withValues(
                                  alpha: .3,
                                ),
                                strokeWidth: 3,
                                strokeCap: StrokeCap.round,
                              ),
                            ),
                            Center(
                              child: Text(
                                '70%',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                      ),
                      title: Text(
                        "Vitamin",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        "7 from 7 days target",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Container(
                        width: 79,
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Center(
                          child: Text('Achieved',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'SeeALl',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.orange),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
