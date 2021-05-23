import 'package:flutter/material.dart';

class SendMoneySaveas extends StatefulWidget {
  SendMoneySaveas({Key key}) : super(key: key);

  @override
  _SendMoneySaveasState createState() => _SendMoneySaveasState();
}

class _SendMoneySaveasState extends State<SendMoneySaveas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      //height: 60,
      //width: 100,
      //color: Colors.yellow,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Save individual as a..',
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
