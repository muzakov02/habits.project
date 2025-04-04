import 'package:flutter/material.dart';
import 'package:habits_project/authetincation/sign_up_page.dart';
import 'package:habits_project/provider/habit_provider.dart';
import 'package:habits_project/provider/sign_up_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HabitProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habits App',
      theme: ThemeData(),
      home: ChangeNotifierProvider(
        create: (context) => SignUpProvider(),
        child: const SignUpPage(),
      ),
    );
  }
}
