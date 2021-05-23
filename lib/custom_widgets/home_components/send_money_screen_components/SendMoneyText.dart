import 'package:flutter/material.dart';

import '../../../constants.dart';


class SendMoneyText extends StatelessWidget {
  const SendMoneyText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: 60,
        //width: 100,
        //color: Colors.yellow,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Send Money',
            //textAlign: TextAlign.center,
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 33, //33 emulator
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
