import 'package:flutter/material.dart';

class SendMoneyCancelButton extends StatefulWidget {
  SendMoneyCancelButton({Key key}) : super(key: key);

  @override
  _SendMoneyCancelButtonState createState() => _SendMoneyCancelButtonState();
}

class _SendMoneyCancelButtonState extends State<SendMoneyCancelButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 60,
        //width: 100,
        //color: Colors.blueGrey,
        child: Align(
          alignment: Alignment.center,
          child: TextButton(
              child: Text(
                'Cancel',
                //textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
    );
  }
}
