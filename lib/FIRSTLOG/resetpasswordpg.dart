import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value!.isEmpty) {
      return 'Please confirm your password';
    } else if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform necessary actions
      // For example, update the password
      String newPassword = _passwordController.text;
      print('New password: $newPassword');

      // Navigate to the next screen
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => NextScreen()),
      // );
    }
  }

  Widget _buildPasswordField(
      TextEditingController controller,
      String hintText,
      IconData suffixIcon,
      String? Function(String?) validator,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[350],
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: hintText,
          suffixIcon: Icon(suffixIcon),
        ),
        validator: validator,
      ),
    );
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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 25,
                    color: const Color.fromARGB(255, 124, 118, 118),
                  ),
                ),
              ),
              _buildPasswordField(
                _passwordController,
                'Enter Password',
                Icons.remove_red_eye,
                _validatePassword,
              ),
              _buildPasswordField(
                _confirmPasswordController,
                'Confirm Password',
                Icons.remove_red_eye,
                _validateConfirmPassword,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 113, 160, 204),
                  ),
                  minimumSize: MaterialStateProperty.all(Size(266, 50)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                ),
                onPressed: _submitForm,
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
