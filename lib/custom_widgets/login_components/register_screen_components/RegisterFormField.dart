import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';

class RegisterFormField extends StatefulWidget {
  RegisterFormField({Key key}) : super(key: key);

  @override
  RegisterFormFieldState createState() => RegisterFormFieldState();
}

class RegisterFormFieldState extends State<RegisterFormField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Register',
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 54.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
