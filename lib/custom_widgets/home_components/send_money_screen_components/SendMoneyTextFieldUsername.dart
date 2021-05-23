import 'package:flutter/material.dart';

import '../../../constants.dart';

class SendMoneyTextFieldUsername extends StatefulWidget {
  SendMoneyTextFieldUsername({Key key}) : super(key: key);

  @override
  _SendMoneyTextFieldUsernameState createState() =>
      _SendMoneyTextFieldUsernameState();
}

class _SendMoneyTextFieldUsernameState
    extends State<SendMoneyTextFieldUsername> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.red,
          ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextFormField(
            maxLength: 30,
            decoration: InputDecoration(
              labelText: 'Username (Optional)',
              hintText: 'Username (Optional)',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
            ),
            textInputAction: TextInputAction.next,
            onChanged: (String text) {
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
