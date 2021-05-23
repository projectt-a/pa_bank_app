import 'package:flutter/material.dart';
import 'package:pa_bank_app/constants.dart';

class AddNewCardCloseButton extends StatefulWidget {
  AddNewCardCloseButton({Key key}) : super(key: key);

  @override
  _AddNewCardCloseButtonState createState() => _AddNewCardCloseButtonState();
}

class _AddNewCardCloseButtonState extends State<AddNewCardCloseButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 1),
      child: Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            height: 50,
            width: 50,
            child: IconButton(
                iconSize: 30,
                icon: Icon(
                  Icons.highlight_off,
                  color: kPrimaryColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          )),
    );
  }
}
