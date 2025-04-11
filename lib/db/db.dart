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
      'progress': 5,
      'target': 7,
      'habitType': 'Everyday',
    },
    {
      'id': 2,
      'userId': 1,
      'name': 'Read 8 Books',
      'progress': 5,
      'target': 7,
      'habitType': 'Everyday',
    },
    {
      'id': 3,
      'userId': 1,
      'name': 'Read 10 Books',
      'progress': 5,
      'target': 7,
      'habitType': 'Everyday',
    },
  ];

  static List<Map<String, dynamic>> habits = [
    {
      'id': 1,
      'userId': 1,
      'name': 'Reading',
      'completed': true,
    },
    {
      'id': 1,
      'userId': 1,
      'name': 'Listening',
      'completed': true,
    },
    {
      'id': 1,
      'userId': 1,
      'name': 'Writing',
      'completed': true,
    },
  ];
}
