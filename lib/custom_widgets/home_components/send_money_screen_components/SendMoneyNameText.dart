import 'package:flutter/material.dart';


class SendMoneyNameText extends StatefulWidget {
  SendMoneyNameText({Key key}) : super(key: key);

  @override
  _SendMoneyNameTextState createState() => _SendMoneyNameTextState();
}

class _SendMoneyNameTextState extends State<SendMoneyNameText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 70,
      //width: 100,
      //color: Colors.amber,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Name',
          //textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
