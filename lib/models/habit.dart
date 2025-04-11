class Habit {
  final int id;
  final int goalId;
  final String title;
  final String frequency;

  Habit({
    required this.id,
    required this.goalId,
    required this.title,
    required this.frequency,
  });

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'],
      goalId: json['goal_id'],
      title: json['title'],
      frequency: json['frequency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'goal_id': goalId,
      'title': title,
      'frequency': frequency,
    };
  }
}
