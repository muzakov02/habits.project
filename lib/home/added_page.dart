import 'package:flutter/material.dart';
import 'package:habits_project/home/home_page.dart';
import 'package:habits_project/provider/goals_provider.dart';
import 'package:provider/provider.dart';

class AddedPage extends StatelessWidget {
  const AddedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  image: AssetImage('assets/images/note.png'),
                ),
        Positioned(
          top: 70,
          right: 120,
          child: Icon(Icons.check_circle,size: 41,color: Colors.green,),
        ),
              ],
            ),
            Text(
              'Done!',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              'New Habit Goal has added',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),

            Text(
              'Let’s do the best to achieve your goal!',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),

            SizedBox(height: 40),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                        create: (context) => GoalsProvider(),
                        child: HomePage()),
                  ),
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
                    "OK",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
      ),
    );
  }
}
