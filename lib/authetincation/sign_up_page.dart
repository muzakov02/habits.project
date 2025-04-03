import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habits_project/authetincation/log_in.dart';
import 'package:habits_project/authetincation/otp_code_page.dart';
import 'package:habits_project/provider/sign_up_provider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

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
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF2F2F2F)),
                  ),
                  Row(
                    children: [
                      Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Color(0XFFFF5C00)),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => LogIn()));
                        },
                        icon:
                        Icon(Icons.arrow_forward, color: Color(0XFFFF5C00)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text('Name'),
              TextFormField(
                  controller: nameController, decoration: _inputDecoration()),
              SizedBox(height: 10),
              Text('Email'),
              TextFormField(
                  controller: emailController, decoration: _inputDecoration()),
              SizedBox(height: 10),
              Text('Password'),
              TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: _inputDecoration()),
              SizedBox(height: 10),
              Text('Confirm Password'),
              TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: _inputDecoration()),
              SizedBox(height: 40),
              Consumer<SignUpProvider>(builder: (context, provider, _) {

                return InkWell(
                  onTap: provider.isLoading
                      ? null
                      : () async {
                    await provider.signUp(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );

                    if (provider.error == null) {
                      print("ERROR: null");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpCodePage(
                              email: emailController.text.trim(),
                              password:
                              passwordController.text.trim(),
                            )),
                      );
                    }
                  },
                  child: Container(
                    height: 49,
                    decoration: BoxDecoration(
                        color: Color(0XFFFF5C00),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: provider.isLoading
                          ? CircularProgressIndicator()
                          : Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 40),
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
              SizedBox(height: 40),
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

  InputDecoration _inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }
}
