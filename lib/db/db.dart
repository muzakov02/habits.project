  class Db {
  static List<Map<String, dynamic>> users = [
    {
      'id': 1,
      'name': 'John',
      'email': 'john@gmail.com',
      'password': '123456789',
    },
  ];

  static List<Map<String, dynamic>> goals = [
    {
      'id': 1,
      'userId': 1,
      'name': 'Finish 5 Philosophy Books',
      'progress': 5, // Number of days completed
      'target': 7,   // Total target days
      'habitType': 'Everyday',
    },
  ];

 static List<Map<String, dynamic>> habits = [
    {
      'id': 1,
      'userId': 1,
      'name': '',
      'completed':true,
    },
  ];
}
