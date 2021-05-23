import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';
import 'package:pa_bank_app/screens/home_screens/home_screen.dart';

class ButtonComponent extends StatefulWidget {
  const ButtonComponent({
    Key key,
  }) : super(key: key);

  @override
  _ButtonComponentState createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(
          new MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
          ),
        );
      },
      child: const Icon(Icons.arrow_forward_sharp),
      backgroundColor: kPrimaryColor,
    );
  }
}
