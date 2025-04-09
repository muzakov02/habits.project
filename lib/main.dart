import 'package:flutter/material.dart';
import 'package:habits_project/provider/create_goals_provider.dart';
import 'package:habits_project/provider/goals_provider.dart';
import 'package:provider/provider.dart';

import 'home/home_page.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habits App',
      theme: ThemeData(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GoalsProvider()),
          ChangeNotifierProvider(create: (context) => CreateGoalsProvider()),

        ],
        child: const HomePage(),
      ),
    );
  }
}
