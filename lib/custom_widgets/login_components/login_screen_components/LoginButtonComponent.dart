import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';

class LoginButtonComponent extends StatefulWidget {
  const LoginButtonComponent({
    Key key,
  }) : super(key: key);

  @override
  _LoginButtonComponentState createState() => _LoginButtonComponentState();
}

class _LoginButtonComponentState extends State<LoginButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.arrow_forward_sharp),
      backgroundColor: kPrimaryColor,
      onPressed: () async {},
    );
  }
}
