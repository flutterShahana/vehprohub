import 'package:autoprohub/FIRSTLOG/resetpasswordpg.dart';
import 'package:flutter/material.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  List<TextEditingController> otpControllers = [];

  @override
  void initState() {
    super.initState();
    // Initialize OTP controllers
    for (int i = 0; i < 4; i++) {
      otpControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    // Dispose OTP controllers
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  bool isOTPFilled() {
    // Check if all OTP fields are filled
    for (var controller in otpControllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  void verifyOTP() {
    if (isOTPFilled()) {
      // Perform OTP verification logic here
      String otp = '';
      for (var controller in otpControllers) {
        otp += controller.text;
      }
      print('Entered OTP: $otp');
    } else {
      print('Please fill all OTP fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VERIFICATION'),
        backgroundColor: Colors.green,
        foregroundColor: Color.fromARGB(255, 255, 254, 254),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Enter the four digit OTP',
                style: TextStyle(
                  fontSize: 25,
                  color: const Color.fromARGB(255, 124, 118, 118),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 20,
                  ),
                  child: SizedBox(
                    width: 60,
                    child: TextField(
                      obscureText: true,
                      maxLength: 1,
                      controller: otpControllers[index],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[350],
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: '_',
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 113, 160, 204)),
                minimumSize: MaterialStateProperty.all(Size(266, 50)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResetPassword()));
              }, child: Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
