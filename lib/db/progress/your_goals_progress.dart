import 'package:flutter/material.dart';
class YourGoalsProgress extends StatefulWidget {
  const YourGoalsProgress({super.key});

  @override
  State<YourGoalsProgress> createState() => _YourGoalsProgressState();
}

class _YourGoalsProgressState extends State<YourGoalsProgress> {
  List<Map<String, String>> items = [
    {
      'value': 'month',
      'text': "All",
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
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),),
                  Text("Your Goals",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w700),)
                ],
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
          )
        ],
      ),),
    );
  }
}
