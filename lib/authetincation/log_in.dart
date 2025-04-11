import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habits_project/authetincation/sign_up_page.dart';
import 'package:habits_project/home/home_page.dart';
import 'package:habits_project/provider/goals_provider.dart';
import 'package:habits_project/provider/login_provider.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isRememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Log In",
                    style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF2F2F2F)),
                  ),
                  Row(
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Color(0XFFFF5C00),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Color(0XFFFF5C00),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text('Email'),
              TextFormField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Password'),
              TextFormField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = value!;
                      });
                    },
                  ),
                  Text("Remember me"),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color(0XFF2F2F2F)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Consumer<LoginProvider>(builder: (context, provider, _) {
                return InkWell(
                  onTap: () async {
                    await provider.login(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
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
                    decoration: BoxDecoration(
                      color: Color(0XFFFF5C00),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: provider.isLoading
                          ? CircularProgressIndicator()
                          : Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'Or sign up with:',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF7F7F7F),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 49,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/google.svg',
                    width: 24,
                    height: 24,
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
