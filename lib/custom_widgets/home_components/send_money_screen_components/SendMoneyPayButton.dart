import 'package:flutter/material.dart';
import 'package:pa_bank_app/screens/home_screens/home_screen.dart';

import '../../../constants.dart';

class SendMoneyPayButton extends StatefulWidget {
  SendMoneyPayButton({Key key}) : super(key: key);

  @override
  _SendMoneyPayButtonState createState() => _SendMoneyPayButtonState();
}

class _SendMoneyPayButtonState extends State<SendMoneyPayButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            primary: kPrimaryColor,
          ),
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width - 80,
            margin: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    package: 'flutter_credit_card',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
    );
  }
}
