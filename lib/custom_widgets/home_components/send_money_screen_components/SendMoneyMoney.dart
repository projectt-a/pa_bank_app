import 'package:flutter/material.dart';

class SendMoneyMoney extends StatefulWidget {
  SendMoneyMoney({Key key}) : super(key: key);

  @override
  _SendMoneyMoneyState createState() => _SendMoneyMoneyState();
}

class _SendMoneyMoneyState extends State<SendMoneyMoney> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 75,
      //width: 100,
      //color: Colors.blueAccent,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          '\$50.00',
          //textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 70, //57 emulator
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
