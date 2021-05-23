import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/screens/login_screens/registerScreen.dart';

class CtAccountComponent extends StatelessWidget {
  const CtAccountComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen()),
        );
      },
      child: Text(
        'Don’t have a account?',
        style: new TextStyle(
          fontSize: 17,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
