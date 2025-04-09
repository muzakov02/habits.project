import 'package:flutter/material.dart';
import 'package:habits_project/authetincation/log_in.dart';
import 'package:habits_project/provider/login_provider.dart';
import 'package:habits_project/provider/verify_otp_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpCodePage extends StatefulWidget {
  const OtpCodePage({super.key, required this.email, required String password});

  final String email;

  @override
  State<OtpCodePage> createState() => _OtpCodePageState();
}

class _OtpCodePageState extends State<OtpCodePage> {
  final otpController = TextEditingController();
  final  emailController = TextEditingController();


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
            Center(
              child: Pinput(
                length: 6,
                controller: otpController,
                defaultPinTheme: PinTheme(
                  width: 48,
                  height: 56,
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Consumer<VerifyOtpProvider>(builder: (context, provider, _) {
              return InkWell(
                onTap: () async {
                  await provider.verifyOtp(
                    email: emailController.text.trim(),
                    otp: otpController.text,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => LoginProvider(),
                        child: LogIn(

                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 49,
                  decoration: BoxDecoration(
                    color: Color(0XFFFF5C00),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Center(
                    child: provider.isLoading
                        ? CircularProgressIndicator()
                        :Text(
                      "Submit",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
