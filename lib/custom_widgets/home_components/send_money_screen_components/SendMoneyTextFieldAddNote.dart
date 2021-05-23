import 'package:flutter/material.dart';

import '../../../constants.dart';


class SendMoneyTextFieldAddNote extends StatefulWidget {
  SendMoneyTextFieldAddNote({Key key}) : super(key: key);

  @override
  _SendMoneyTextFieldAddNoteState createState() =>
      _SendMoneyTextFieldAddNoteState();
}

class _SendMoneyTextFieldAddNoteState extends State<SendMoneyTextFieldAddNote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.teal,
          ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextFormField(
            maxLength: 40,
            decoration: InputDecoration(
              labelText: 'Add a note',
              hintText: 'Add a note',
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
