import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/screens/login_screens/new_pass.dart';

class ForgotPassTextFieldComponent extends StatelessWidget {
  const ForgotPassTextFieldComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewPass()),
            );
          },
          child: Text(
            'Forgot my password',
            style: new TextStyle(
              fontSize: 15,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
