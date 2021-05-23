import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';

class LoginTextComponent extends StatelessWidget {
  const LoginTextComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 80),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Login',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 54,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
