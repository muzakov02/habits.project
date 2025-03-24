import 'package:flutter/material.dart';
import 'package:habits_project/authetincation/log_in.dart';
import 'package:habits_project/widgets/otp_input_box.dart';

class OtpCodePage extends StatefulWidget {
  const OtpCodePage({super.key});

  @override
  State<OtpCodePage> createState() => _OtpCodePageState();
}

class _OtpCodePageState extends State<OtpCodePage> {
  final List<TextEditingController> controllers =
      List.generate(5, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              "Enter OTP code we’ve sent to your email",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500,
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: controllers
                  .map((controller) => OtpInputBox(controller: controller))
                  .toList(),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
              },
              child: Container(
                height: 49,
                width: 298,
                decoration: BoxDecoration(
                  color: Color(0XFFFF5C00),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
