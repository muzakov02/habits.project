import 'package:flutter/material.dart';
import 'package:habits_project/provider/goals_provider.dart';
import 'package:habits_project/provider/habits_provider.dart';
import 'package:habits_project/provider/login_provider.dart';
import 'package:provider/provider.dart';

import 'home/home_page.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => GoalsProvider()),
        ChangeNotifierProvider(create: (context) => HabitsProvider()),
      ],
      child: MaterialApp(
        title: '',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
