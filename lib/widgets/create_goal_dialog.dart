import 'package:flutter/material.dart';
import 'package:habits_project/provider/create_goals_provider.dart';
import 'package:provider/provider.dart';
import '../models/goal.dart';

class CreateGoalDialog extends StatefulWidget {
  @override
  _CreateGoalDialogState createState() => _CreateGoalDialogState();
}

class _CreateGoalDialogState extends State<CreateGoalDialog> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  String _period = '1 Month (30 Days)';
  String _type = 'Everyday';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CreateGoalsProvider>(context);

    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Create New Habit Goal'),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Your Goal'),
            ),
            TextField(
              controller: _descController,
              decoration: InputDecoration(labelText: 'Habit Name'),
            ),
            DropdownButtonFormField(
              value: _period,
              items: ['1 Month (30 Days)', '2 Weeks', '1 Week']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => _period = val!),
            ),
            DropdownButtonFormField(
              value: _type,
              items: ['Everyday', 'Weekdays', 'Weekends']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => _type = val!),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: provider.isLoading
              ? null
              : () async {
            final goal = Goal(
              title: _titleController.text,
              description: _descController.text,

            );
            await provider.createGoal(goal);
            Navigator.pop(context);
          },
          child: Text(provider.isLoading ? 'Saving...' : 'Create New'),
        ),
      ],
    );
  }
}
