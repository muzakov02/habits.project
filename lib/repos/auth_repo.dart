import 'package:habits_project/db/db.dart';


class AuthRepo{
  final db= Db();

  login (String email, String password){
    for (var user in Db.users){
      if(user['email'] == email && user['password']==password){
        return true;
      }
      else if(user['email'] != email && user['password']!=password){
        print("email and password are wrong");
      }
    }
  }
}