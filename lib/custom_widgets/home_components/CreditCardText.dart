import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';

class CreditCardText extends StatefulWidget {
  CreditCardText({Key key}) : super(key: key);

  @override
  _CreditCardTextState createState() => _CreditCardTextState();
}

class _CreditCardTextState extends State<CreditCardText> {
  String text = 'Add New Card';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          '$text',
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
